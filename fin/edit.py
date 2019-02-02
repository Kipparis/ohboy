#!python

print("___________\nstarted\n")

import sys

from openpyxl import Workbook, load_workbook

for arg in sys.argv:
    if arg in "-maketable":
        # создаём таблицу
        wb = Workbook()
        pays = wb.active
        pays.title = "Pays"

        pays["A1"] = "Days"

        days = ['Monday', 'Tuesday', 'Wednesday', 'Thursday', 'Friday', 'Saturday', 'Sunday']
        spec = ['name', 'cost', 'general cost']

        # Merge cells and set names
        for i in range(1, 8):
            # Find two side columns to merge 
            curr_col = i * 3 - 1
            next_col = i * 3 + 1

            pays.merge_cells(start_row=1, end_row=1, start_column=curr_col, end_column=next_col)
            curr_cell = pays.cell(row=1, column=curr_col, value=days[i - 1])

        # for i in range(1, 50):
        #     pays.cell(row=i + 1, column=1, value=i)
        
        # Fixate row
        # row = pays['A1']

        # pays.freeze_panes = row
        # freezes all above and left
        
        # wb["Pays"].freeze_panes = pays.cell(row=2, column=7 * 3 + 1)


        wb.save('fins.xlsx')





# wb = load_workbook('fins.xlsx')

# # ws = wb.active
# ws = wb["Pays"]

# # col = ws['A']

# # Не работает почему то :(
# col = ws['A']
# for cell in col:
#     cell.value = 10

# ws['A1'] = 1
# ws['A6'] = 1

# for col in ws.iter_cols(min_row=1, max_col=3, max_row=2):
#     for cell in col:
#         print(cell.value)


print("\nended\n***********")