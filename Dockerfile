FROM dock0/nginx
MAINTAINER akerl <me@lesaker.org>
ADD site.conf /etc/nginx/sites/keysite.conf
RUN git clone git://github.com/akerl/keys /srv/keys
RUN find -L /srv/keys/default -type f -exec cat {} \; > /srv/keys/index.txt
RUN awk '{print length, $0}' /srv/keys/index.txt | sort -n | cut -d " " -f2- | tee /srv/keys/index.txt
