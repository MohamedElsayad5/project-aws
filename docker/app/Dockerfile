FROM tomcat:10-alpine

RUN rm -rf /usr/local/tomcat/webapps/ROOT && \
    mkdir -p /usr/local/tomcat/webapps/ROOT && \
    echo '{"status":"UP"}' > \
    /usr/local/tomcat/webapps/ROOT/actuator/health/liveness/index.html && \
    echo '{"status":"UP"}' > \
    /usr/local/tomcat/webapps/ROOT/actuator/health/readiness/index.html

EXPOSE 8080

CMD ["catalina.sh", "run"]