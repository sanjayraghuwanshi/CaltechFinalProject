FROM ubuntu:latest
RUN apt-get update
RUN apt install -y vim
ADD target/CaltechDevOps-0.0.1-SNAPSHOT.jar CaltechDevOps-0.0.1-SNAPSHOT.jar
CMD "/bin/bash"