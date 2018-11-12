#!/bin/sh
# This script is intended to auto-define the tasks included in TICKscripts/
# This is necessary since the Kapacitor PR which attempts to better solve this, fails

for alert in ./stream/*.tick; do
    name="$(basename $alert)"
    kapacitor define $name \
        -type stream \
        -dbrp telegraf.autogen \
        -tick $alert
    kapacitor enable $name
done