from msilib.schema import tables
import sqlite3
import os




def executeAllInFolder( folder:str, dataBase:str = "database.db", encoding:str = "UTF16"):    
    conn = sqlite3.connect(dataBase)
    
    for filename in os.listdir(folder):
        if filename[-3::] == "sql":
            with open(os.path.join(folder,filename), 'r', encoding = encoding) as sqlrequest:
                script = sqlrequest.read()
                conn.executescript(script)
    
    conn.commit()
    conn.close()
    
    
def executeRequest( requestPath:str, dataBase:str = "database.db", encoding:str = "UTF16"):
    conn = sqlite3.connect(dataBase)
    
    with open(requestPath, 'r', encoding = encoding) as sqlrequest:
        script = sqlrequest.read()
        conn.executescript(script)
    
    conn.commit()
    conn.close()
    
    
def showRawTable(tableName:str, dataBase:str = "database.db"):
    conn = sqlite3.connect(dataBase)
    cursor = conn.cursor()
    
    cursor.execute(f''' SELECT * FROM {tableName}; ''')
    res = cursor.fetchall()
    for r in res:
        print(r)
        
    conn.commit()
    conn.close()
    
def showTable(requestPath:str, dataBase:str = "database.db", encoding:str = "UTF16"):
    conn = sqlite3.connect(dataBase)
    cursor = conn.cursor()
    
    with open(requestPath, 'r', encoding = encoding) as sqlrequest:
        script = sqlrequest.read()

    cursor.execute(script)
    res = cursor.fetchall()
    for r in res:
        print(r)
    
    conn.commit()
    conn.close()

if os.path.exists("railways.db"):
    os.unlink("railways.db")

executeAllInFolder('RequestsSQL', 'railways.db')

showTable("RequestsSQL\show_tickets.sql", "railways.db")
showTable("RequestsSQL\show_timetable.sql", "railways.db")