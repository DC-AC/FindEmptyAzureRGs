login-azurermaccount


$rg=(get-azurermresourcegroup).ResourceGroupName

#If you actually want to delete empty resource groups set this flag to 1

$deleteflag=0

foreach ($rgs in $rg)
{

  $emptyrg=(get-azurermresource -resourcegroupname $rgs).count 

  if ($emptyrg -eq 0 -and $deleteflag -eq 1)
    {remove-azurermresourcegroup -resourcegroupname $rgs}
  elseif ($emptyrg -eq 0 -and $deleteflag -eq 0)
    {write-output "Resource Group $rgs is empty"}
  elseif ($emptyrg -ne 0)
    {write-output "Resource Group $rgs contains resources"}   
}
