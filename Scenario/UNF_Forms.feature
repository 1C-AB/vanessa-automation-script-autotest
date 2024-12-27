﻿#language: ru

@tree

Функционал: Тестирование форм чатов WZ в УНФ

Как Администратор я хочу
открыть формы объектов, в которых реализован чат WZ
чтобы протестировать корректное открытие формы и работу чата WZ  

Контекст:
	Дано Я запускаю сценарий открытия TestClient или подключаю уже существующий

Сценарий: Сценарий_1


Если в сообщениях пользователю есть строка "Не заполнено значение КлючAPI в настройках модуля Wazzup" Тогда
	И я вызываю исключение "Ошибка работы сервиса WZ"
	
Если в сообщениях пользователю есть строка "Возникла ошибка работы с сервисом Wazzup" Тогда
	И я вызываю исключение "Ошибка работы сервиса WZ"


*Тестирование окна общего чата

	И В командном интерфейсе я выбираю "Wazzup" "Открыть общий чат"
	Тогда открылось окно "Чат через сервис Wazzup"
	И Я закрываю окно "Чат через сервис Wazzup"

*Тестирование окна чата формы списка Справочника Контакты

	И В командном интерфейсе я выбираю "CRM" "Контакты"
	Когда открылось окно "Контакты"
	И я нажимаю на кнопку "Открыть чат"
	И я жду открытия формы "Контакты" в течение 10 секунд
	И я жду доступности элемента с именем 'АБ_WZ_АдресЧата' в течение 10 секунд
	И я нажимаю на кнопку "Закрыть чат" 

*Тестирование окна чата формы элемента Справочника Контакты

	Когда открылось окно "Контакты"
	И в таблице 'Список' я выбираю текущую строку
	Тогда открылось окно "*(Контакт)"
	И я нажимаю на кнопку "Открыть чат"
	И я жду доступности элемента с именем 'АБ_WZ_АдресЧата' в течение 10 секунд
	И я нажимаю на кнопку "Закрыть чат" 
	И Я закрываю окно "*(Контакт)"

*Тестирование окна чата формы списка Справочника Покупатели

	И В командном интерфейсе я выбираю "CRM" "Покупатели"
	Тогда открылось окно "Контрагенты: Покупатели"
	И я нажимаю на кнопку "Открыть чат"
	И я жду доступности элемента с именем 'АБ_WZ_АдресЧата' в течение 10 секунд
	И я нажимаю на кнопку "Закрыть чат" 

*Тестирование окна чата формы элемента Справочника Покупатели

	И в таблице 'Список' я выбираю текущую строку
	Тогда открылось окно "*(Контрагент: Покупатель)"
	И я нажимаю на кнопку "Открыть чат"
	И я жду доступности элемента с именем 'АБ_WZ_АдресЧата' в течение 10 секунд
	И я нажимаю на кнопку "Закрыть чат" 
	И Я закрываю окно "*(Контрагент: Покупатель)"
	Тогда открылось окно "Контрагенты: Покупатели"
	И Я закрываю окно "Контрагенты: Покупатели"
	
*Тестирование окна чата формы списка Документа Заказы покупателей

	И В командном интерфейсе я выбираю "CRM" "Заказы покупателей"
	Тогда открылось окно "Заказы покупателей"
	И я нажимаю на кнопку "Открыть чат"
	И я жду доступности элемента с именем 'АБ_WZ_АдресЧата' в течение 10 секунд
	И я нажимаю на кнопку "Закрыть чат" 

*Тестирование окна чата формы элемента Документа Заказы покупателей

	И в таблице 'Список' я выбираю текущую строку
	Тогда открылось окно 'Заказ покупателя *'
	И в табличном документе 'ТаблицаДляПросмотра' я перехожу к ячейке "R1C1"
	И я нажимаю на кнопку "Открыть чат"
	И я жду доступности элемента с именем 'АБ_WZ_АдресЧата' в течение 10 секунд
	И я нажимаю на кнопку "Закрыть чат" 
	И Я закрываю окно "Заказ покупателя *"
	
	








