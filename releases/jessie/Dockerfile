FROM coldrye/debian-openjdk-headless:8-jessie-latest

MAINTAINER Carsten Klein <trancesilken@gmail.com>

RUN set -x \
    && export APT_LISTCHANGES_FRONTEND=none \
    && apt-get update \
    && apt-get -q -y -o Dpkg::Options::="--force-confdef" -o Dpkg::Options::="--force-confold" -t jessie-backports install jetty9 \
    && rm -Rf /var/lib/jetty9/webapps/root \
    && ln -s /usr/share/jetty9 /usr/share/jetty \
    && ln -s /var/lib/jetty9 /var/lib/jetty \
    && ln -s /usr/share/jetty/lib/ext /var/lib/jetty/ \
    && apt-get clean \
    && rm -Rf /var/lib/apt/lists/* 2>/dev/null

ADD ["./etc/default/jetty9", "/etc/default/"]
ADD ["./etc/default/jetty.extra", "/etc/default/"]
ADD ["./etc/init.d/jetty9", "/etc/init.d/"]

# this must not detach
CMD ["service", "jetty9", "start"]

