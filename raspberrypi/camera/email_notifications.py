# -*- coding: utf-8 -*-
"""
Created on Mon Jan 19 21:16:28 2015

@author: neal

pg 129 python email notification with camera


"""

import smtplib

from email.mime.image import MIMEImage
from email.mime.multipart import MIMEMultipart

class EmailNotification:
    def __init__(self, server, user, pwd):
        self.server = server
        self.user = user
        self.pwd = pwd
        self.subject = 'INTRUDER ALERT!'
        self.from_addr = 'me@example.com'
        self.to_addr = 'alert@example.com'
    
    def send(self, image_file):
        msg = MIMEMultipart()
        msg[ 'Subject' ] = self.subject
        msg[ 'From' ] = self.from_addr
        msg[ 'To' ] = self.to_addr
        msg.preamble = self.subject
        msg.attach(self.__read_image(image_file))
        self.__send_email(msg)
    
    def __read_image(self, image_file):
        attachment = open(image_file, 'rb' )
        image_data = MIMEImage(attachment.read())
        attachment.close()
        return image_data
    
    def __send_email(self, msg):
        server = smtplib.SMTP(self.server)
        server.ehlo()
        server.starttls()
        server.login(self.user, self.pwd)
        server.sendmail(self.from_addr, self.to_addr, msg.as_string())
        server.quit()