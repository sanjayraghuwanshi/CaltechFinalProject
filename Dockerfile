FROM sanjayraghuwanshi/caltechfinalproject:v2
LABEL maintainer=”raghu1c.sanjay@gmail.com”
ADD tomcat-users.xml /usr/share/tomcat8/etc/tomcat-users.xml
ADD target/CaltechDevOps-0.0.1-SNAPSHOT.war /usr/local/tomcat/webapps/
EXPOSE 8080
