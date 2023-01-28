Set-ExecutionPolicy -ExecutionPolicy Unrestricted -Scope Process

$username = "TestUser" 
$fullName = "Test User" 
$password = ConvertTo-SecureString "P@ssw0rd123" -AsPlainText -Force
$path = "C:\Users\TestUser"
$logFile = "$path\log.csv"

Function New-Item { -ItemType Directory -Path $path }  

Function Write-Log {
  param(
      [Parameter(Mandatory = $true)][string] $message,
      [Parameter(Mandatory = $false)]
      [ValidateSet("INFO","WARN","ERROR")]
      [string] $level = "INFO"
  )
  # Create timestamp
  $timestamp = (Get-Date).toString("yyyy/MM/dd HH:mm:ss")
  # Append content to log file
# Add-Content -Path $logFile -Value "$timestamp [$level] - $message"
}
Function New-LocalUser {
    process {
      try {
        New-LocalUser "$username" -Password $password -FullName "$fullname" -Description "local user" -ErrorAction stop
        Write-Log -message "$username local user created"
        # Add new user to administrator group
        Add-LocalGroupMember -Group "Users" -Member "$username" -ErrorAction stop
        Write-Log -message "$username added to the local users group"
      }catch{
        Write-log -message "Creating local account failed" -level "ERROR"
      }
    }    
}
# Enter the password
Write-Host "Enter the password for the local user account" -ForegroundColor Cyan
$password = Read-Host -AsSecureString
Write-Log -message "#########"
Write-Log -message "$env:COMPUTERNAME - Create local user account"
New-LocalUser
Write-Log -message "#########"