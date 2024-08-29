param (
    [string]$dnsOption
)

$adapterName = "Ethernet"  # Replace with your actual adapter name if different

switch ($dnsOption.ToLower()) {
    "google" {
        $dns1 = "8.8.8.8"
        $dns2 = "8.8.4.4"
    }
    "local" {
        $dns1 = "192.168.0.25"
        $dns2 = $null
    }
    default {
        Write-Host "Usage: dns_use.ps1 [google|local]"
        exit
    }
}

# Set DNS servers
Set-DnsClientServerAddress -InterfaceAlias $adapterName -ServerAddresses $dns1,$dns2

Write-Host "DNS settings updated successfully for adapter: $adapterName"
