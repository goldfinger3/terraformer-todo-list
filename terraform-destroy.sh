GROUPNAME="adrons-kubbies"
LOCATION="westus2"
LOCATIONLONG="West US 2"

terraform destroy -var "locationlong=$LOCATIONLONG" -var "res_group=$GROUPNAME" -var "location=$LOCATION"
