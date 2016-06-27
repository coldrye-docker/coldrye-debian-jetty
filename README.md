# coldrye-debian-jetty

[![coldrye/debian-jetty](http://dockeri.co/image/coldrye/debian-jetty)](https://hub.docker.com/r/coldrye/debian-jetty/)


## Description

This provides Jetty based on coldrye/debian-jdk-headless.


## Image Releases

Images are released for the following debian releases.

- jessie
- testing (stretch)

See https://hub.docker.com/r/coldrye/debian-jetty/tags/ for a complete list.


## Deployment

Webapps are deployed to ``/var/lib/jetty/webapps/``. Any external jars need to be added to ``/var/lib/jetty/ext/``.

Defaults can be overridden by providing a custom ``/etc/default/jetty`` configuration file.

For a working solution see https://github.com/coldrye-docker/coldrye-debian-archiva.

