GROUPNAME="adrons-images"
LOCATION="westus2"
STORAGENAME="adronsimagestorage"
IMAGECASSANDRA="basecassandra"

echo 'Deleting existing image.'

az image delete -g $GROUPNAME -n $IMAGECASSANDRA

echo 'Creating the managed resource group for images.'

az group create --name $GROUPNAME --location $LOCATION

echo 'Creating the storage account for image storage.'

az storage account create \
 --name $STORAGENAME --resource-group $GROUPNAME \
 --location $LOCATION \
 --sku Standard_LRS \
 --kind Storage

echo 'Building Apache cluster node image.'

packer build -var 'imagename='$IMAGECASSANDRA node-cassandra.json