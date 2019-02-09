_TODO:_
+ сделать отдельную ссылку для тех, кому нужен просто код
# Пишем эксель скрипт для учёта личных финансов  
## 1. Зачем?  
  
  Строго субъективное наблюдение, что достаточно сложно нон-стоп следить за своими ресурсами. 

## 2. Нашёл я библиотеку  
Не потратив на поиски и 10 минут, открыл первую вкладку в гугле и посмотрел чтобы в моей избраннице было:  
+ Создание нескольких листов  
+ Считывание уже готового файла  
+ Остальное не имеет значения, только удобство увеличивает  

Итак мы будем использовать библиотеку openpyxl  

Дабы облегчить себе жизнь, разделим всю программу на две подзадачи:  
1. Написать скрипт для создания новой таблицы   
2. Написать скрипт для собственно добавления новой строчки в таблицу  

На счёт первого пункта может показаться что это не лучшая идея, но с другой стороны, достаточно просто завести гитхаб аккаунт, выучить пару команд на гите и случайные ошибки не будут иметь никакого влияния.  
  
Немного посмотрев документацию, выделяем для себя функции, которые будут наиболее важны:  
+ **создание объекта** и первого листа в нём:
```
from openpyxl import Workbook, load_workbook
wb = Workbook() # Для создания объекта таблицы
ws = wb.active # Обращаемся к первой странице таблицы
```
+ **задать значение** ячейки А1 ( как и любой другой ) можно следующими методами:
```
ws['A1'] = value
d = ws.cell(row=1, column=1, value=value) # Задаёт значение и возвращает ячейку

cell = ws['A1']
cell.value = value
```
+ **Сохранения в файл**
```
wb.save('file.xlsx')
```
+ **Загрузка из файла**
```
wb = load_workbook('fins.xlsx')
```
С остальным разберёмся по ходу дела :)

Стоит отметить что листы ( как и ячейки ) создаются при любом обращении к ним

## 3. Шапка

Так как нам надо отдельно создавать таблицу и её редактировать, возьпользуемся преимуществом ключей.  
Для этого подключим библиотеку sys ( заодно и библиотеки для excel )
```
import sys
from openpyxl import Workbook, load_workbook

from openpyxl.styles.alignment import Alignment # Выравнивание
from openpyxl.styles import PatternFill # Фон
```
Если один из ключей -maketable, надо задать таблицу.  
Инициализируем некоторые начальные массивы, которые понадобятся нам в будущем:
```
days = ['Monday', 'Tuesday', 'Wednesday', 'Thursday', 'Friday', 'Saturday', 'Sunday']
spec = ['name', 'cost', 'general cost']
colors = ['FFFFCC', 'CCFFCC', 'CCFFFF', 'CCCCFF', 'FFCCFF', 'FFCCCC', 'FF9999'] # Для расцветки столбцов

```
Основная часть кода для таблицы:
```
for arg in sys.argv:
    if arg in "-maketable":
        print("Making table")

        wb = Workbook() # создаём объект
        pays = wb.active # создаём главную страницу
        pays.title = "Pays" # Даём ей имя Pays

        pays["A1"] = "Days" # Верхняя строка будет отвечать за дни недели 
        pays["A2"] = "Date\\Type" # Первый столбец - даты
        # вторая строка - тип данных которые записываются

        # Склеиваем верхние стобцы по три семь раз ( в соответствии каждому дню )
        for i in range(1, 8):
            curr_col = i * 3 - 1
            next_col = i * 3 + 1

            pays.merge_cells(start_row=1, end_row=1, start_column=curr_col, end_column=next_col)
            curr_cell = pays.cell(row=1, column=curr_col, value=days[i - 1])
```
На данном этапе у нас получается следующая таблица  
![Image alt](https://github.com/Kipparis/ohboy/raw/excel_python/fin/readme/1.png)  
  
Видим что первый столбец слишком мал, а остальные столбцы слишком больши ( нет смысла в больших пустих столбцах ( разве что для эстетов ))  
  
Для этого создаём следующую функцию:
```
def correct_table(ws):
    for col in ws.columns:
            max_length = 0
            column = col[0].column # Get the column name
            for cell in col:
                try: # Necessary to avoid error on empty cells
                    if len(str(cell.value)) > max_length:
                        max_length = len(cell.value)
                except:
                    pass
            adjusted_width = (max_length + 2) * 1.2
            ws.column_dimensions[column].width = adjusted_width
```
Таблица приобретает новый вью:  
![Image alt](https://github.com/Kipparis/ohboy/raw/excel_python/fin/readme/2.png)  
  











Создаём подтипы для заполнения:
```
for i in range(1, 8):
    for j in range(3):
        curr_cell = pays.cell(row=2, column=i * 3 - 1 + j, value=spec[j])
```
Фактически, шапка таблицы готова, но для большой разборчивости, у каждой клетки кроме левые верхних двух, изменяем внешний вид:  
```
curr_cell.alignment = Alignment(horizontal='center') # Выравниваем на центр
# Задаём задний план и тип заполнения ( выбрал самый бледный )
curr_cell.fill = PatternFill(bgColor=colors[i - 1], fill_type = "gray0625") 
```
Фиксируем ( замораживаем ) верхние две строчки ( чтобы не мотать таблицей дабы узнать в какой именно день недели произошла затрата ) и сохраняем:
```
wb["Pays"].freeze_panes = pays.cell(row=3, column=7 * 3 + 1)
wb.save('fins.xlsx')
print("All ok")
```
Как результат имеем следующую шапку:  
![Image alt](https://github.com/Kipparis/ohboy/raw/excel_python/fin/readme/3.png)  
## 4. Добавление списка купленного  
Вторая часть туториала, пожалуй, будет интереснее первого :)
Основа заполнения в том, что мы будем по текущему дню недели и дате находить соответствующую колонку и строчку и закидывать её нашими продуктами.  
Понадобится библиотека datetime:
```
from datetime import datetime, timedelta # Time delta пригодится для определения принадлежности дня какой либо недели в таблице
```
Иницаилизируем полезные переменные:
```
# Загружаем файл и достаём лист
wb = load_workbook('fins.xlsx')
pays = wb['Pays']

# Находим текущую дату и день недели
today = datetime.now()
week_day = today.weekday()
        
# Находим день-начало недели, конец недели
past_date = today - timedelta(days=week_day)
future_date = today + timedelta(days=(7 - week_day))
```
  
Просим уважаемого пользователя ввести данные, явно указывая что именно:
```
# Инициализируем списки вне цикла, дабы пользоваться ими позднее
names = []
costs = []
print("type 'end' to add products to table") # Объясняем правило выхода из ввода
while True:
    # Если хотя бы одно из полей - end => выходим из цикла
    name = input("Name your product:\n->")
    if name in "end":
        break

    cost = input("Type down its cost:\n->")
    if cost in "end":
        break

    # Добавляем в массивы
    names.append(name) 
    costs.append(cost)
```
Суть нашего дальнейшего мува заключается в следующем:  
1. Если в таблице ещё вообще нету дат переходим к п.2, если есть - к п.3
2. Создаём дату соответствующую текущему началу недели
3. Ищем дату соответствующую текущему началу недели
4. Если не находим - создаём новую
    - Для упрощённого создания, все занятые строчки помечаются слева звёздочкой, так мы поймём что дату ужно вставлять ниже


```
col = pays['A']

check_row = len(col)

# Создаём дату если таблица совсем пустая:
if len(pays['A']) <= 2:
    check_row = 3

    pays.cell(
        row=check_row, 
        column=1, 
        value="{}/{}/{}".format(past_date.day, past_date.month, past_date.year)
        )

# Идём снизу и ищем дату
cell = pays.cell(row=check_row, column=1)
while '*' in str(cell.value):
    check_row -= 1
    cell = pays.cell(row=check_row, column=1)

# Нашли ячейку с датой => достаём инфу
cell_date = str(cell.value)

cell_past_date = datetime(
    year=int(cell_date.split('/')[-1]),
    month=int(cell_date.split('/')[1]),
    day=int(cell_date.split('/')[0])                
)

date_row = 0

# Если даты совпадают, то надо начинать с последней даты
if past_date.day == cell_past_date.day and past_date.month == cell_past_date.month and past_date.year == cell_past_date.year:
    start_row = check_row
    date_row = check_row
else:
    # Если не совпадают, создаём новую дату ниже всех звёздочек
    start_row = len(col) + 1
    pays.cell(
        row=start_row, 
        column=1, 
        value="{}/{}/{}".format(future_date.day, future_date.month, future_date.year)
        )
    date_row = start_row
```

Коротко о дальнейшем:
+ Находим номер колонны с текущим днём недели  
+ Идём снизу и ищем последний непустую клетку ( но не дальше самой даты слева )  
+ Ежели нашли такую клетку, двигаемся вниз на одну и начинаем заполнение из массивов  
+ Если нет, то начинает со строки где находится дата  
+ Заполняем формулу в соответствующей клетке напротив даты
    - Формулу обновляем на каждом добавлении к этому дню считая от самой первой покупки
    - Применяем к ней выравнивание
+ Расширяем или сужаем клетки функцией correct_table(pays)  
```
curr_col = 2 + week_day * 3

start_row = len(pays['A']) + 1
cell = pays.cell(row=start_row, column=curr_col)

while not cell.value:
    print("Cell row: {}".format(start_row))
    start_row -= 1
    cell = pays.cell(row=start_row, column=curr_col)
        
start_row += 1

# Выбираем между верхней пустой и строчкой с датой
start_row = max(date_row, start_row)

# Вбиваем имя продукта, цену, звёздочку слева ( если там нет даты )
for spend in zip(names, costs):
    pays.cell(row=start_row, column=curr_col, value=spend[0])
    pays.cell(row=start_row, column=curr_col+1, value=int(spend[1]))

    if not pays.cell(row=start_row, column=1).value:
        pays.cell(row=start_row, column=1, value='*')

    start_row += 1

# Сливаем клетки справа чтобы можно было выводить общую стоимость
pays.merge_cells(start_row=date_row, end_row=start_row-1, start_column=curr_col+2, end_column=curr_col+2)
# Записываем формулу
curr_cell = pays.cell(row=date_row, column=curr_col+2, value="=SUM({0}{1}:{0}{2})".format(get_column_letter(curr_col+1), date_row, start_row-1))
# Ставим выравнивание
curr_cell.alignment = Alignment(vertical='center', horizontal='center') 

# Расширяем или сужаем клетки
correct_table(pays)

# Сохраняем таблицу
wb.save('fins.xlsx')
```

В самом конце просто для себя :)
```
print("\nended\n***********")
```