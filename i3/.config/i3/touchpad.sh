#!/bin/bash

DEVICE_ID=12

# one finger tap = left click
xinput set-prop $DEVICE_ID "libinput Tapping Enabled" 0
# two finger tap = right click
xinput set-prop $DEVICE_ID "libinput Click Method Enabled" 0 1


