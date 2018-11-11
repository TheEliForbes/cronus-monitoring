#!/bin/bash
# This script is intended to auto-define the tasks included in TICKscripts/
# This is necessary since the Kapacitor PR which attempts to better solve this, fails

for alert in ./stream/; do
    kapacitor define $alert \
        -type stream \
        -dbrp telegraf.autogen \
done