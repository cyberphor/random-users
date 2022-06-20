Param([Parameter(Mandatory)][string]$InputFile)
if (Test-Path $InputFile) {
    Get-Content $InputFile | 
    ForEach-Object { 
        $RandomName = $_.Split(' ')[0].ToLower()
        (Get-Culture).TextInfo.ToTitleCase($RandomName)
    }
} else {
    Write-Error "$InputFile not found."
}
