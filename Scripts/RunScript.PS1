ipconfig|out-null
[Console]::OutputEncoding = [System.Text.Encoding]::GetEncoding("utf-8")
$pathToScript = "D:\GitHub\vanessa-automation-script-autotest\Scripts\UpdateAndTestVanessa.sbsl" #Обязательный парметр
$pathToSettings = "D:\GitHub\vanessa-automation-script-autotest\Scripts\Settings.txt" #Обязательный парметр
$updateParam = "ВыполнитьОбновление" #Необязательный парметр, по умолчанию установлено "Обновлено"
D:\Executor\executor_u_6_0_4_25\executor.cmd $pathToScript $pathToSettings