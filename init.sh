#!/bin/sh

echo "USER_HOME=$HOME" > .env
echo "USER_ID=$(id -u $USER)" >> .env
echo "HOSTNAME=$(hostnamectl hostname)" >> .env
echo "USER_DBUS_SESSION_BUS_ADDRESS=${DBUS_SESSION_BUS_ADDRESS#*=}" >> .env
echo "USER_PULSE_SERVER=/var/run/user/$(id -u $USER)/pulse/native" >> .env
