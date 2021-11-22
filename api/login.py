import psycopg2

from api.utils import get_db_instance


def login(**kwargs):
    conn = None
    try:
        conn = get_db_instance()
        cur = conn.cursor()
        cur.execute("CREATE TABLE IF NOT EXISTS app_user (name varchar(40), password varchar(120), phone varchar(20), address varchar(40), user_id int)")
        cur.execute("SELECT * FROM app_user WHERE name= %s", (kwargs.get('user_name'),))
        data = cur.fetchall()
        cur.close()
        conn.close()
        if len(data) == 0:
            return {'error': True, 'message': 'User not found'}
        else:
            if data[0][2] == kwargs.get('user_password'):
                return {'error': False, 'message': 'Success', 'user_id': data[0][0]}
            else:
                return {'error': True, 'message': 'Wrong password'}
    except (Exception, psycopg2.DatabaseError) as _:
        if conn is not None:
            conn.close()
        return {'error': True, 'message': 'Database error'}