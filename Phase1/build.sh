GROUPNAME="adrons-images"
LOCATION="westus2"
STORAGENAME="adronsimagestorage"
# Images
IMAGECASSANDRA="basecassandra"
IMAGEDSE="basedatastaxenterprise"

echo 'Deleting existing images for rebuild.'

az image delete -g $GROUPNAME -n $IMAGECASSANDRA
az image delete -g $GROUPNAME -n $IMAGEDSE

echo 'Creating the managed resource group for images.'

az group create --name $GROUPNAME --location $LOCATION

echo 'Creating the storage account for image storage.'

az storage account create \
 --name $STORAGENAME --resource-group $GROUPNAME \
 --location $LOCATION \
 --sku Standard_LRS \
 --kind Storage

echo 'Building Apache Cassandra Node Image.'

packer build -var 'imagename='$IMAGECASSANDRA -var 'adronsimagestorage='$STORAGENAME node-cassandra.json

echo 'Building DataStax Enterprise Node Image.'

packer build -var 'imagename='$IMAGEDSE -var 'adronsimagestorage='$STORAGENAME node-dse.json
