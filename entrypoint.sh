#!/bin/sh -l

echo "OCI User $_ENV['INPUT_USER']"
time=$(date)
echo ::set-output name=time::$time
