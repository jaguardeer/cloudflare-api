# powershell wrapper for cloudflare api


# get dns records for a zone
# https://developers.cloudflare.com/api/operations/dns-records-for-a-zone-list-dns-records
function Get-DnsRecords {
	Param(
		[Parameter(Mandatory)]
		[SecureString] $ApiToken,

		[Parameter(Mandatory)]
		[String] $ZoneId
		)

	$parms = @{
		Uri = "https://api.cloudflare.com/client/v4/zones/$ZoneId/dns_records"
		Authentication = "Bearer"
		Token = $ApiToken
		Method = "Get"
	}
}

# update dns on cloudflare
# https://developers.cloudflare.com/api/operations/dns-records-for-a-zone-patch-dns-record
function Update-DnsRecord {
	Param(
		[Parameter(Mandatory)]
		[SecureString] $ApiToken,

		[Parameter(Mandatory)]
		[String] $ZoneId,

		[Parameter(Mandatory)]
		[String] $RecordId,

		[Parameter(Mandatory)]
		[Hashtable] $Data
		)

	$parms = @{
		Uri = "https://api.cloudflare.com/client/v4/zones/$zoneId/dns_records/$recordId"
		Authentication = "Bearer"
		Token = $ApiToken
		Method = "Patch"
		ContentType = "application/json"
		Body = $Data | ConvertTo-Json
	}

	Invoke-RestMethod @parms
}