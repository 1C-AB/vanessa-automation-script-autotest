﻿#language: ru

Функционал: Тестирование форм чатов WZ и обновлния Розница

Как Администратор я хочу
открыть форму тестирования и обработку тестирования API,
чтобы протестировать корректное открытие формы и работу API WZ  

Контекст:
	
	И я подключаю профиль TestClient "Розница (файл)"
	//Дано Я запускаю сценарий открытия TestClient или подключаю уже существующий

Сценарий: Общий тест


	Если 'КонтекстСохраняемый.НеобходимоОбновить = "Нет"' Тогда
		Тогда Тестирование форм Розница 
		И я добавляю информацию в лог "Тестирование форм WZ в 1С:Розница завершилось успешно"
	Иначе
		Тогда Обновление и проверка Розница
		Тогда Тестирование форм Розница
		И я добавляю информацию в лог "Тестирование форм и обновления 1С:Розница завершилось успешно"
	


		

		
		
		

