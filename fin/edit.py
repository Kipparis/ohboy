#!python

print("___________\nstarted\n")

import os, sys

from openpyxl import Workbook, load_workbook

for arg in sys.argv:
    if arg in "-maketable":
        # создаём таблицу
        wb = Workbook()
        pays = wb.active
        pays.title = "Pays"

        pays["A1"] = "Days"

        # Filling with sht to make changes visible
        # cell_range = pays['B1':'E5']

        # for cols in cell_range:
        #     for cell in cols:
        #         cell.value = 4

        # pays.column_dimensions['B'].width = 12

        days = ['Monday', 'Tuesday', 'Wednesday', 'Thursday', 'Friday', 'Saturday', 'Sunday']
        spec = ['name', 'cost', 'general cost']

        # Merge cells and set names
        for i in range(1, 8):
            # pays.cell(row=i, column=i, value=i)
            # Groupted them
            curr_col = i * 3 - 1
            next_col = i * 3 + 1
            curr_cell = pays.cell(row=1, column=curr_col, value=days[i - 1])
            next_cell = pays.cell(row=1, column=next_col)

            pays.merge_cells(start_row=1, end_row=1, start_column=curr_col, end_column=next_col)
            # next_cell = pays.cell(row=1, column=i * 3)
            # to pretend bugs

        for i in range(1, 50):
            pays.cell(row=i + 1, column=1, value=i)
        
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