#!/bin/sh -l

printenv
echo "OCI User" + $_ENV['INPUT_USER']
time=$(date)
echo ::set-output name=time::$time
