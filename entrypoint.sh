#!/bin/sh -l

printenv
echo "OCI User $INPUT_USER"
time=$(date)
echo ::set-output name=time::$time
