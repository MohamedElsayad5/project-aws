FROM tomcat:10-alpine

RUN rm -rf /usr/local/tomcat/webapps/ROOT && \
    mkdir -p /usr/local/tomcat/webapps/ROOT && \
    echo "<h1>App Running</h1>" > /usr/local/tomcat/webapps/ROOT/index.html

EXPOSE 8080
CMD ["catalina.sh", "run"]