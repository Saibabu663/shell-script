#!/bin/bash

course="DevOps from Current Script"

echo "Before Calling other script, course: $COURSE"
echo "Process ID of current shell script: $$"

./16-other-script.sh

echo "After calling other script, course: $COURSE"
