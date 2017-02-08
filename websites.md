# Websites
A collection of html documents and are accessed through a webrowser. The files can be static HTML, HTML generated via PHP, page updates using AJAX and JSON sata, or flash and java plugins dynamically getting content from the webserver

## Understanding Websites
###Webservers
Some examples of webservers

 - List item
 - lighttpd
 - nginx
 - apache
 - tornado
 - SimpleHTTPServer

###Content Management Systems
Once you have a webserver running, you need a CMS program to manage your content
Alternatively you can just host a static website without a CMS

 - Drupal (PHP CMS )
 - Wordpress (PHP CMS )
 - Joomla

Things to investigate

 - HTML5 

- - - -
## Apache webservers
http://httpd.apache.org/docs/2.4/getting-started.html
### Getting Started
* URL - uniform resource locators which specify 
	* protocol (eg HTTP), 
	* servername (eg www.apache.com)
	* url path (/docs/current/getting-started.html
	* possibly a query string ( ?arg=value)
* a client, such as a web browser connects to a server
* a url path may represent 

#### Hostnames and DNS
The hostname is where the server resides on the internet. More than one hostname may point to the same IP address, and more the one IP address can be attached the the same physical server using virtual hosts

For local tests without intern accessibility, you can put the host names in your hosts file ```/etc/hosts``` 
```bash
127.0.0.1 www.example.com
# or commonly
127.0.0.1 localhsot
```



####Apache file config


####Apache website content
content is stored in ```/var/www/html/site1/```  
