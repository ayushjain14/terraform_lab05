terraform {
    backend "azurerm"{
        resource_group_name = "tfstates-RG"
        storage_account_name = "tfstates2"
        container_name = "tfstatecont"
        key = "LLoma6EY4XZ0g2/G9+pFg5Jveu8mBqpwdYaXQa3I8MIjwG/jFXL2mqUbsXbZDx3HawWA16WkLp8lbLrz6YO0kw=="
    }
}
