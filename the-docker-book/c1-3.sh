#!/bin/bash
docker run -i -t ubuntu /bin/bash

# inside container
cat /etc/hosts
ip a
ps -aux
apt-get update && apt-get install vim
#

# create a named container
docker run --name bob_the_container -i -t ubuntu /bin/bash
docker start bob_the_container

# create a long running container
docker run --name daemon_dave -d ubuntu /bin/sh -c "while true; do echo hello world; sleep 1; done"
# tail the logs
docker logs daemon_dave
# follow the log trail
docker logs -f daemon_dave
# follow the log trail with timestamp
docker logs -ft daemon_dave

# start syslog on docker toolbox
docker-machine ssh
# inside ssh
syslogd
# create a long running container and log to syslog
docker run --log-driver="syslog" --name daemon_dwayne -d ubuntu /bin/sh -c "while true; do echo hello world; sleep 1; done"

# inspect running processes
docker top daemon_dwayne

# get stats on running container
docker stats daemon_dwayne

# run background task
docker exec -d daemon_dave touch /etc/new_config_file
# stop running container
docker stop daemon_dave

# look at last x process regardless of state
docker ps -n 5

docker rm daemon_dave
# always restart container
docker run --restart=always --name daemon_dave -d ubuntu bin/sh -c "while true; do echo hello world; sleep 1; done"
# --restart=on-failure:5

# inspect container
docker inspect daemon_dave
# inspect by path
docker inspect --format='{{ .State.Running }}' daemon_dave
# inspect multiple paths/containers
docker inspect --format '{{.Name}} {{.State.Running}}' daemon_dave bob_the_container

# delete all containers
docker rm `docker ps -a -q`

# force delete all containers
docker rm -f `docker ps -a -q`

# stop all containers
docker stop `docker ps -a -q`

