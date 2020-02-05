#!python3

import os
from utils.dtypes import StringBool


import argparse
parser = argparse.ArgumentParser(description="write a test, store "
        "results in db, than programm will decide what words to give you")
parser.add_argument("db_file_name", help="db filename for store results")
parser.add_argument("-c", "--create", help="create new db",
        action="store_true")
args = parser.parse_args()

if args.create: 
    inp = StringBool(input("Are you sure you want to recreate database "
            "(operation will remove any file/folder/symnlink on "
            "specified path - '{}')\ny,[n]: ".format(args.db_file_name)))
    if inp:
        if os.path.exists(args.db_file_name):   # check file exists
            os.remove(args.db_file_name)        # if so, remove

import sqlite3 # https://docs.python.org/3/library/sqlite3.html
db_conn = sqlite3.connect(args.db_file_name)

# TODO: in loop:
#   1. ask user how many words he wants to learn (default = 7)
#   2. ask user which categories does he prefer (default = all)
#   3. run test
#   4. collect how many words from each category does he answered,
#       output statistic
#       on welcom page output this statistic
#       and percantage of overall words knowledge
