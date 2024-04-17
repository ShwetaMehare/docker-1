FROM centos:7
RUN yum update -y
RUN yum install java-openjdk -y 
ADD https://dlcdn.apache.org/tomcat/tomcat-9/v9.0.88/bin/apache-tomcat-9.0.88.tar.gz /opt
WORKDIR /opt
RUN tar -xzvf apache-tomcat-8.5.88.tar.gz -C /opt
WORKDIR /opt/apache-tomcat-9.0.88/bin/
ADD https://s3-us-west-2.amazonaws.com/studentapi-cit/student.war /opt/apache-tomcat-8.5.88/webapps
ENV name="student-app-prod"
EXPOSE 8080
CMD [ "./catalina.sh","run" ]