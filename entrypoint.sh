#!/bin/sh -l

##printenv
##echo "::group::Input Variables"
echo "User $INPUT_USER"
echo "Fingerprint $INPUT_FINGERPRINT"
echo "Tenancy $INPUT_TENANCY"
echo "Region $INPUT_REGION"
echo "API Key $INPUT_API_KEY"
##echo "::endgroup::"

time=$(date)
echo ::set-output name=time::$time
