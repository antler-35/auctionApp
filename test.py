# test here
from api.utils import get_db_instance
import random

def insert():
    conn = get_db_instance()
    conn.autocommit = True
    curr = conn.cursor()
    curr.execute("select * from app_user")
    data = curr.fetchall()
    for i in data:
        curr.execute("UPDATE app_user SET balance = %s WHERE user_id= %s",(random.randint(5000,20000),i[0]))

insert()