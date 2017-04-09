#FROM ubuntu
#MAINTAINER ndravi17@gmail.com
#COPY CounterWebApp/target/CounterWebApp.war /


FROM ubuntu:14.04
MAINTAINER ndravi@gmail.com
RUN apt-get -y update
RUN apt-get -y install default-jdk tomcat7
ENV CATALINA_BASE /var/lib/tomcat7
RUN ln -s /usr/share/tomcat7/bin/catalina.sh /usr/local/bin/catalina.sh
COPY docker-entrypoint.sh /docker-entrypoint.sh
RUN chmod 777 /docker-entrypoint.sh
ADD CounterWebApp/target/CounterWebApp.war /war/libs/tomcat7/webapps
expose 8080
entrypoint ["/docker-entrypoint.sh"]
