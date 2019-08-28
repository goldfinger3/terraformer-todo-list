GROUPNAME="adrons-kubbies"
LOCATION="westus2"

terraform apply -auto-approve -var "test=$LOCATION" -var "res_group=$GROUPNAME"