locals {
  environment_prefix      = "dev"
  resource_group_name     = "rg-causal-scorpion"
  resource_group_location = "East US"
  tags = {
    Project      = "rg-causal-scorpion-${local.environment_prefix}" #⚠️#
    Owner        = "Maria_Ferreira"                                 #⚠️#
    CreationDate = formatdate("DD/MM/YYYY", timestamp())            #⚠️ Current date, formatted #
    Environment  = title(local.environment_prefix)                  #⚠️#
  }
}

module "azurerg" {
  source = "./modules/azurerg"

  resource_group_name     = local.resource_group_name
  resource_group_location = local.resource_group_location
  tags                    = local.tags
}

module "virtual_network" {
  source = "./modules/network/virtual_network"

  resource_group_name     = module.azurerg.resource_group_name
  resource_group_location = module.azurerg.resource_group_location

  name_virtual_network = "virtual_network_dev"  #⚠️#
  address_space        = ["10.0.0.0/16"]        #⚠️#
  dns_servers          = ["8.8.8.8", "8.8.4.4"] #⚠️#

  subnets = [ #⚠️#
    {
      name             = "subnet-dev-1"
      address_prefixes = ["10.0.1.0/24"]
    },
    {
      name             = "subnet-dev-2"
      address_prefixes = ["10.0.2.0/24"]
    }
  ]

  tags = local.tags
}

module "public_ip" {
  source = "./modules/network/public_ip"

  resource_group_name     = module.azurerg.resource_group_name
  resource_group_location = module.azurerg.resource_group_location

  public_ip_name    = "terraform-public-ip" #⚠️#
  allocation_method = "Static"              #⚠️#
  sku               = "Standard"            #⚠️#

  depends_on = [module.azurerg]
}

module "network_interface" {
  source = "./modules/network/network_interface"

  network_interface_name  = "terraform-ni-dev" #⚠️#
  resource_group_name     = module.azurerg.resource_group_name
  resource_group_location = module.azurerg.resource_group_location

  subnet_id                     = module.virtual_network.subnet_ids[0] #⚠️#
  ip_configuration_name         = "ip-config-internal"                 #⚠️#
  private_ip_address_allocation = "Dynamic"                            #⚠️#
  public_ip_id                  = module.public_ip.id_public_ip

  depends_on = [module.azurerg, module.public_ip, module.virtual_network]
}

module "network_security" {
  source = "./modules/network/network_security"

  nsg_name                = "terraform-security-dev" #⚠️#
  resource_group_name     = module.azurerg.resource_group_name
  resource_group_location = module.azurerg.resource_group_location

  tags = local.tags

  network_interface_id      = module.network_interface.network_interface_id
  network_security_group_id = module.network_security.nsg_id
  subnet_id                 = module.virtual_network.subnet_ids[0] #⚠️#

  depends_on = [module.azurerg, module.virtual_network, module.network_interface]
}

module "virtual_machine" {
  source = "./modules/compute/virtual_machine"

  virtual_machine_name    = "terraform-machine" #⚠️#
  resource_group_name     = module.azurerg.resource_group_name
  resource_group_location = module.azurerg.resource_group_location
  size                    = "Standard_F2"      #⚠️#
  admin_username          = "adminuser"        #⚠️#
  admin_password          = var.admin_password #⚠️#
  network_interface_id    = module.network_interface.network_interface_id
  caching                 = "ReadWrite"                    #⚠️#
  storage_account_type    = "Standard_LRS"                 #⚠️#
  publisher               = "Canonical"                    #⚠️#
  offer                   = "0001-com-ubuntu-server-jammy" #⚠️#
  sku                     = "22_04-lts"                    #⚠️#
  version_image           = "latest"                       #⚠️#
  password_authentication = false                          #⚠️#

  resource_group_id = module.azurerg.resource_group_id
  user_object_id    = "67509e48-05b8-459d-b460-f8eba267b5e4"

  depends_on = [module.azurerg, module.network_interface]
}


module "kubernetes" {
  source = "./modules/kubernetes"

  resource_group_location = local.resource_group_location
  resource_group_name     = local.resource_group_name
  kubernetes_name         = "aula-aks" #⚠️#
  tags                    = local.tags
  kubernetes_dns_prefix   = "aulaaks1"                      #⚠️#
  name_default_node_pool  = "default"                       #⚠️#
  node_count              = 1                               #⚠️#
  vm_size                 = "Standard_D2s_v3"               #⚠️#
  node_labels             = { "nodePoolTypeLevel" = "ONE" } #⚠️#
  kubernetes_version      = "1.30.12"                       #⚠️#

  depends_on = [module.azurerg]
}
