﻿#language: ru

Функционал: Тестирование форм ERP

Как Администратор я хочу
открыть форму тестирования,
чтобы протестировать корректное открытие формы согласования 

Контекст:
	
	И я подключаю профиль TestClient "Розница (файл)"
	//Дано Я запускаю сценарий открытия TestClient или подключаю уже существующий

Сценарий: Общий тест ERP


	Если 'КонтекстСохраняемый.РезультатОбновления = "ВыполнитьОбновление"' Тогда
		Тогда Обновление и проверка ERP
		Тогда Тестирование форм ERP 
		И я добавляю информацию в лог "Тестирование форм и обновления 1С:ERP завершилось успешно"
	ИначеЕсли 'КонтекстСохраняемый.РезультатОбновления = "Обновлено"' Тогда
		Тогда Тестирование форм ERP
		И я добавляю информацию в лог "Тестирование форм в 1С:ERP завершилось успешно"
	


		

		
		
		

