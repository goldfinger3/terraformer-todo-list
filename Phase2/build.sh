GROUPNAME="adrons-images"
LOCATION="westus2"
STORAGENAME="adronsimagestorage"
IMAGECASSANDRA="basecassandra"

kubectl config set-context default-system \
  --cluster=acctestaks1 \
  --user=adron

kubectl config use-context default-system

terraform init

terraform apply
