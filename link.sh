#!/bin/bash

find . -type f -name '.*' -exec ln -sv ~ {} \;
       	
#alternatively, find . -name ".*" -print0 | while read -d $\0' file do ... using "$file" done
