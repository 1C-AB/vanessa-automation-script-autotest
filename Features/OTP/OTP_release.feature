﻿#language: ru

@tree

Функционал:Проверка записи о новом релизе

Как Администратор я хочу
открыть форму записии о ново релизе 
чтобы сделать запись и проверить признак актуальности

Контекст:
	Дано Я запускаю сценарий открытия TestClient или подключаю уже существующий

Сценарий: <описание сценария>

* Объявление переменных

И я запоминаю строку "27.12.2024" в переменную "$$ДатаАктуальногоРелизаУНФГлобально$$"
И я запоминаю строку "1.1.1.1.1" в переменную "$$ВерсияАктуальногоРелизаУНФГлобально$$"
И я запоминаю строку "22.01.2024" в переменную "$$ДатаПрошлогоРелизаУНФГлобально$$"
И я запоминаю строку "1.0.3.14" в переменную "$$ВерсияПрошлогоРелизаУНФГлобально$$"
И я запоминаю строку "АБ_WZ_УНФИнтеграцияСWazzup" в переменную "$$УНФГлобально$$"

* Запись о новом релизе
И В командном интерфейсе я выбираю "ОТП 1АБ" "Сделать запись о новом релизе"
Тогда открылось окно "Запись о новом релизе"
И я устанавливаю флаг с именем "СделатьАктуальным"
И из выпадающего списка с именем 'Проект' я выбираю точное значение "$УНФ$"
И я нажимаю кнопку выбора у поля с именем 'ДатаВерсии'
И в поле с именем 'ДатаВерсии' я ввожу текст "$$ДатаАктуальногоРелизаУНФГлобально$$"
И в поле с именем 'НомерВерсии' я ввожу текст "$$ВерсияАктуальногоРелизаУНФГлобально$$"
И я нажимаю на кнопку с именем 'ЗаписатьИЗакрыть'
И я жду открытия окна "1С:Предприятие" в течение 20 секунд
Когда открылось окно "1С:Предприятие"
И я жду появления элемента "Icon group" в течение 20 секунд
И я нажимаю на кнопку 'Да'
И В командном интерфейсе я выбираю "ОТП 1АБ" "Релизы проектов"

* Проверка актуальности текущего релиза
Тогда открылось окно "Релизы проектов"
И в таблице 'Список' я устанавливаю сортировку по колонке 'Период'
И в таблице 'Список' я устанавливаю сортировку по колонке 'Период'
И в таблице 'Список' я перехожу к строке:
	| "Актуальный" | "Проект" | "Сведения"     |
	| "Да"         | "$$УНФГлобально$$"  | "$$ДатаАктуальногоРелизаУНФГлобально$$" |

* Проверка снятия актуальности с прошлого релиза
И в таблице 'Список' я перехожу к строке:
	| "Актуальный" | "Проект" | "Сведения"     |
	| "Нет"         | "$$УНФГлобально$$"  | "$$ДатаПрошлогоРелизаУНФГлобально$$" |