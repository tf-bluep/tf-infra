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
  subscription_id = "f2fb6ada-1520-4d1a-a23b-8ebbcf63a24c"
  client_id       = "id05bef3fb-6ca0-4af4-b445-6e64d672c7d6"
  client_secret   = "e88Q~07ZraylA8ixVufA.szJxopm0NRhCzqEbZh"
  tenant_id       = "23e4ff6d-7f45-4d40-8565-6135271fcd0c"
}