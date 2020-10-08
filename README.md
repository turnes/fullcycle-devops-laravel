# Laravel Nginx Redis MySQL

[https://hub.docker.com/repository/docker/turnes/fullcycle-devops-laravel](https://hub.docker.com/repository/docker/turnes/fullcycle-devops-laravel)


## Build
docker build -t turnes/fullcycle-devops-laravel:latest .
docker push turnes/fullcycle-devops-laravel

## Run
docker run -dit --rm -p 8000:8000 --name my-laravel turnes/fullcycle-devops-laravel

## remove
docker rm -f my-laravel