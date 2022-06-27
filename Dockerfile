# Container image that runs your code
FROM ubuntu:latest

#DO NOT USE CAUSE TOO LONG : 1min20s
#Enable dev package
#RUN microdnf -y install oraclelinux-developer-release-el8
#OCI CLI
#RUN microdnf -y install python36-oci-cli

#Install Curl
RUN apt-get update \
  && apt-get install -y curl

# Copies your code file from your action repository to the filesystem path `/` of the container
COPY entrypoint.sh /entrypoint.sh

# Code file to execute when the docker container starts up (`entrypoint.sh`)
ENTRYPOINT ["/entrypoint.sh"]
