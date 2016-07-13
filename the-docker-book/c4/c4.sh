docker run -i -t --name another_container_mum ubuntu /bin/bash

# list all of the images locally downloaded
docker images

# pull specific version of image
docker pull ubuntu:12.04

# run specific version of image
docker run -t -i --name new_container ubuntu:12.04 /bin/bash

# pull down some fedora images
docker pull fedora:20
docker pull fedora:21

# list specific image versions
docker images fedora

# search docker registry
docker search puppet

# pull public repo from docker hub
docker pull jamtur01/puppetmaster

# run that repo
docker run -i -t jamtur01/puppetmaster /bin/bash

# login to docker hub
docker login
# docker logout

# commit to docker hub
docker run -i -t ubuntu /bin/bash
# inside
apt-get -yqq update
apt-get -y install apache2
# get and save hostname
hostname
exit

# commit last created container
docker commit `docker ps -l -q` mjgil32/apache2

# add comments // author to docker commit
docker commit -m "A new custom image" -a "Malcom Gilbert" `docker ps -l -q` mjgil32/apache2:webserver

# docker inspect newly created image
docker inspect mjgil32/apache2:webserver

# run container from new image
docker run -t -i mjgil32/apache2:webserver /bin/bash

cd static_web
# build docker image and save online
docker build -t="mjgil32/static_web" .

# build with a tag
docker build -t="mjgil32/static_web:v1" .

# build from github repo
docker build -t="mjgil32/static_web:git" git@github.com:mjgil/docker-static_web

# build from file path
# docker build -t "jamtur01/static_web" -f /path/to/file

# run from last commit before failure
docker run -t -i 997485f46ec4 /bin/bash

# build and ignore the cache
docker build --no-cache -t="mjgil32/static_web" .

# look at created images
docker images mjgil32/static_web

# look at cmd history
docker history f636d98718cb

# make new container from image
docker run -d -p 80 --name static_web mjgil32/static_web nginx -g "daemon off;"

# look at docker port mapping
docker ps -l

# use docker port command
docker port `docker ps -l -q` 80
docker port static_web 80

# bind docker port 80 to host port 80
docker run -d -p 80:80 --name static_web mjgil32/static_web nginx -g "daemon off;"
# bind docker port 80 to host port 8080
docker run -d -p 8080:80 --name static_web mjgil32/static_web nginx -g "daemon off;"
# bind docker port 80 to host interface 127.0.0.1 port 80
docker run -d -p 127.0.0.1:80:80 --name static_web mjgil32/static_web nginx -g "daemon off;"
# bind docker port 80 to host interface 127.0.0.1 (random port)
docker run -d -p 127.0.0.1::80 --name static_web mjgil32/static_web nginx -g "daemon off;"

# publish port 80 on random port and all ports EXPOSEd in the docker file (-P)
docker run -d -P --name static_web mjgil32/static_web nginx -g "daemon off;"
# run specific cmd
docker run -i -t mjgil32/static_web /bin/true