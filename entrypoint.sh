#!/bin/sh -l

##printenv
##echo "::group::Input Variables"
echo "User $INPUT_USER"
echo "Fingerprint $INPUT_FINGERPRINT"
echo "Tenancy $INPUT_TENANCY"
echo "Region $INPUT_REGION"
echo "API Key $INPUT_API_KEY"
##echo "::endgroup::"

##echo "::group::Install OCI CLI"
curl -L -O https://raw.githubusercontent.com/oracle/oci-cli/master/scripts/install/install.sh
chmod +x install.sh
./install.sh --accept-all-defaults
##echo "::endgroup::"

##echo "::group::Create OCI config file"
echo "[default]" > ~/.oci/config
echo "user=$INPUT_USER" >> ~/.oci/config
cat ~/.oci/config
##echo "::endgroup::"

time=$(date)
echo ::set-output name=time::$time
