# Notes on django web CMS 

tutorial based on https://docs.djangoproject.com/en/1.7/intro/tutorial01/

install
```
pip install django
```

begin a new project in gitbash or windows

```
django-admin startproject mysite
```

or on windows
```
python c:\python27\scripts\django-admin.py startproject tango_with_django_project
python /c/python27/scripts/django-admin.py startproject tango_with_django_project
```

keep python code in another directory other than the mysite directory such as /home/mycode

create database tables, may need to run before starting the server
```
python manage.py migrate
```

starts a python development server, rather than having to set up a production server like an Apache server
```
python manage.py runserver
```

change port
```
python manage.py runserver 8080
```

change IP
```
python manage.py runserver 0.0.0.0:8000
```

Project where an 'app' is a web application  that does something, where a project is a collection of config and apps for a particular website. A project can contain multiple apps, and an app can be in multiple projects
 
**process to make model changes**

1. change the models in models.py
2.  run 'python manage.py makemigrations' to create migrations for those changes
3. run 'python manage.py migrate' to apply those changes to the database

show where the django files are in bash
```
python -c "import sys ; sys.path = sys.path[1:] ; import django ; print(django.__path__)"
```

everytime a new app is added to the project, run
```
python manage.py syncdb
```


# Python Web Development with Django by Jeff Forcier

to run django in the python shell, run this specialized shell
```
python manage.py  shell
```


