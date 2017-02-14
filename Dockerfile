FROM ubuntu

ENV COMPOSE_PROJECT_NAME test
ENV COMPOSE_FILE compose-child.yaml

# Just an image with docker and docker-compose installed
RUN apt-get update
RUN apt-get install -y --no-install-recommends apt-transport-https ca-certificates curl software-properties-common
RUN apt-key adv --keyserver hkp://p80.pool.sks-keyservers.net:80 --recv-keys 58118E89F3A912897C070ADBF76221572C52609D
RUN apt-add-repository 'deb https://apt.dockerproject.org/repo ubuntu-xenial main'
RUN apt-get update
RUN apt-get install -y --no-install-recommends python-pip python-setuptools docker-engine
RUN pip install docker-compose==1.10.1
RUN rm -rf /usr/share/python-wheels/requests*
ADD compose-child.yaml compose-child.yaml

CMD docker-compose --verbose up
