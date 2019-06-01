# Alpine-Cloud-Utilities
Docker image for a cloud development environment using alpine-linux.

## Components
* Python3
* Pip
* Aws-cli
* Azure-cli
* OCI-cli
* Terraform
* Boto3
* Ansible

## Running the containter
docker run -ti --name dev --hostname dev -v host_path_to_mount:docker_path_to_mount kolxd/alpine-cloud-utilities bash
