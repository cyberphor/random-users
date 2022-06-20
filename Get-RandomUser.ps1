Param(
    [Parameter(Mandatory)][int]$Count,
    [Parameter(Mandatory)][string]$FirstNameList,
    [Parameter(Mandatory)][string]$LastNameList,
    [Parameter(Mandatory)][string]$PasswordList
)
$FirstNames = Get-Content $FirstNameList | Get-Random -Count $Count
$LastNames = Get-Content $LastNameList | Get-Random -Count $Count
$Passwords = Get-Content $PasswordList | Get-Random -Count $Count
for ($i = 0; $i -lt $Count; $i++) {
    $FirstName = $FirstNames[$i]
    $LastName = $LastNames[$i]
    $Password = $Passwords[$i]
    $Properties = [ordered]@{
        "GivenName" = $FirstName
        "Surname" = $LastName
        "Name" = "$LastName, $FirstName"
        "SamAccountName" = ($FirstName + "." + $LastName).ToLower()
        "Password" = $Password
    }
    New-Object -TypeName psobject -Property $Properties
}
