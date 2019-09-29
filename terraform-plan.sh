GROUPNAME="adrons-kubbies"
LOCATION="westus2"
LOCATIONLONG="West US 2"

terraform plan \
   -var "locationlong=$LOCATIONLONG" \
   -var "res_group=$GROUPNAME" \
   -var "location=$LOCATION"