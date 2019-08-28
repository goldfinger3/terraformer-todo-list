GROUPNAME="adrons-kubbies"
LOCATION="westus2"

terraform destroy -var "test=$LOCATION" -var "res_group=$GROUPNAME"
