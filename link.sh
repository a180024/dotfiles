#!/bin/bash

find ~+ -type f -name ".*" -exec ln -sv {} ~ \;
