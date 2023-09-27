virtual_machine_name = {
  vm1 = {
    test_pip = "testpip1"
   network_interface_name = "vmnic1"
   location        = "east us"
    resource_group_name =  "test_rg"
    subnet_id = "/subscriptions/d58bea90-bcec-4795-8e36-2a8311b912bb/resourceGroups/test_rg/providers/Microsoft.Network/virtualNetworks/testvnet1/subnets/linuxsubnet1.0",
   vm_name = "testvm1" 
  }
  vm2 = {
    test_pip = "testpip2"
    network_interface_name = "vmnic2"
   location        = "central india"
    resource_group_name =  "test_rg2"
    subnet_id = "/subscriptions/d58bea90-bcec-4795-8e36-2a8311b912bb/resourceGroups/test_rg2/providers/Microsoft.Network/virtualNetworks/testvnet2/subnets/linuxsubnet2.1",
   vm_name = "testvm2" 

  }
}