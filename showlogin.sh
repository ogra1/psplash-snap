#! /bin/sh

IP="$(ip route show 0.0.0.0/0 | sed 's/^.*src //;s/  metric.*$//')"
USER="$(grep :1000: /var/lib/extrausers/passwd | sed 's/:x.*$//g')"

exec ${SNAP}/psplash-write "MSG To log in remotely use the command: ssh ${USER}@${IP}"

