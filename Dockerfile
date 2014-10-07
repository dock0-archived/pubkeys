FROM dock0/nginx
MAINTAINER akerl <me@lesaker.org>
ADD site.conf /etc/nginx/sites/keysite.conf
ADD keys /srv/keys
RUN find -L /srv/keys/default -type f -exec cat {} \; \
    | awk '{print length, $0}' \
    | sort -n \
    | cut -d " " -f2- \
    | tee /srv/keys/index.txt

