# fodder commands run throughout the chapter
# run cmd on launch 
# can only use one per dockerfile
# overridden with docker run ... cmd
CMD ["/bin/true"]
CMD ["/bin/bash", "-l"]
CMD [ "/bin/bash" ]
# run cmd (not easily overridden)
ENTRYPOINT ["/usr/sbin/nginx"]
ENTRYPOINT ["/usr/sbin/nginx", "-g", "daemon off;"]

# combine entrypoint + cmd
ENTRYPOINT ["/usr/sbin/nginx"]
CMD ["-h"]
# runs /usr/sbin/nginx -h

# workdir -- set the working directory for the4 container
# -w
# docker run -ti -w /var/log ubuntu pwd
WORKDIR /opt/webapp/db
RUN bundle install
WORKDIR /opt/webapp
ENTRYPOINT [ "rackup" ]

# env -- sets environment variables
# -e
# docker run -ti -e "WEB_PORT=8080" ubuntu env
ENV RVM_PATH /home/rvm/
RUN gem install unicorn
# RVM_PATH=/home/rvm gem install unicorn
ENV RVM_PATH /home/rvm/ RVM_ARCHFLAGS="-arch i386"

# use env variable to set workdir
ENV TARGET_DIR /opt/app
WORKDIR $TARGET_DIR

# user -- specifies the user to run as
USER nginx
# user:group variants
USER user
USER user:group
USER uid
USER uid:gid
USER user:gid
USER uid:group

# Volume -- add volume mount point to container
# • Volumes can be shared and reused between containers.
# • A container doesn’t have to be running to share its volumes.
# • Changes to a volume are made directly.
# • Changes to a volume will not be included when you update an image. 
# • Volumes persist until no containers use them.
VOLUME ["/opt/project"]
# add multiple volumes
VOLUME ["/opt/project", "/data"]

# add -- adds files to docker image
# if destination doesn't exist, creates it with 
# mode=0755 uid=0 gid=0
# add local files
ADD software.lic /opt/application/software.lic
# can add from url
ADD http://wordpress.org/latest.zip /root/wordpress.zip
# unpacks tar files
ADD latest.tar.gz /var/www/wordpress/

# copy -- like add but stupider
# no extraction, no urls, only local files
# i guess needed to copy tar files over
COPY conf.d/ /etc/apache2/

# label -- adds metadata to docker image
LABEL version="1.0"
LABEL location="New York" type="Data Center" role="Web Server"


# STOPSIGNAL -- valid number from kernal syscall table or name like SIGKILL

# ARG -- variables to be passed at build time
# docker build --build-arg build=1234 -t jamtur01/webapp .
ARG build
ARG webapp_user=user
# predefined values
# HTTP_PROXY
# http_proxy
# HTTPS_PROXY
# https_proxy
# FTP_PROXY
# ftp_proxy
# NO_PROXY
# no_proxy

# ONBUILD instructions
ONBUILD ADD . /app/src
ONBUILD RUN cd /app/src && make