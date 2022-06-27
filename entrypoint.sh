#!/bin/sh -l

echo "::group::List Env Variables"
printenv
echo "::endgroup::"

echo "::group::Input Variables"
echo "User $INPUT_USER"
echo "Fingerprint $INPUT_FINGERPRINT"
echo "Tenancy $INPUT_TENANCY"
echo "Region $INPUT_REGION"
echo "API Key $INPUT_API_KEY"
echo "::endgroup::"

echo "::group::Install OCI CLI"
curl -L -O https://raw.githubusercontent.com/oracle/oci-cli/master/scripts/install/install.sh
chmod +x install.sh
./install.sh --accept-all-defaults
echo "::endgroup::"

echo "::group::Create OCI config file"
mkdir ~/.oci
echo "$INPUT_API_KEY" > ~/.oci/key.pem
echo "[DEFAULT]" > ~/.oci/config
echo "user=$INPUT_USER" >> ~/.oci/config
echo "fingerprint=$INPUT_FINGERPRINT" >> ~/.oci/config
echo "key_file=~/.oci/key.pem" >> ~/.oci/config
echo "tenancy=$INPUT_TENANCY" >> ~/.oci/config
echo "region=$INPUT_REGION" >> ~/.oci/config
cat ~/.oci/config
echo "::endgroup::"

echo "::group::Repair OCI File"
/github/home/bin/oci setup repair-file-permissions --file ~/.oci/config
/github/home/bin/oci setup repair-file-permissions --file ~/.oci/key.pem
echo "::endgroup::"

echo "::group::OCI CLI Version"
/github/home/bin/oci -v
echo "::endgroup::"

echo "::group::Region List"
/github/home/bin/oci iam region list
echo "::endgroup::"

echo "::group::inlineScript execution"
echo "script lines: $INPUT_INLINESCRIPT[1]"
echo "::endgroup::"

time=$(date)
echo ::set-output name=time::$time
