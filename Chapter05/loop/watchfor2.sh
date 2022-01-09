#!/usr/bin/env bash
# watch for someone to log in

until who|grep mary
do
    sleep 60
done