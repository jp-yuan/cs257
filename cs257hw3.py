# -*- coding: utf-8 -*-
"""
Spyder Editor

This is a temporary script file.
"""
##

import psycopg2
import os
from psycopg2 import sql

hostname = 'localhost'
database = 'cs257'
username = 'postgres'
pwd = 'Jianpeng0122'
port_id = 5432

conn = None
cur = None
try:
    #connect into postpresql database
    conn = psycopg2.connect(
        host = hostname,
        dbname = database,
        user = username,
        password = pwd,
        port = port_id)
    
    cur = conn.cursor()
    
    #create table if the table not exist
    create_table_query = """
    CREATE TABLE IF NOT EXISTS Family (
            id SERIAL PRIMARY KEY,
            tree XML
        )
    """
    cur.execute(create_table_query)
    conn.commit()
    
    #get file from local os
    xml_files = [f for f in os.listdir('/Users/jianpengyuan/Desktop/untitled folder') if f.startswith("tree") and f.endswith(".xml")]
    
    
    for file in xml_files:
        #create local directory
        file_path = os.path.join('/Users/jianpengyuan/Desktop/untitled folder', file)
        with open(file_path, 'r') as f:
            xml_data = f.read()
            
            #insert files to database
            insert_query = sql.SQL("INSERT INTO Family (tree) VALUES (%s)")
            cur.execute(insert_query, [xml_data])
            conn.commit()
    
    #xpath to select the father's name of the person whose age is greater than 20
    xpath_query = """
    SELECT xpath('//person[Age>20]/FatherName', tree) AS result
    FROM Family;
    """
    
    cur.execute(xpath_query)
    conn.commit()
    print('success')
    
    #print the result
    results = cur.fetchall()
    print(results[0][0])
        
except Exception as error:
    print(error)
    
finally:
    if cur is not None:
        cur.close()
    if conn is not None:
        conn.close()
