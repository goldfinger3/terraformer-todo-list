az group create -n chickenwingstastegood -l westus2

az ad sp create-for-rbac --query "{ client_id: appId, client_secret: password, tenant_id: tenant }"

az account show --query "{ subscription_id: id }"


"client_id": "6e13a66a-830a-4668-bff9-f364b04d37c4",
"client_secret": "fe43a399-2e6e-48c8-a922-d718628eaee9",
"tenant_id": "2f49592e-1a6a-48f0-a3fe-d7c6e268b749",
"subscription_id": "b4764ce3-a17b-42e0-a15f-31bf84451bc0"


