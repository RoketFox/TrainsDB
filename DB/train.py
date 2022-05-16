from msilib.schema import tables
import sqlite3
import os

conn = sqlite3.connect('railways.db')
cursor = conn.cursor()
  
def CreateTables(dataBase:str, folder:str):
    
    conn = sqlite3.connect(dataBase)
    
    for filename in os.listdir(folder):
        with open(f"{folder}/{filename}", 'r', encoding="UTF16") as f:
            script = f.read()
            conn.executescript(script)
    
    conn.close()
    
def TablePrinter(tableName):
    cursor = conn.cursor()
    cursor.execute(f'''
    SELECT * FROM {tableName};''')
    res = cursor.fetchall()
    for r in res:
        print(r)
        
def Showrpt():
    
    conn = sqlite3.connect('railways.db')
    cursor = conn.cursor()
    
    with open('RequestsSQL/show_tickets.sql', 'r', encoding="UTF16") as show_rpt_script:
        script = show_rpt_script.read()

    cursor.execute(script)
    res = cursor.fetchall()
    for r in res:
        print(r)
        
def Showtick():
    
    conn = sqlite3.connect('railways.db')
    cursor = conn.cursor()
    
    with open('RequestsSQL/show_timetable.sql', 'r', encoding="UTF16") as show_rpt_script:
        script = show_rpt_script.read()

    cursor.execute(script)
    res = cursor.fetchall()
    for r in res:
        print(r)

CreateTables('railways.db', 'RequestsSQL')

Showrpt()
print("###############################################################################################")
Showtick()