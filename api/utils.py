import os
import psycopg2


def get_db_instance():
    ''''Will return a writeble database
    
    return:
        Databse conenection instance
    '''
    connection = None
    try:
        connection = psycopg2.connect(dsn=os.environ.get('DATABASE_URL'))
    except Exception as e:
        connection = psycopg2.connect(dsn='postgres://pohzkqavlncxry:ca56ea590d6a5179e631be44628e4d63aef8dd3b8b807fd168405ccb49b362ea@ec2-54-224-120-186.compute-1.amazonaws.com:5432/diemh0uen367e')
    return connection


def isAdmin(username:str):
    conn  = get_db_instance()
    conn.autocommit=True
    cur = conn.cursor()
    cur.execute("SELECT * FROM Auction_house WHERE name=%s", (username,))
    IsAdmin = cur.fetchall()
    if(len(IsAdmin) == 0):
        return False
    else:
        return True
