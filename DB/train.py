from msilib.schema import tables
import sqlite3
import os

conn = sqlite3.connect('railways.db')
cursor = conn.cursor()
  
def create_tables(dataBase:str, folder:str):
    
    conn = sqlite3.connect(dataBase)
    
    for filename in os.listdir(folder):
        with open(f"{folder}/{filename}", 'r', encoding="utf_8") as f:
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
        
        
create_tables('railways.db', 'C:/Users/Max/Documents/Repositories/LocalTrainsDB/RequestsSQL')

TablePrinter("client_documents")
TablePrinter("geo_entities")
TablePrinter("locomotive_types")
TablePrinter("run_plans")
TablePrinter("tickets")