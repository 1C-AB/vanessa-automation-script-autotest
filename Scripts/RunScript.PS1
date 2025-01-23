param (
    [string]$PathToScript, 
    [string]$PathToSettings, 
    [string]$UpdateParam  
)

# Устанавливаем кодировку для вывода в консоль в UTF-8
[Console]::OutputEncoding = [System.Text.Encoding]::GetEncoding("utf-8")

# Получение полного пути к скрипту Исполнителя
$currentDir = $PSScriptRoot
$finalPathToScript = $currentDir + $PathToScript

# Получение полного пути к настройкам конфигурации
$parentDir = Split-Path -Path $currentDir -Parent
$settingFile = "Settings.txt"
$finalPathToSettings = $parentDir + $PathToSettings + $settingFile

# Запуск команды
$executorPath = "D:\Executor\executor_u_6_0_4_25\executor.cmd"
& $executorPath $finalPathToScript $finalPathToSettings $UpdateParam

