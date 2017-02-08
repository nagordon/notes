# Web2py is a python CSM program

Applications developed in web2py are composed of the following parts  

 - models - a representation of the data as databse tables and relations between tables
 - controllers - describe the application and logic
 - views - describe how data should be presented to the user using HTML and JavaScript

launch web2py service in bash
```
python web2py.py -S welcome
```

request.vars.visitor_name is a local variable
session.visitor_name is stored in the database


the python files are models for the website, the html files are the gui front endswith, python file function within the file     html file

dafault view , simple_examples.py -    def hello3                  simple_examples/hello3.html
                     /[controller]/[function].html.
http://127.0.0.1:8000/examples/simple_examples/hello3

beautify turns python lists and dictionaries into HTML

 another example of how the code is mapped

web2py maps a url of the form to the function f() in controller c.py in appliction a. If f is not present, web2py defaults to the index controller function. if c is not present, web2py defaults to the default.py controller, and if a is not present , web2py defaults to the init application

http://127.0.0.1:8000/a/c/f.html


### python code in enclosed in {{ }}
<html><body>
{{for x in range(10):}}{{=x}}hello<br />{{pass}}
</body></html>
# and is translted into
response.write("""<html><body>""", escape=False)
for x in range(10):
response.write(x)
response.write("""hello<br />""", escape=False)
response.write("""</body></html>""", escape=False)

# this is translated to 
{{=x}}
# generating 
response.write(x)
