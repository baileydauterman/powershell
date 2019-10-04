
#----------------------------------------------
#region Import the Assemblies
#----------------------------------------------
[void][reflection.assembly]::Load('System.Windows.Forms, Version=4.0.0.0, Culture=neutral, PublicKeyToken=b77a5c561934e089')
[void][reflection.assembly]::Load('System.Drawing, Version=4.0.0.0, Culture=neutral, PublicKeyToken=b03f5f7f11d50a3a')
#endregion Import Assemblies
    
#----------------------------------------------
#region Generated Form Objects
#----------------------------------------------
[System.Windows.Forms.Application]::EnableVisualStyles()
$formComputerInformation = New-Object 'System.Windows.Forms.Form'
$groupbox3 = New-Object 'System.Windows.Forms.GroupBox'
$labelMemInstalled = New-Object 'System.Windows.Forms.Label'
$labelCPUName = New-Object 'System.Windows.Forms.Label'
$labelCPU = New-Object 'System.Windows.Forms.Label'
$labelTotalMemSizeGB = New-Object 'System.Windows.Forms.Label'
$labelMaxMemoryGB = New-Object 'System.Windows.Forms.Label'
$labelOSversion = New-Object 'System.Windows.Forms.Label'
$label5 = New-Object 'System.Windows.Forms.Label'
$label6 = New-Object 'System.Windows.Forms.Label'
$label7 = New-Object 'System.Windows.Forms.Label'
$labelModel = New-Object 'System.Windows.Forms.Label'
$labelMaxMemory = New-Object 'System.Windows.Forms.Label'
$labelManufacturer = New-Object 'System.Windows.Forms.Label'
$labelIPAddress = New-Object 'System.Windows.Forms.Label'
$labelInstDate = New-Object 'System.Windows.Forms.Label'
$labelOSInstallDate = New-Object 'System.Windows.Forms.Label'
$labelFreeSpaceGB = New-Object 'System.Windows.Forms.Label'
$labelDiskSizeGB = New-Object 'System.Windows.Forms.Label'
$labelserialNumber = New-Object 'System.Windows.Forms.Label'
$labelenvCOMPUTERNAME = New-Object 'System.Windows.Forms.Label'
$labelMemory = New-Object 'System.Windows.Forms.Label'
$labelSpaceAvailable = New-Object 'System.Windows.Forms.Label'
$labelComputerName = New-Object 'System.Windows.Forms.Label'
$labelHardDiskSize = New-Object 'System.Windows.Forms.Label'
$buttonOK = New-Object 'System.Windows.Forms.Button'
$InitialFormWindowState = New-Object 'System.Windows.Forms.FormWindowState'
#endregion Generated Form Objects
    
#----------------------------------------------
# User Generated Script
#----------------------------------------------
    
$formComputerInformation_Load = {
        
}
$Computer = $env:COMPUTERNAME
$SerialNumber = (Get-WmiObject win32_bios -ComputerName $Computer).SerialNumber
$InstDate = (Get-CimInstance Win32_OperatingSystem).InstallDate
$Manufacturer = Get-WmiObject win32_computersystem | Select Manufacturer
$Model = Get-WmiObject win32_computersystem | Select Model
#Gets the OS info
$GetOS = Get-WmiObject -class Win32_OperatingSystem -computername $Computer
$OS = $GetOS.Caption
$OSArchitecture = $GetOS.OSArchitecture
$OSBuildNumber = $GetOS.BuildNumber
#Monitor information
$MonitorCount = Get-ciminstance -namespace root/wmi -classname WmiMonitorConnectionParams | Select VideoOutputTechnology
#Gets memory information
$Getmemoryslot = Get-WmiObject Win32_PhysicalMemoryArray -ComputerName $computer
$Getmemory = Get-WMIObject Win32_PhysicalMemory -ComputerName $computer
$Getmemorymeasure = Get-WMIObject Win32_PhysicalMemory -ComputerName $computer | Measure-Object -Property Capacity -Sum
$MemorySlot = $Getmemoryslot.MemoryDevices
$MaxMemory = $($Getmemoryslot.MaxCapacity/1024/1024)
$TotalMemSticks = $Getmemorymeasure.count
$TotalMemSize = $($Getmemorymeasure.sum/1024/1024/1024)
#Get the disk info
$GetDiskInfo = Get-WmiObject Win32_logicaldisk -ComputerName $computer -Filter "DeviceID='C:'"
$DiskSize = $([math]::Round($GetDiskInfo.Size/1GB))
$FreeSpace = $([math]::Round($GetDiskInfo.FreeSpace/1GB))
$UsedSapce = $([math]::Round($DiskSize - $FreeSpace))
#OS Version
$osVersion = (Get-Item "HKLM:SOFTWARE\Microsoft\Windows NT\CurrentVersion").GetValue('ReleaseID')
#Gets CPU info
$GetCPU = Get-wmiobject win32_processor -ComputerName $Computer
$CPUName = $GetCPU.Name
$CPUManufacturer = $GetCPU.Manufacturer
$CPUMaxClockSpeed = $GetCPU.MaxClockSpeed
#account status
$LoggedOnUser = (Get-WmiObject win32_computersystem -ComputerName $Computer).Username
$getLockedStart = If (Get-Process logonui -ComputerName $Computer -ErrorAction SilentlyContinue) { $Locked = "Yes" }
Else { $Locked = "No" }
#Serial Number
$SerialNumber = (Get-WmiObject win32_bios -ComputerName $Computer).SerialNumber
#get IP address
$IpAddress = ((ipconfig | findstr [0-9].\.)[0]).Split()[-1]
#Gets BIOS info
$BIOSName = (Get-WmiObject win32_bios -ComputerName $Computer).Name
$BIOSManufacturer = (Get-WmiObject win32_bios -ComputerName $Computer).Manufacturer
$BIOSVersionN = (Get-WmiObject win32_bios -ComputerName $Computer).Version
#Gets Motherboard info
$MotherBoardName = (Get-WmiObject Win32_BaseBoard -ComputerName $Computer).Name
$MotherBoardManufacturet = (Get-WmiObject Win32_BaseBoard -ComputerName $Computer).Manufacturer
$MotherBoardProduct = (Get-WmiObject Win32_BaseBoard -ComputerName $Computer).Product
$MotherBoardSerial = (Get-WmiObject Win32_BaseBoard -ComputerName $Computer).SerialNumber
$InstDate = (Get-CimInstance Win32_OperatingSystem).InstallDatel
$DesktopPath = [Environment]::GetFolderPath("Desktop")
$MonitorC0unt = $MonitorCount -replace '@{VideoOutputTechnology=', ''
$MonitorCount = $MonitorC0unt -replace '}', ''
$M4nufacturer = $Manufacturer -replace '@{Manufacturer=', ''
$Manufacturer = $M4nufacturer -replace '}', ''
$M0del = $Model -replace '@{Model='
$Model = $M0del -replace '}'
$directories = Get-ChildItem -Path "C:\Users\" | Select -Property Name
$D1rectories = $directories -replace '{@{Name=', ''
$directories = $D1rectories -replace '}', ''
$M0therBoardSerial = $MotherBoardSerial -replace '/$SerialNumber/', ''
$MotherBoardSerial = $M0therBoardSerial -replace '/'
    
    
# --End User Generated Script--
#----------------------------------------------
#region Generated Events
#----------------------------------------------
    
$Form_StateCorrection_Load =
{
    #Correct the initial state of the form to prevent the .Net maximized form issue
    $formComputerInformation.WindowState = $InitialFormWindowState
}
    
$Form_Cleanup_FormClosed =
{
    #Remove all event handlers from the controls
    try
    {
        $formComputerInformation.remove_Load($formComputerInformation_Load)
        $formComputerInformation.remove_Load($Form_StateCorrection_Load)
        $formComputerInformation.remove_FormClosed($Form_Cleanup_FormClosed)
    }
    catch { Out-Null <# Prevent PSScriptAnalyzer warning #> }
}
#endregion Generated Events
    
#----------------------------------------------
#region Generated Form Code
#----------------------------------------------
$formComputerInformation.SuspendLayout()
$groupbox3.SuspendLayout()
#
# formComputerInformation
#
$formComputerInformation.Controls.Add($groupbox3)
$formComputerInformation.Controls.Add($buttonOK)
$formComputerInformation.AcceptButton = $buttonOK
$formComputerInformation.AutoScaleDimensions = '6, 13'
$formComputerInformation.AutoScaleMode = 'Font'
$formComputerInformation.ClientSize = '349, 250'
$formComputerInformation.FormBorderStyle = 'FixedDialog'
$formComputerInformation.MaximizeBox = $False
$formComputerInformation.MinimizeBox = $False
$formComputerInformation.Name = 'formComputerInformation'
$formComputerInformation.StartPosition = 'CenterScreen'
$formComputerInformation.Text = 'Computer Information'
$formComputerInformation.add_Load($formComputerInformation_Load)
#
# groupbox3
#
$groupbox3.Controls.Add($labelMemInstalled)
$groupbox3.Controls.Add($labelCPUName)
$groupbox3.Controls.Add($labelCPU)
$groupbox3.Controls.Add($labelTotalMemSizeGB)
$groupbox3.Controls.Add($labelMaxMemoryGB)
$groupbox3.Controls.Add($label5)
$groupbox3.Controls.Add($label6)
$groupbox3.Controls.Add($label7)
$groupbox3.Controls.Add($labelModel)
$groupbox3.Controls.Add($labelMaxMemory)
$groupbox3.Controls.Add($labelManufacturer)
$groupbox3.Controls.Add($labelIPAddress)
$groupbox3.Controls.Add($labelInstDate)
$groupbox3.Controls.Add($labelOSInstallDate)
$groupbox3.Controls.Add($labelFreeSpaceGB)
$groupbox3.Controls.Add($labelDiskSizeGB)
$groupbox3.Controls.Add($labelserialNumber)
$groupbox3.Controls.Add($labelenvCOMPUTERNAME)
$groupbox3.Controls.Add($labelMemory)
$groupbox3.Controls.Add($labelSpaceAvailable)
$groupbox3.Controls.Add($labelComputerName)
$groupbox3.Controls.Add($labelHardDiskSize)
$groupbox3.Location = '0, 12'
$groupbox3.Name = 'groupbox3'
$groupbox3.Size = '352, 202'
$groupbox3.TabIndex = 11
$groupbox3.TabStop = $False
$groupbox3.Text = 'System Info:'
$groupbox3.UseCompatibleTextRendering = $True
#
# labelMemInstalled
#
$labelMemInstalled.AutoSize = $True
$labelMemInstalled.Location = '6, 163'
$labelMemInstalled.Name = 'labelMemInstalled'
$labelMemInstalled.Size = '78, 17'
$labelMemInstalled.TabIndex = 28
$labelMemInstalled.Text = 'Mem Installed:'
$labelMemInstalled.UseCompatibleTextRendering = $True
#
# labelCPUName
#
$labelCPUName.AutoSize = $True
$labelCPUName.Location = '104, 178'
$labelCPUName.Name = 'labelCPUName'
$labelCPUName.Size = '65, 17'
$labelCPUName.TabIndex = 27
$labelCPUName.Text = "$CPUName"
$labelCPUName.UseCompatibleTextRendering = $True
#
# labelCPU
#
$labelCPU.AutoSize = $True
$labelCPU.Location = '6, 178'
$labelCPU.Name = 'labelCPU'
$labelCPU.Size = '34, 17'
$labelCPU.TabIndex = 26
$labelCPU.Text = 'CPU: '
$labelCPU.UseCompatibleTextRendering = $True
#
# labelTotalMemSizeGB
#
$labelTotalMemSizeGB.AutoSize = $True
$labelTotalMemSizeGB.Location = '104, 163'
$labelTotalMemSizeGB.Name = 'labelTotalMemSizeGB'
$labelTotalMemSizeGB.Size = '102, 17'
$labelTotalMemSizeGB.TabIndex = 25
$labelTotalMemSizeGB.Text = "$TotalMemSize GB"
$labelTotalMemSizeGB.UseCompatibleTextRendering = $True
#
# labelMaxMemoryGB
#
$labelMaxMemoryGB.AutoSize = $True
$labelMaxMemoryGB.Location = '104, 149'
$labelMaxMemoryGB.Name = 'labelMaxMemoryGB'
$labelMaxMemoryGB.Size = '92, 17'
$labelMaxMemoryGB.TabIndex = 24
$labelMaxMemoryGB.Text = "$MaxMemory GB"
$labelMaxMemoryGB.UseCompatibleTextRendering = $True
#
# label5
#
$label5.AutoSize = $True
$label5.Location = '104, 135'
$label5.Name = 'label5'
$label5.Size = '61, 17'
$label5.TabIndex = 23
$label5.Text = "$IpAddress"
$label5.UseCompatibleTextRendering = $True
#
# label6
#
$label6.AutoSize = $True
$label6.Location = '104, 120'
$label6.Name = 'label6'
$label6.Size = '41, 17'
$label6.TabIndex = 22
$label6.Text = "$Model"
$label6.UseCompatibleTextRendering = $True
#
# label7
#
$label7.AutoSize = $True
$label7.Location = '104, 105'
$label7.Name = 'label7'
$label7.Size = '77, 17'
$label7.TabIndex = 21
$label7.Text = "$Manufacturer"
$label7.UseCompatibleTextRendering = $True
#
# labelModel
#
$labelModel.AutoSize = $True
$labelModel.Location = '6, 120'
$labelModel.Name = 'labelModel'
$labelModel.Size = '38, 17'
$labelModel.TabIndex = 18
$labelModel.Text = 'Model:'
$labelModel.UseCompatibleTextRendering = $True
#
# labelMaxMemory
#
$labelMaxMemory.AutoSize = $True
$labelMaxMemory.Location = '6, 149'
$labelMaxMemory.Name = 'labelMaxMemory'
$labelMaxMemory.Size = '73, 17'
$labelMaxMemory.TabIndex = 20
$labelMaxMemory.Text = 'Max Memory:'
$labelMaxMemory.UseCompatibleTextRendering = $True
#
# labelManufacturer
#
$labelManufacturer.AutoSize = $True
$labelManufacturer.Location = '6, 105'
$labelManufacturer.Name = 'labelManufacturer'
$labelManufacturer.Size = '77, 17'
$labelManufacturer.TabIndex = 17
$labelManufacturer.Text = 'Manufacturer: '
$labelManufacturer.UseCompatibleTextRendering = $True
#
# labelIPAddress
#
$labelIPAddress.AutoSize = $True
$labelIPAddress.Location = '6, 135'
$labelIPAddress.Name = 'labelIPAddress'
$labelIPAddress.Size = '60, 17'
$labelIPAddress.TabIndex = 19
$labelIPAddress.Text = 'IPAddress:'
$labelIPAddress.UseCompatibleTextRendering = $True
#
# labelInstDate
#
$labelInstDate.AutoSize = $True
$labelInstDate.Location = '104, 90'
$labelInstDate.Name = 'labelInstDate'
$labelInstDate.Size = '53, 17'
$labelInstDate.TabIndex = 16
$labelInstDate.Text = "$InstDate"
$labelInstDate.UseCompatibleTextRendering = $True
#
# labelOSInstallDate
#
$labelOSInstallDate.AutoSize = $True
$labelOSInstallDate.Location = '6, 90'
$labelOSInstallDate.Name = 'labelOSVersion'
$labelOSInstallDate.Size = '86, 17'
$labelOSInstallDate.TabIndex = 15
$labelOSInstallDate.Text = 'OS Install Date: '
$labelOSInstallDate.UseCompatibleTextRendering = $True
#
# labelOSVersion
#
$labelInstDate.AutoSize = $True
$labelInstDate.Location = '104, 90'
$labelInstDate.Name = 'labelOSVersion'
$labelInstDate.Size = '53, 17'
$labelInstDate.TabIndex = 16
$labelInstDate.Text = "$osVersion"
$labelInstDate.UseCompatibleTextRendering = $True
#
#labelOSVersion
#
$labelOSInstallDate.AutoSize = $True
$labelOSInstallDate.Location = '6, 90'
$labelOSInstallDate.Name = 'labelOSVersion'
$labelOSInstallDate.Size = '86, 17'
$labelOSInstallDate.TabIndex = 15
$labelOSInstallDate.Text = 'OS Version: '
$labelOSInstallDate.UseCompatibleTextRendering = $True
#
# labelFreeSpaceGB
#
$labelFreeSpaceGB.AutoSize = $True
$labelFreeSpaceGB.Location = '104, 60'
$labelFreeSpaceGB.Name = 'labelFreeSpaceGB'
$labelFreeSpaceGB.Size = '85, 17'
$labelFreeSpaceGB.TabIndex = 13
$labelFreeSpaceGB.Text = "$FreeSpace GB"
$labelFreeSpaceGB.UseCompatibleTextRendering = $True
#
# labelDiskSizeGB
#
$labelDiskSizeGB.AutoSize = $True
$labelDiskSizeGB.Location = '104, 46'
$labelDiskSizeGB.Name = 'labelDiskSizeGB'
$labelDiskSizeGB.Size = '74, 17'
$labelDiskSizeGB.TabIndex = 12
$labelDiskSizeGB.Text = "$DiskSize GB"
$labelDiskSizeGB.UseCompatibleTextRendering = $True
#
# labelserialNumber
#
$labelserialNumber.AutoSize = $True
$labelserialNumber.Location = '104, 31'
$labelserialNumber.Name = 'labelserialNumber'
$labelserialNumber.Size = '78, 17'
$labelserialNumber.TabIndex = 11
$labelserialNumber.Text = "$serialNumber"
$labelserialNumber.UseCompatibleTextRendering = $True
#
# labelenvCOMPUTERNAME
#
$labelenvCOMPUTERNAME.AutoSize = $True
$labelenvCOMPUTERNAME.Location = '104, 16'
$labelenvCOMPUTERNAME.Name = 'labelenvCOMPUTERNAME'
$labelenvCOMPUTERNAME.Size = '129, 17'
$labelenvCOMPUTERNAME.TabIndex = 10
$labelenvCOMPUTERNAME.Text = "$env:COMPUTERNAME"
$labelenvCOMPUTERNAME.UseCompatibleTextRendering = $True
#
# labelMemory
#
$labelMemory.AutoSize = $True
$labelMemory.Location = '6, 31'
$labelMemory.Name = 'labelMemory'
$labelMemory.Size = '80, 17'
$labelMemory.TabIndex = 7
$labelMemory.Text = 'Serial Number:'
$labelMemory.UseCompatibleTextRendering = $True
#
# labelSpaceAvailable
#
$labelSpaceAvailable.AutoSize = $True
$labelSpaceAvailable.Location = '6, 60'
$labelSpaceAvailable.Name = 'labelSpaceAvailable'
$labelSpaceAvailable.Size = '89, 17'
$labelSpaceAvailable.TabIndex = 9
$labelSpaceAvailable.Text = 'Space Available:'
$labelSpaceAvailable.UseCompatibleTextRendering = $True
#
# labelComputerName
#
$labelComputerName.AutoSize = $True
$labelComputerName.Location = '6, 16'
$labelComputerName.Name = 'labelComputerName'
$labelComputerName.Size = '93, 17'
$labelComputerName.TabIndex = 6
$labelComputerName.Text = 'Computer Name: '
$labelComputerName.UseCompatibleTextRendering = $True
#
# labelHardDiskSize
#
$labelHardDiskSize.AutoSize = $True
$labelHardDiskSize.Location = '6, 46'
$labelHardDiskSize.Name = 'labelHardDiskSize'
$labelHardDiskSize.Size = '82, 17'
$labelHardDiskSize.TabIndex = 8
$labelHardDiskSize.Text = 'Hard Disk Size:'
$labelHardDiskSize.UseCompatibleTextRendering = $True
#
# buttonOK
#
$buttonOK.Anchor = 'Bottom, Right'
$buttonOK.DialogResult = 'OK'
$buttonOK.Location = '262, 215'
$buttonOK.Name = 'buttonOK'
$buttonOK.Size = '75, 23'
$buttonOK.TabIndex = 0
$buttonOK.Text = '&OK'
$buttonOK.UseCompatibleTextRendering = $True
$buttonOK.UseVisualStyleBackColor = $True
$groupbox3.ResumeLayout()
$formComputerInformation.ResumeLayout()
#endregion Generated Form Code
    
#----------------------------------------------
    
#Save the initial state of the form
$InitialFormWindowState = $formComputerInformation.WindowState
#Init the OnLoad event to correct the initial state of the form
$formComputerInformation.add_Load($Form_StateCorrection_Load)
#Clean up the control events
$formComputerInformation.add_FormClosed($Form_Cleanup_FormClosed)
#Show the Form
return $formComputerInformation.ShowDialog()

C:\Windows\System32\WindowsPowerShell\v1.0\powershell.exe -File C:\users\dautermanb1\Documents\Computer Info.ps1
