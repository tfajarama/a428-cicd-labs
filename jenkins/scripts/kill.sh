#!/usr/bin/env sh

# Jeda aplikasi selama 1 menit setelah berhasil di deploy
sleep 60

echo 'The following command terminates the "npm start" process using its PID'
echo '(written to ".pidfile"), all of which were conducted when "deliver.sh"'
echo 'was executed.'
set -x
kill $(cat .pidfile)
