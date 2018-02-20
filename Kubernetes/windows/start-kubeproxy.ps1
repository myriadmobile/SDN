param(
    [int]$Verbosity=0
)

$bridgeName = "l2bridge"
$env:KUBE_NETWORK="$bridgeName"

# Remove existing HNS Policy Lists. This is a workaround for Internet/NAT routing issues
ipmo C:\k\hns.psm1
Get-HNSPolicyLists | Remove-HNSPolicyList

c:\k\kube-proxy.exe --v=$Verbosity --proxy-mode=kernelspace --hostname-override=$(hostname) --kubeconfig=c:\k\config
