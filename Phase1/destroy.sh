GROUPNAME="adrons-images"
LOCATION="westus2"
STORAGENAME="adronsimagestorage"
# Images
IMAGECASSANDRA="basecassandra"
IMAGEDSE="basedatastaxenterprise"

echo 'Deleting existing images.'

az image delete -g $GROUPNAME -n $IMAGECASSANDRA
az image delete -g $GROUPNAME -n $IMAGEDSE

echo 'Deleteing storage account.'

az storage account delete \
 --name $STORAGENAME \
 --resource-group $GROUPNAME \
 --yes
