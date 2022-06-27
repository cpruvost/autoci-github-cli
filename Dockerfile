# Container image that runs your code
FROM oraclelinux:8-slim

#Enable dev package
RUN dnf -y install oraclelinux-developer-release-el8

#OCI CLI
RUN dnf -y install python36-oci-cli

# Copies your code file from your action repository to the filesystem path `/` of the container
COPY entrypoint.sh /entrypoint.sh

# Code file to execute when the docker container starts up (`entrypoint.sh`)
ENTRYPOINT ["/entrypoint.sh"]
