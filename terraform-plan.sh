GROUPNAME="adrons-kubbies"
LOCATION="westus2"
LOCATIONLONG="West US 2"
IMAGECASSANDRA="basecassandra"
IMAGEDSE="basedatastaxenterprise"

terraform plan \
   -var "locationlong=$LOCATIONLONG" \
   -var "res_group=$GROUPNAME" \
   -var "location=$LOCATION" \
   -var "imagenameCassandra=$IMAGECASSANDRA" \
   -var "imagenameDataStaxEnterprise=$IMAGEDSE"