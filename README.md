From : https://github.com/dockerfiles/django-uwsgi-nginx


# Django, uWSGI and Nginx in a container, using Supervisord

This Dockerfile shows you *how* to build a Docker container with a fairly standard
and speedy setup for Django with uWSGI and Nginx.

uWSGI from a number of benchmarks has shown to be the fastest server 
for python applications and allows lots of flexibility. But note that we have
not done any form of optimalization on this package. Modify it to your needs.

Nginx has become the standard for serving up web applications and has the 
additional benefit that it can talk to uWSGI using the uWSGI protocol, further
eliminating overhead. 



### Build and run
#### Build with python3
* `docker build -t webapp .`
* `docker run -d -p 80:80 webapp`
* go to your domain/IP to see if works



### How to insert your application

In /app currently a django project is created with startproject. You will
probably want to replace the content of /app with the root of your django
project. 

uWSGI chdirs to /app so in uwsgi.ini you will need to make sure the python path
to the wsgi.py file is relative to that.
