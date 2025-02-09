param (
    [string]$PathToScript, 
    [string]$PathToSettings, 
    [string]$UpdateParam  
)

# ������������� ��������� ��� ������ � ������� � UTF-8
[Console]::OutputEncoding = [System.Text.Encoding]::GetEncoding("utf-8")

# ��������� ������� ���� � ������� �����������
$currentDir = $PSScriptRoot
$finalPathToScript = $currentDir + $PathToScript

# ��������� ������� ���� � ���������� ������������
$parentDir = Split-Path -Path $currentDir -Parent
$settingFile = "Settings.txt"
$finalPathToSettings = $parentDir + $PathToSettings + $settingFile

# ��������� ������� ���� � ���������� GitHub
$GiHubDirectory = $parentDir + $PathToGiHubDirectory

# ������ �������
$executorPath = "D:\Executor\executor_u_6_0_4_25\executor.cmd"
& $executorPath $finalPathToScript $finalPathToSettings $GiHubDirectory $UpdateParam 
