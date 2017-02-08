''' access via http://localhost:8080/generate?length=16  '''

import random
import string
import cherrypy

class StringGenerator(object):

    @cherrypy.expose
    def index(self):
        return "hello world"

    @cherrypy.expose
    def generate(self,length = 16 ):
        return ''.join(random.sample(string.hexdigits, int(length)))

if __name__ == '__main__':
    cherrypy.quickstart(StringGenerator())