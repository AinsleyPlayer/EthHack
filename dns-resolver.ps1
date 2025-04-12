param(
    [string]$networkPrefix,
    [string]$dnsServer
)

1..254 | ForEach-Object {
    $ip = "$networkPrefix.$_"
    $result = Resolve-DnsName -DnsOnly $ip -Server $dnsServer -ErrorAction Ignore
    $result | Select-Object @{Name="NameHost";Expression={$_.NameHost}}, @{Name="IP";Expression={$_.Name}}
}
