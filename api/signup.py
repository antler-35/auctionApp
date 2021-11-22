import time
import psycopg2
import random

from api.utils import get_db_instance


def signup(password: str, name: str, phone: str, address: str):
    conn = get_db_instance()
    result = {'error': True, 'data': "can't connect to database"}
    balance = random.randint(5000,20000)
    if conn:
        try:
            result = {'error': True, 'message': 'User Already Exists'}
            conn.autocommit = True
            cur = conn.cursor()
            cur.execute("""
                CREATE TABLE IF NOT EXISTS app_user (
                    name varchar(40), password varchar(120), phone varchar(20), address varchar(40), user_id int
                )"""
            )
            cur.execute("SELECT name FROM app_user WHERE name=%s",(name,))
            if not cur.fetchone():
                cur.execute("""
                    INSERT INTO app_user (name, password, phone, address, user_id,balance)
                    VALUES(%s, %s, %s, %s, %s, %s)""", (
                        name,
                        password,
                        phone,
                        address,
                        int(time.time()),
                        balance,
                    ))
                cur.execute("SELECT * FROM app_user WHERE name = %s", (name,))
                id = 0
                data = cur.fetchone()
                if data:
                    id = data[0]
                cur.close()
                conn.close()
                result = {'error': False, 'message': 'User Created', "user_id": id}
        except (Exception, psycopg2.DatabaseError) as _:
            conn.close()
            result = {'error': True, 'message': 'User Not Created'}
    return result
