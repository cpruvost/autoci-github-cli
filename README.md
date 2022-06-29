# Github Action (Docker) for Oracle Cloud Infrastructure CLI

NOTE : JUST USEFULL FOR TRAINING YOURSELF WITH A Github Docker Action. Do not use it. Use the javascript version instead !

With Github Action for Oracle Cloud Infrastructure CLI, you can automate your workflow by executing OCI CLI commands to manage OCI resources inside of an Action.

## Inputs

### `user`

**Required** The oci id of the user. Ex `"ocid1.user.oc1..aaaaaaaaxxx........."`.

### `fingerprint`

**Required** The fingerprint of API key. Ex `"4f:90:09:d7:2a:ea:81........."`.
### `tenancy`

**Required** The tenancy id of OCI. Ex `"ocid1.tenancy.oc1..aaaaaaaahrs4avamaxiscouye........"`.
### `region`

**Required** The region id of OCI. Ex `"eu-frankfurt-1"`.
### `region`

**Required** The region id of OCI. Ex `"eu-frankfurt-1"`.

### `api_key`

**Required** The api_key to access OCI. Ex `"-----BEGIN RSA PRIVATE KEY-----
MIIEogIBAAKCAQEAyCt82bSAeSWBtwK1razNApgDVvpVD1IfHUti+0n9X2ZTYb9k........"`.

### `inlineScript`

**Required** The oci cli commands to run. Ex `"oci iam region list"`.
## Outputs

### `result`

The result from OCI CLI

## Example usage

```yaml
- name: Install oci-cli
  uses: cpruvost/autoci-github-cli@v1.0.0
  with:
    user: "${{ secrets.OCI_USER }}"
     fingerprint: "${{ secrets.OCI_FINGERPRINT }}"
          tenancy: "${{ secrets.OCI_TENANCY }}"
          region: "${{ secrets.OCI_REGION }}"
          api_key: |
            ${{ secrets.OCI_API_KEY }}
          inlineScript: | 
            oci compute instance list --compartment-id=${{ secrets.OCI_COMPARTMENT }} --query 'data[*]."display-name"'

- run: |
    echo "Result: ${{ steps.runscript.outputs.result }}"
```
