terraform {
  cloud {
    organization = "rohityad"

    workspaces {
      name = tf-infra
    }
  }
}

provider "azurerm" {
  features {}
}
