**Документация коду "Скрипт автоматизации обновления и тестирования"**

**Общее описание**

Данный код предназначен для автоматизации процессов:

- Обновления базы данных.
- Запуска тестовых сценариев с использованием Vanessa Automation (далее VA).
- Подготовки результатов тестирования.
- Отправки отчетов о результатах тестирования по электронной почте.

Исходники лежат <https://github.com/1C-AB/vanessa-automation-script-autotest> 

Нужно клонировать репозиторий в любую директорию. *Путь не должен содержать кириллические символы*

Иерархия репозитория: 

- **Features** – фича-файлы для тестирования (сценарии тестирования)
- **Scripts** – скрипт и настройки к нему, и скрипт запуска на PowerShell
- **VaParams** – настройки VA (далее везде отсылка к этой папке **VaParams**)

*Скрипт настроен и готов к работе, все параметры выбираются в файле Scripts/Settings.txt*

**Запуск тестирования**

Перед запуском тестирования необходимо настроить менеджер и клиент тестирования.

1. Базу откуда будет запускаться тестирование необходима открыть как *менеджер тестирования*, для этого параметрах подключения указывается `/TestManager`
   ![Aspose Words 7ef5f5f2-ab07-47b8-9392-69f1c249303d 001](https://github.com/user-attachments/assets/6fbe4def-28f0-4fd7-93f4-8b03abf5ec51)
2. В клиенте тестирования необходимо подключчить расширение для тестирования, актуальную версию необходимо скачать <https://pr-mex.github.io/vanessa-automation/dev/>
а также внешняя обработка VA (.epf не сингл версия) и *расширение VA* (.cfe) последние версии которых можно найти тут   .

Тестирование запускается через файл RunScript.PS1 или 

командную строку: ПутьКИсполнителю "ПутьКСрипту" ПутьКНастройкам ПараметрОбновления, где;
-*ПутьКИсполнителю (обязательный) - D:\Executor\executor\_u\_6\_0\_4\_25\executor.cmd 
-*ПутьКСрипту (обязательный) - D:\GitHub\vanessa-automation-script-autotest\Scripts\UpdateAndTestVanessa.sbsl 
-*ПараметрОбновления (необязательный, по умолчанию «Обновлено» )  - ВыполнитьОбновление

Пример:

```D:\Executor\executor\_u\_6\_0\_4\_25\executor.cmd "D:\GitHub\vanessa-automation-script-autotest\Scripts\UpdateAndTestVanessa.sbsl" D:\GitHub\vanessa-automation-script-autotest\Scripts\Settings.txt ВыполнитьОбновление```

В случае изменения клиента тестирования(например протестировать другую базу или настройки подключения изменились) необходимо изменить настройки подключения в обработке VA.
Как изменить или добавить [клиент тестирования](#_добавление_нового_клиента)

### <a name="_добавление_нового_клиента"></a>**Добавление нового клиента тестирования**

1. Запускаем менеджер тестирования и открываем как файл внешнюю обработку. 
2. Ожидаем полной загрузки: появления панели задач и пунктов меню. Загружаем настройки из папки **VaParams** 

![Aspose Words 7ef5f5f2-ab07-47b8-9392-69f1c249303d 002](https://github.com/user-attachments/assets/33ea78ee-883c-4a18-a2a2-495d4200d232)

3. На правой панели настроек выбираем «Клиенты тестирования». Если в списке клиентов нет нужного, добавляем его:
  1. Вводим параметры подключения
  2. Жмем «Сохранить»
  
    ![Aspose Words 7ef5f5f2-ab07-47b8-9392-69f1c249303d 003](https://github.com/user-attachments/assets/3288c5b8-0de0-4535-b67b-6d2f5e0e5114)

  3. Тестируем подключение. Если клиент подключился корректно, строка с клиентом тестирования будет подсвечена *зеленым цветом*, переходим к п.4, иначе повторяем 1, 2, 3
  4. Жмем на «Шестеренку» в верхней панели настроек.
  5. Жмем «Сохранить настройки»
  6. Жмем «Выгрузить настройки в файл»

    ![Aspose Words 7ef5f5f2-ab07-47b8-9392-69f1c249303d 004](https://github.com/user-attachments/assets/5023ba9c-54d4-4ece-bf1c-6c1fd315bf5c)

  7. Выбираем путь до папки **VaParams**

**Описание API**
-----
**2. Основные сущности и структуры**

- **Исключения**: 
  - ИсключениеПараметровПочты: выбрасывается при ошибках отправки почты.
  - ИсключенияПолученияПеременныхСреды: выбрасывается при невозможности получения переменных окружения.
- **Структура РезультатОбновления**: 
  - Поле РезультатОбновления: Строка — хранит имя файла с результатами обновления.
-----
**3. Основные методы**

**3.1. Скрипт**

**Назначение:** Главный метод, управляющий процессом обновления базы, тестирования сценариев и отправки отчетов.

**Параметры:**

- НастройкиКонфигурации: Строка — путь к файлу с настройками.
- ПараметрОбновления: Строка — параметр, определяющий необходимость обновления базы.

**Действия:**

1. Загружает настройки конфигурации.
1. Выполняет обновление базы, если это необходимо.
1. Формирует параметры для запуска Vanessa Automation.
1. Запускает тестовые сценарии Vanessa Automation..
1. Формирует тему письма и отправляет отчет о результатах тестирования.

**3. 2 Метод ВозвращениеПараметров**

**Назначение:** Загружает параметры конфигурации из файла.

**Параметры:**

- ПутьКфайлу: Строка — путь к файлу настроек.

**Возвращаемое значение:** Соответствие параметров.
```
знч КомандаЗапуска – платформа (пример: C:\Program Files\1cv8\8.3.24.1586\bin\1cv8.exe )
знч ПользовательБазы = Пользователь базы менеджера тестирования (пример: «Администратор»)
знч ПарольБазы = Пароль базы менеджера тестирования
знч ПутьКОбработке = Путь к обработке (пример: D:\VA\vanessa-automation.1.2.041.37\vanessa-automation\vanessa-automation.epf)
знч СтрокаПодключенияКБазе = Строка подключения к базе (пример: Srvr=""1ab-vss08"";Ref=""projects\_otp\_test"";)
знч VAParams = Путь JSON-файлу настроек VA (пример: D:\GitHub\vanessa-automation-script-autotest\VaParams\VAParams.json)
знч ТестовыеНастройки = Настройки с которыми запускается VA и сценарии. Так как для каждой конфигурации свои настройки, формируем тестовые, чтобы не затрагивать остальные (пример: D:\VA\TestParams\TestVAParams.json)
знч НастройкиКаталогаФич = Настройки каталога запуска конкретных сценариев теста в VA (пример: D:\GitHub\vanessa-automation-script-autotest\Features\WZ\UT\UnionUT.feature)
знч Логи = Путь к логам с результатами тестирования (пример: D:\VA\logs\log.txt)
```
**3.3 Метод**  ОбновлениеБазы

- **Описание:** Выполняет обновление базы данных перед тестированием.
- **Параметры:**
  - Обновить (Булево) — признак необходимости выполнения обновления.
  - ФайлОбновления (Строка) — путь к файлу обновления.
  - Пользователь (Строка) — имя пользователя для подключения к базе.
  - Пароль (Строка) — пароль пользователя.
  - СтрокаПодключения (Строка) — строка подключения к базе.
- **Примечания:** Метод выполняет обновление только если параметр Обновить имеет значение Истина.

**3.4. Метод ИзменитьНастройки**

**Назначение:** Обновляет параметры конфигурации для тестирования.

**Параметры:**

- VAParams: Строка — путь к JSON-файлу с параметрами VA.
- НастройкиКаталогаФич: Строка — путь к каталогу фич.
- ТестовыеНастройки: Строка — путь к тестовым настройкам.
- ПараметрОбновления: Строка — значение для обновления.

**Возвращаемое значение:** Файл с обновленными параметрами.

**3.5. Метод ТестированиеСценариев**

**Назначение:** Запускает тестовые сценарии с использованием Vanessa Automation.

**Параметры:**

- КомандаЗапуска: Строка — команда запуска VA.
- ПользовательБазы: Строка — пользователь базы данных.
- ПарольБазы: Строка — пароль пользователя.
- ПутьКРасширению: Строка — путь к расширению.
- СтрокаПодключенияКБазе: Строка — строка подключения к базе.
- НастройкиВанесса: Строка — параметры запуска VA.

**3.6 Метод ПодготовитьТемуПисьма**

**Назначение:** Формирует тему письма и результат на основе логов.

**Параметры:**

- НастройкиКаталогаФич: Строка — путь к каталогу фич.
- ПутьКЛогам: Строка — путь к файлу логов.

**Возвращаемое значение:** Соответствие с полями Тема и Результат.

**3.7. ОтправитьНаПочту**

**Назначение:** Отправляет отчет о результатах тестирования по почте.

**Параметры:**

- Тема: Строка — тема письма.
- Логи: Строка — путь к файлу логов.

**Действия:**

1. Получает данные для входа из переменных окружения.
1. Формирует письмо с вложением логов.
1. Отправляет письмо через SMTP-сервер.

**3.8. Метод ПолучитьПеременныеСреды**

**Назначение:** Получает переменные окружения для почтовой аутентификации.

**Возвращаемое значение:** Соответствие с данными о логине, пароле, отправителе и получателе.

**3.9. Метод ВернутьМассивПолучателей**

**Назначение:** Преобразует строку адресов в массив объектов АдресПочты.

**Параметры:**

- СтрокаАдресов: Строка — строка с адресами, разделенными точкой с запятой.

**Возвращаемое значение:** Читаемый массив объектов АдресПочты.


[ref1]: Aspose.Words.7ef5f5f2-ab07-47b8-9392-69f1c249303d.004.png
