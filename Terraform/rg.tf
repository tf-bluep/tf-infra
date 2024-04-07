
module "azure_resourcegroup" {
  source  = "app.terraform.io/rohityad/azure_resourcegroup/azurerm"
  version = "1.0.0"

  application = "Bluepi"
  costcenter  = "abc"
  department  = "xyz"
  env         = "dev"
  location    = data.azurerm_location.current.display_name
  owner       = "rohityad"
  rgname      = "RG-bluepi"
}
