provider "azurerm" {
  skip_provider_registration = true
  use_msi = false
  features {
    log_analytics_workspace {
      permanently_delete_on_destroy = true
    }
  }
}

resource "azurerm_resource_group" "demo_resources" {
  name     = "demo-apps-resources"
  location = "East Asia"
}

resource "azurerm_static_site" "duythuynh_app_static_demo" {
  name                = "duythuynh-app-static-demo"
  resource_group_name = "demo-apps-resources"
  location            = "East Asia"
  sku_tier = var.sku_tier_value
}

variable "sku_tier_value" {
  default = ""
}