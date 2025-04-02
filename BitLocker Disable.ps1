Write-host "Disabling Bitlocker"
Disable-BitLocker -MountPoint "Z:"

start-sleep 0.5

while($status = "DecryptionInProgress"){
	write-host "Waiting for Bitlocker to Decrypt"
	$status = Get-BitLockerVolume -MountPoint "Z:" | Select VolumeStatus
	start-sleep 0.5
	#Get-BitLockerVolume -MountPoint "Z:" | Select VolumeStatus
	
	if ($status = "FullyDecrypted"){
		Restart-Computer -Force
	}
}