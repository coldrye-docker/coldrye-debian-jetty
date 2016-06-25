
# coldrye-debian-jetty

## Description

This provides Jetty based on coldrye/debian-openjdk-headless:8-*-latest.


## Image Releases

Images are released for the following debian releases.

- jessie
  jetty9 is from jessie-backports
- testing (stretch)

See https://hub.docker.com/r/coldrye/debian-jetty/tags/ for a complete list.


## Usage

### Deployment

Webapps are deployed to ``/var/lib/jetty/webapps/``. Any external jars need to be added to ``/var/lib/jetty/ext/``.

One can provide additional JVM or other configuration options by adding a ``/etc/default/jetty.extra`` configuration file.

For a working solution see https://github.com/coldrye-docker/coldrye-debian-archiva.


## TODO

- ATM this utilizes the Jetty releases that are provided by the Debian maintainers. In the future this will support
various permutations of Jetty and JDK releases where the Jetty releases are fetched from the official site instead of
from the Debian repositories.

- Logging

- Replace service start script by a custom one

