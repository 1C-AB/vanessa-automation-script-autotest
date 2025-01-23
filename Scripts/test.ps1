param (
    [string]$PathToScript, 
    [string]$PathToSettings, 
    [string]$UpdateParam  
)

# Устанавливаем кодировку для вывода в консоль в UTF-8
[Console]::OutputEncoding = [System.Text.Encoding]::UTF8

# Получение полного пути к скрипту Исполнителя
$currentDir = $PSScriptRoot
$finalPathToScript = $currentDir + $PathToScript

# Получение родительского каталога
$parentDir = Split-Path -Path $currentDir -Parent

$settingFile = "Settings.txt"
$finalPathToSettings = $parentDir + $PathToSettings + $settingFile





Write-Output "Родительский каталог: $parentDir"
Write-Host "PathToScript: $finalPathToScript"
Write-Host "PathToSettings: $finalPathToSettings"
Write-Host "UpdateParam: $UpdateParam"
Write-Host "fullpathset: $fullpathset" 

Read-Host -Prompt "Press Enter to exit"


# Проверка существования файлов
if (-not (Test-Path -Path $PathToScript)) {
    Write-Error "Файл скрипта не найден: $PathToScript"
    exit 1
}

if (-not (Test-Path -Path $PathToSettings)) {
    Write-Error "Файл настроек не найден: $PathToSettings"
    exit 1
}

# Запуск команды
$executorPath = "D:\Executor\executor_u_6_0_4_25\executor.cmd"
& $executorPath $PathToScript $PathToSettings $UpdateParam

# Проверка результата выполнения
if ($LASTEXITCODE -ne 0) {
    Write-Error "Команда завершилась с ошибкой. Код выхода: $LASTEXITCODE"
    exit $LASTEXITCODE
} else {
    Write-Output "Команда успешно выполнена."
}

