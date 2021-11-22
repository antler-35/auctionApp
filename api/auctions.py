import time
import psycopg2
from .utils import get_db_instance,isAdmin


def getCategory(user_id:str,email:str):
    conn = None
    try:
        conn = get_db_instance()
        conn.autocommit = True
        cur = conn.cursor()
        admin = isAdmin(email)
        if(admin == True):
            cur.execute("""SELECT table_name 
FROM information_schema.tables 
WHERE table_schema='public' AND table_type='BASE TABLE'
""")
            data = cur.fetchall()
            cur.close()
            conn.close()
            if len(data) == 0:
                return {'error': True, 'message': 'Database Empty'}
            else:
                return {'error': False, 'auctions': data}
        else:
            return {'error': False, 'auctions': [["product_listed_by_seller"],["bid_regarding_product"]]}
    except Exception as _:
        if conn is not None:
            conn.close()
        return {'error': True, 'data': "can`t connect to database"}



def offers(**kwargs):
    """params from ui for filtering db are
    offered_by,
    bid_id
    """
    conn = None
    try:
        conn = get_db_instance()
        conn.autocommit = True
        cur = conn.cursor()
        cur.execute("""Select a.*,b.name From Offers a inner join App_user b on (a.user_id = b.user_id)""")
        data = cur.fetchall()
        """This is filter logic to filter the data taken from params that is coming from ui"""

        if(kwargs["offered_by"] != ""):
            cur.execute("""Select a.*,b.name From Offers a inner join App_user b on (a.user_id = b.user_id) where b.name=%s""",(kwargs["offered_by"],))
            data = cur.fetchall()
            if(len(data)==0 and kwargs['bid_id'] != ""):
                cur.execute("""Select a.*,b.name From Offers a inner join App_user b on (a.user_id = b.user_id) where a.bid_id= %s""",(kwargs["bid_id"],))
                data = cur.fetchall()
        cur.close()
        conn.close()
        if len(data) == 0:
            return {'error': True, 'message': 'Database Empty'}
        else:
            data.insert(0, ("Offered_By","Bid_Id"))
            return {'error': False, 'auctions': data}
    except Exception as _:
        if conn is not None:
            conn.close()
        return {'error': True, 'data': "can`t connect to database"}



def besthouses(items:int):
    conn = None
    try:
        conn = get_db_instance()
        conn.autocommit = True
        cur = conn.cursor()

        cur.execute(""" SELECT house_id,completed_transactions,admin_login,admin_password_hash,name
                    FROM auction_house order by completed_transactions desc limit %s""", (items,)
        ) 

        data = cur.fetchall()
        cur.close()
        conn.close()
        if len(data) == 0:
            return {'error': True, 'message': 'Database Empty'}
        else:
            data.insert(0, ("house_id","completed_transactions","admin_login","admin_password_hash","name"))
            return {'error': False, 'besthouseslist': data}
    except Exception as _:
        if conn is not None:
            conn.close()
        return {'error': True, 'data': "can`t connect to database"}


    