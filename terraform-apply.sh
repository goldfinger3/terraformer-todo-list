GROUPNAME="adrons-kubbies"
LOCATION="westus2"
LOCATIONLONG="West US 2"
IMAGECASSANDRA="basecassandra"
IMAGEDSE="basedatastaxenterprise"

RG_IMPORT=$(az group show --name adronsimages | jq -r '.id')
BASECASSANDRA=$(az image list | jq 'map({name: "basecassandra", id})' | jq -r '.[0].id')
BASEDSE=$(az image list | jq 'map({name: "basedse", id})' | jq -r '.[0].id')

terraform import azurerm_image.basedse $BASEDSE
terraform import azurerm_image.basecassandra $BASECASSANDRA
terraform import azurerm_resource_group.imported_adronsimages $RG_IMPORT

terraform apply -auto-approve \
   -var "locationlong=$LOCATIONLONG" \
   -var "res_group=$GROUPNAME" \
   -var "location=$LOCATION" \
   -var "imagenameCassandra=$IMAGECASSANDRA" \
   -var "imagenameDataStaxEnterprise=$IMAGEDSE"