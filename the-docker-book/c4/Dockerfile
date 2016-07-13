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
