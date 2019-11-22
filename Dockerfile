FROM binujacobc/django

RUN apt-get update && \
    apt-get upgrade -y 

COPY app/requirements.txt /home/docker/code/app/

RUN pip3 install -r /home/docker/code/app/requirements.txt

# add (the rest of) our code
COPY . /home/docker/code/

EXPOSE 80
CMD ["supervisord", "-n"]
