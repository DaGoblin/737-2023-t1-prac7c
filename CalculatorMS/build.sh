set -ex
# SET THE FOLLOWING VARIABLES
# docker hub username
USERNAME=s222574652
# image name
IMAGE=kube_calculator_ms
docker build -t $USERNAME/$IMAGE:latest .

