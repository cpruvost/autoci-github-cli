# Github Action for Oracle Cloud Infrastructure CLI

With Github Action for Oracle Cloud Infrastructure CLI, you can automate your workflow by executing OCI CLI commands to manage OCI resources inside of an Action.

## Inputs

### `oci-user`

**Required** The oci id of the user. Ex `"ocid1.user.oc1..aaaaaaaaxxx........."`.

## Outputs

### `version`

The latest OCI CLI version installed.

## Example usage

```yaml
- name: Install oci-cli
  uses: cpruvost/autoci-github-cli@v1.0.0
  with:
    user: "${{ secrets.OCI_USER }}"
```
