﻿#language: ru

Функционал: Тестирование API и релизов в ОТП

Как Администратор я хочу
открыть форму тестирования и обработку тестирования API,
чтобы протестировать корректное заполнение актуальных релизов и работу API ОТП  

Контекст:
	Дано Я запускаю сценарий открытия TestClient или подключаю уже существующий

Сценарий: Общий тест

	* Заполнение переменных

	И я запоминаю строку "27.12.2024" в переменную "$$ДатаАктуальногоРелизаУНФГлобально$$"
	И я запоминаю строку "1.1.1.1.1" в переменную "$$ВерсияАктуальногоРелизаУНФГлобально$$"
	И я запоминаю строку "22.01.2024" в переменную "$$ДатаПрошлогоРелизаУНФГлобально$$"
	И я запоминаю строку "1.0.3.14" в переменную "$$ВерсияПрошлогоРелизаУНФГлобально$$"
	И я запоминаю строку "АБ_WZ_УНФИнтеграцияСWazzup" в переменную "$$УНФГлобально$$"

	И я запоминаю строку "1.0.5.1" в переменную "$$НомерВерсииУНФГлобально$$"
	И я запоминаю строку "1.0.2.3" в переменную "$$НомерВерсииУТГлобально$$"
	И я запоминаю строку "1.0.1.1" в переменную "$$НомерВерсииРозницаГлобально$$"

	* Тестирование форм и API 
	Тогда Тест актуального релиза 
	Тогда Тестирование HTTP
	
	И я добавляю информацию в лог "Тестирование форм и API завершилосб успешно"
	



