#nginx
FROM nginx:stable-alpine
COPY ./dist /usr/share/nginx/html
COPY ./nginx.conf /etc/nginx/nginx.conf
EXPOSE 80
CMD ["nginx", "-g", "daemon off;"]

#docker
FROM jenkins/jenkins:lts-jdk17
USER root
# Install docker CLI
RUN apt-get update && \
    apt-get install -y docker.io && \
    rm -rf /var/lib/apt/lists/*
# Balik ke user jenkins
USER jenkins
