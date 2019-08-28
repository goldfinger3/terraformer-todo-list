GROUPNAME="adrons-images"
LOCATION="westus2"
STORAGENAME="adronsimagestorage"
IMAGECASSANDRA="basecassandra"

echo 'Deleting existing image.'

az image delete -g $GROUPNAME -n $IMAGECASSANDRA

az storage account delete \
 --name $STORAGENAME
 --resource-group $GROUPNAME
 --yes