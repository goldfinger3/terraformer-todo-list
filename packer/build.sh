GROUPNAME="adrons-images"
LOCATION="westus2"
STORAGENAME="adronsimagestorage"

echo 'Creating the managed resource group for images.'

az group create --name $GROUPNAME --location $LOCATION

echo 'Creating the storage account for image storage.'

az storage account create \
 --name $STORAGENAME --resource-group $GROUPNAME \
 --location $LOCATION \
 --sku Standard_LRS \
 --kind Storage

echo 'Building Apache cluster node image.'

# az ad sp create-for-rbac -n "Packer" --role contributor \
#                             --scopes /subscriptions/{SubID}

packer build node.json