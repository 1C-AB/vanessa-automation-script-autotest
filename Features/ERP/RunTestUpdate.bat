@echo off
powershell.exe -NoProfile -ExecutionPolicy Bypass -File "D:\GitHub\vanessa-automation-script-autotest\RunScript.PS1" -PathToScript ".\Scripts\UpdateAndTestVanessa.sbsl" -PathToSettings ".\Features\ERP" -UpdateParam "ВыполнитьОбновление"
pause