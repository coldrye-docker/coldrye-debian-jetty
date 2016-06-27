#!/bin/bash

JETTY_HOME=/usr/share/jetty
JETTY_SH=$JETTY_HOME/bin/jetty.sh
JETTY_STATE=/var/lib/jetty

kill_handler()
{
    $JETTY_SH stop
}

trap 'kill_handler' SIGINT SIGTERM SIGKILL

case $1 in
    start)
        $JETTY_SH start
        $0 status
        while true; do
            $JETTY_SH check >/dev/null || test -f $JETTY_STATE/reload || break
            sleep 1
        done
        ;;
    stop)
        $JETTY_SH stop
        ;;
    reload)
        echo "Reloading Jetty"
        touch $JETTY_STATE/reload
        $JETTY_SH stop >/dev/null
        $JETTY_SH start >/dev/null
        $0 check
        rm $JETTY_STATE/reload
        ;;
    status)
        $JETTY_SH check
        ;;
esac

