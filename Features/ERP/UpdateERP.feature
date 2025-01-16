﻿#language: ru

@tree
@ExportScenarios

Функционал: Обновление и проверка ERP

Как Администратор я хочу
проверить корректность обновления конфигурации     

Контекст:
	Дано Я запускаю сценарий открытия TestClient или подключаю уже существующий

Сценарий: Обновление и проверка ERP

* Завершение обновления
	И я жду открытия окна "Легальность получения обновлений" в течение 2000 секунд
	Когда открылось окно "Легальность получения обновлений"
	И я изменяю флаг с именем 'ПодтверждениеБулево'
	И я нажимаю на кнопку с именем 'ФормаПродолжить'
	Тогда открылось окно "Подключение Интернет-поддержки"
	И Я закрываю окно "Подключение Интернет-поддержки"

* Проверка обновления
	И В командном интерфейсе я выбираю "НСИ и администрирование" "Обслуживание"
	Тогда открылось окно "Обслуживание"
	И я разворачиваю группу с именем 'ГруппаРезультатыОбновленияПрограммы'
	И я сворачиваю группу с именем 'ГруппаРезультатыОбновленияПрограммы'
	И я жду доступности элемента с именем 'ИнформацияОбновлениеЗавершено' в течение 20 секунд
	И я жду доступности элемента с именем 'ГруппаОбновлениеЗавершено' в течение 20 секунд