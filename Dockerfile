FROM dock0/nginx
MAINTAINER akerl <me@lesaker.org>
ADD site.conf /etc/nginx/sites/blog.conf
RUN git clone git://github.com/akerl/keys /srv/keys
RUN find -L /srv/keys/default -type f -exec cat {} \; > /srv/keys/index.txt
