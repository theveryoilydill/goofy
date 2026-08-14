#!/bin/bash
set -e

# Start nginx as root so it can bind the browser-facing HTTP proxy port safely,
# then hand control over to the standard Kasm user startup flow.
/usr/sbin/nginx -g 'daemon off;' >/tmp/nginx.log 2>&1 &

sleep 2

exec su -s /bin/bash kasm-user -c '/dockerstartup/kasm_default_profile.sh /dockerstartup/vnc_startup.sh /dockerstartup/kasm_startup.sh --wait'
