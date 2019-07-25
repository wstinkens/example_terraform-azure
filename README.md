# example_terraform-azure
A simple example to deploy Azure resources with Terraform

## Requirements

### Azure Service Principal

To authenticate Terraform to Azure, a Service Principal is required.

Login to the Azure CLI

```
az login
```

Specify the subscription

```
az account set --subscription="SUBSCRIPTION_ID"
```

Create the Service Principal with contributor permissions on the subscription

```
az ad sp create-for-rbac --role="Contributor" --scopes="/subscriptions/SUBSCRIPTION_ID"
```

This command will output 5 values:

```

{
  "appId": "00000000-0000-0000-0000-000000000000",
  "displayName": "azure-cli-2017-06-05-10-41-15",
  "name": "http://azure-cli-2017-06-05-10-41-15",
  "password": "0000-0000-0000-0000-000000000000",
  "tenant": "00000000-0000-0000-0000-000000000000"
}
```

These values map to the Terraform variables like so:

```
    appId is the az_client_id defined below.
    password is the az_client_secret defined below.
    tenant is the az_tenant_id defined below.
```

### terraform.tfvars

The file terraform.tfvars needs to be created in the root and populated with the following variables:

```
az_subscription_id = "xxxxxxx-xxxx-xxxx-xxxx-xxxxxxxxxxx"
az_client_id = "xxxxxxx-xxxx-xxxx-xxxx-xxxxxxxxxxx"
az_client_secret = "xxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx"
az_tenant_id = "xxxxxxx-xxxx-xxxx-xxxx-xxxxxxxxxxx"
```