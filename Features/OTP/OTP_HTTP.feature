﻿#language: ru

@tree
@ExportScenarios

Функционал: Тестирование HTTP OTP

Как Администратор я хочу
открыть форму проверки HTTP
чтобы протестировать корректное отображение данных релизов  

Контекст:
	Дано Я запускаю сценарий открытия TestClient или подключаю уже существующий

Сценарий: Тестирование HTTP

	* Объявление переменных
	И я запоминаю строку "1.0.5.1" в переменную "$$НомерВерсииУНФГлобально$$"
	И я запоминаю строку "1.0.2.3" в переменную "$$НомерВерсииУТГлобально$$"
	И я запоминаю строку "1.0.1.1" в переменную "$$НомерВерсииРозницаГлобально$$"
	

	И В командном интерфейсе я выбираю "ОТП 1АБ" "Форма проверки HTTPСервиса"
	Тогда открылось окно "Форма проверки HTTPСервиса"

	* Проверка УНФ
	И из выпадающего списка с именем 'Проект' я выбираю точное значение "АБ_WZ_УНФИнтеграцияСWazzup"
	И я нажимаю на кнопку с именем 'ФормаПолучитьДанные'
	И в таблице 'ТаблицаСведений' я перехожу к строке:
		| "Вид сведений" | "Сведение" |
		| "Номер версии" | "$$НомерВерсииУНФГлобально$$"  |

	* Проверка УТ
	И из выпадающего списка с именем 'Проект' я выбираю точное значение "АБ_WZ_УТИнтеграцияСWazzup"
	И я нажимаю на кнопку с именем 'ФормаПолучитьДанные'
	И в таблице 'ТаблицаСведений' я перехожу к строке:
		| "Вид сведений" | "Сведение" |
		| "Номер версии" | "$$НомерВерсииУТГлобально$$"  |

	* Проверка Розница
	И из выпадающего списка с именем 'Проект' я выбираю точное значение "АБ_WZ_РозницаИнтеграцияСWazzup"
	И я нажимаю на кнопку с именем 'ФормаПолучитьДанные'
	И в таблице 'ТаблицаСведений' я перехожу к строке:
		| "Вид сведений" | "Сведение" |
		| "Номер версии" | "$$НомерВерсииРозницаГлобально$$"  |


	И я добавляю информацию в лог "Сценарий Тестирование HTTP OTP выполнен успешно"
		