FROM coldrye/debian-jdk-headless:8-testing-latest

MAINTAINER Carsten Klein <trancesilken@gmail.com>

ARG FEATURE_VERSION=

RUN test -z "$FEATURE_VERSION" && echo "FEATURE_VERSION missing" && exit 1 || true

EXPOSE 8080/tcp

RUN set -x \
    && export DIST_TMP=$(mktemp -d) \
    && export DIST_NAME=jetty-distribution-$FEATURE_VERSION \
    && export JETTY_HOME=/usr/share/jetty \
    && curl -fSL https://repo1.maven.org/maven2/org/eclipse/jetty/jetty-distribution/$FEATURE_VERSION/$DIST_NAME.tar.gz -o $DIST_TMP/$DIST_NAME.tar.gz \
    && cd $DIST_TMP \
    && tar xzf ./$DIST_NAME.tar.gz \
    && mv $DIST_NAME $JETTY_HOME \
    && ln -s $JETTY_HOME/etc /etc/jetty \
    && ln -s $JETTY_HOME/logs /var/log/jetty \
    && mkdir /var/lib/jetty \
    && ln -s $JETTY_HOME/webapps /var/lib/jetty/ \
    && ln -s $JETTY_HOME/lib/ext /var/lib/jetty/ \
    && rm -Rf $DIST_TMP

ADD ["./etc/default/jetty", "/etc/default/"]
ADD ["./run.sh", "/run.sh"]

# this must not detach
CMD /run.sh start

