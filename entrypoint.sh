#!/bin/sh -l

echo $_ENV
echo "OCI User" + $_ENV['INPUT_USER']
time=$(date)
echo ::set-output name=time::$time
