param(
    [int]$Verbosity=0,
    $NetworkMode = "L2Bridge"
)

$env:KUBE_NETWORK=$NetworkMode.ToLower()
ipmo C:\k\hns.psm1
Get-HNSPolicyList | Remove-HNSPolicyList
c:\k\kube-proxy.exe --v=$Verbosity --proxy-mode=kernelspace --hostname-override=$(hostname) --kubeconfig=c:\k\config
