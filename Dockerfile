FROM tomcat:8.0-alpine
LABEL maintainer=”raghu1c.sanjay@gmail.com”
ADD target/CaltechDevOps-0.0.1-SNAPSHOT.jar /usr/local/tomcat/webapps/
EXPOSE 8080
CMD [“catalina.sh”, “run”]
