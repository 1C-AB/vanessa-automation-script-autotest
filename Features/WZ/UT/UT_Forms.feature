﻿#language: ru

@tree
@ExportScenarios

Функционал: Тестирование форм чатов WZ в УТ

Как Администратор я хочу
открыть формы объектов, в которых реализован чат WZ
чтобы протестировать корректное открытие формы и работу чата WZ  

Контекст:
	Дано Я запускаю сценарий открытия TestClient или подключаю уже существующий

Сценарий: Тестирование форм УТ

*Тестирование общего чата WZ

	И В командном интерфейсе я выбираю "Wazzup" "Открыть общий чат"
	Тогда открылось окно "Чат через сервис Wazzup"
	И Я закрываю окно "Чат через сервис Wazzup"
	
*Тестирование чата Справочника Партнеры
	
	И В командном интерфейсе я выбираю "CRM и маркетинг" "Клиенты"
	Тогда открылось окно "Партнеры (Клиенты)"
	И в таблице 'Список' я нажимаю на кнопку "Открыть чат" 
	И я жду доступности элемента с именем 'АБ_УТ_WZ_АдресЧата' в течение 10 секунд
	И в таблице 'Список' я нажимаю на кнопку "Закрыть чат" 

*Тестирование чата Справочника Контрагенты

	Когда Я нажимаю кнопку командного интерфейса "Контрагенты (юридические или физические лица)"
	Тогда открылось окно "Контрагенты (юридические или физические лица)"
	И в таблице 'Список' я нажимаю на кнопку "Открыть чат" 
	И я жду доступности элемента с именем 'АБ_УТ_WZ_АдресЧата' в течение 10 секунд
	И в таблице 'Список' я нажимаю на кнопку "Закрыть чат" 

*Тестирование чата Справочника Сделки с клиентами

	И В командном интерфейсе я выбираю "CRM и маркетинг" "Сделки с клиентами"
	Тогда открылось окно "Сделки с клиентами"
	И в таблице 'Список' я нажимаю на кнопку "Открыть чат" 
	И я жду доступности элемента с именем 'АБ_УТ_WZ_АдресЧата' в течение 10 секунд
	И я нажимаю на кнопку "Закрыть чат"

*Тестирование чата Документа Заказы клиентов
	
	И В командном интерфейсе я выбираю "Продажи" "Заказы клиентов"
	Тогда открылось окно "Заказы клиентов"
	И в таблице 'Список' я нажимаю на кнопку "Открыть чат" 
	И я жду доступности элемента с именем 'АБ_УТ_WZ_АдресЧата' в течение 10 секунд
	И я нажимаю на кнопку "Закрыть чат"
	
	








