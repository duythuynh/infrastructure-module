provider "azurerm" {
  skip_provider_registration = true
  use_msi = false
  features {
    log_analytics_workspace {
      permanently_delete_on_destroy = true
    }
  }
}

resource "azurerm_resource_group" "demo_frontend_resources" {
  name     = "demo-frontend-resources"
  location = "East Asia"
}

resource "azurerm_static_site" "duythuynh_app_static_demo" {
  name                = "duythuynh-app-static-demo-1"
  resource_group_name = azurerm_resource_group.demo_frontend_resources.name
  location            = "East Asia"
  sku_tier = var.sku_tier_value
}

variable "sku_tier_value" {
  default = ""
}

# git tag -a "v0.0.1" -m "First release of front-end app infra"
# git push --follow-tags