provider "azurerm" {
    subscription_id = "${var.az_subscription_id}"
    client_id       = "${var.az_client_id}"
    client_secret   = "${var.az_client_secret}"
    tenant_id       = "${var.az_tenant_id}"
}

resource "azurerm_resource_group" "example_rg" {
    name     = "example_rg"
    location = "${var.az_region}"

    tags = {
        environment = "Example"
    }
}
