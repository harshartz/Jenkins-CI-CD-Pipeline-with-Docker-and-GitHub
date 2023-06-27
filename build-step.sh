#!/bin/bash

 container_id=$(docker ps --filter "status=running" --format "{{.ID}}")

 if [ -n "$container_id" ]; then
 docker cp /var/lib/jenkins/workspace/devops-project/. "$container_id":/usr/share/nginx/html
 else
 docker build -t server /var/lib/jenkins/workspace/devops-project
 docker run -d -p 9090:80 server
 fi
