GROUPNAME="adronsimages"
LOCATION="westus2"
STORAGENAME="adronsimagestorage"
# Images
IMAGECASSANDRA="basecassandra"
IMAGEDSE="basedatastaxenterprise"

echo 'Creating resource group for images.'
az group create -l $LOCATION -n $GROUPNAME

echo 'Deleting existing images for rebuild.'
az image delete -g $GROUPNAME -n $IMAGECASSANDRA
az image delete -g $GROUPNAME -n $IMAGEDSE

echo 'Creating the storage account for image storage.'
az storage account create \
 --name $STORAGENAME --resource-group $GROUPNAME \
 --location $LOCATION \
 --sku Standard_LRS \
 --kind Storage

echo 'Building Apache Cassandra Node Image.'

packer build -var 'imagename='$IMAGECASSANDRA -var 'adronsimagestorage='$STORAGENAME -var 'location='$LOCATION -var 'resource_group_name='$GROUPNAME node-cassandra.json

echo 'Building DataStax Enterprise Node Image.'

packer build -var 'imagename='$IMAGEDSE -var 'adronsimagestorage='$STORAGENAME -var 'location='$LOCATION 'resource_group_name='$GROUPNAME node-dse.json
