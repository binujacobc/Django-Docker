FROM binujacobc/django

MAINTAINER Dockerfiles

# Install required packages and remove the apt packages cache when done.

RUN apt-get update && \
    apt-get upgrade -y 



# COPY requirements.txt and RUN pip install BEFORE adding the rest of your code, this will cause Docker's caching mechanism
# to prevent re-installing (all your) dependencies when you made a change a line or two in your app.

COPY app/requirements.txt /home/docker/code/app/
#COPY app/website/ /home/docker/code/app/
RUN pip3 install -r /home/docker/code/app/requirements.txt

# add (the rest of) our code
COPY . /home/docker/code/


EXPOSE 80
CMD ["supervisord", "-n"]
