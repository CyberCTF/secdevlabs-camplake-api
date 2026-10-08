#!/bin/sh
# A user registers and logs in, and the API answers with a JWT (the token the lab is about).
set -e
user="probe$$"
curl -fsS -H 'Content-Type: application/json' -d "{\"username\":\"$user\",\"password\":\"probe-pass\"}" http://api:20001/register >/dev/null
curl -fsS -H 'Content-Type: application/json' -d "{\"username\":\"$user\",\"password\":\"probe-pass\"}" http://api:20001/login | grep -Eq 'eyJ[A-Za-z0-9_-]+\.[A-Za-z0-9_-]+\.'
