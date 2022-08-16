#!/bin/sh

socat \
    TCP-LISTEN:$1,crlf,reuseaddr,fork \
    SYSTEM:"
        echo 'HTTP/1.0 200 OK';
        echo 'Content-Type: text/plain';
        echo 'Connection: close';
        echo;
        echo 'Fake report: healthy';
    "
