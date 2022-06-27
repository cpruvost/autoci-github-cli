#!/bin/sh -l

##printenv
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
echo "/home/runner/bin" >> $GITHUB_PATH
exec -l $SHELL
echo "::endgroup::"

echo "::group::Create OCI config file"
mkdir ~/.oci
echo "$INPUT_API_KEY" > ~/.oci/key.pem
echo "[default]" > ~/.oci/config
echo "user=$INPUT_USER" >> ~/.oci/config
echo "fingerprint=$INPUT_FINGERPRINT" >> ~/.oci/config
echo "key_file=~/.oci/key.pem"
echo "tenancy=$INPUT_TENANCY" >> ~/.oci/config
echo "region=$INPUT_REGION" >> ~/.oci/config
cat ~/.oci/config
echo "::endgroup::"

echo "::group::Repair OCI File"
oci setup repair-file-permissions --file /home/runner/.oci/config
oci setup repair-file-permissions --file /home/runner/.oci/key.pem
echo "::endgroup::"

time=$(date)
echo ::set-output name=time::$time
