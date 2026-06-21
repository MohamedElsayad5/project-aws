FROM nginx:alpine

RUN rm -f /etc/nginx/conf.d/default.conf && \
    rm -f /etc/nginx/nginx.conf

RUN echo 'events { worker_connections 1024; } \
http { \
    server { \
        listen 80; \
        location / { \
            root /usr/share/nginx/html; \
            index index.html; \
            try_files $uri $uri/ /index.html; \
        } \
        location /health { \
            return 200 "ok"; \
            add_header Content-Type text/plain; \
        } \
        location /api/ { \
            proxy_pass http://app-service:8080/; \
        } \
    } \
}' > /etc/nginx/nginx.conf

RUN mkdir -p /usr/share/nginx/html && \
    echo "<h1>Graduation Project</h1>" > /usr/share/nginx/html/index.html

EXPOSE 80
CMD ["nginx", "-g", "daemon off;"]