from .utils import get_db_instance, isAdmin
import datetime
import random


def auctionHouse(**kwargs):
    """params from ui to filter the data are
    name,
    admin_login,
    """
    conn = None
    try:
        conn = get_db_instance()
        conn.autocommit = True
        cur = conn.cursor()
        cur.execute("""SELECT * FROM Auction_house""")
        data = cur.fetchall()
        """This is filter logic to filter the data taken from params that is coming from ui"""

        if(kwargs["name"] != ""):
            cur.execute(
                """SELECT * FROM Auction_house where admin_login= %s""", (kwargs["name"],))
            data = cur.fetchall()
            if(len(data) == 0 and kwargs['admin_login'] != ""):
                cur.execute(
                    """SELECT * FROM Auction_house where name= %s""", (kwargs["admin_login"],))
                data = cur.fetchall()
        cur.close()
        conn.close()
        if len(data) == 0:
            return {'error': True, 'message': 'Database Empty'}
        else:
            data.insert(0, ("house_id", "completed_transactions",
                        "admin_login", "admin_password_hash", "name"))
            return {'error': False, 'auctions': data}
    except Exception as _:
        if conn is not None:
            conn.close()
        return {'error': True, 'data': "can`t connect to database"}


def auctionHousetranscation(**kwargs):
    """params from ui to filter the data are
    Transaction_By,
    commission_taken,
    """
    conn = None
    try:
        conn = get_db_instance()
        conn.autocommit = True
        cur = conn.cursor()
        cur.execute(
            """Select a.*,b.name From Auction_house_transaction a inner join Auction_house b on (a.house_id = b.house_id)""")
        data = cur.fetchall()
        """This is filter logic to filter the data taken from params that is coming from ui"""

        if(kwargs["Transaction_By"] != ""):
            cur.execute("""Select a.*,b.name From Auction_house_transaction a inner join Auction_house b on (a.house_id = b.house_id) where b.name= %s""",
                        (kwargs["Transaction_By"],))
            data = cur.fetchall()
            if(len(data) == 0 and kwargs['commission_taken'] != ""):
                cur.execute(
                    """Select a.*,b.name From Auction_house_transaction a inner join Auction_house b on (a.house_id = b.house_id) where a.commission_taken= %s""", (kwargs["commission_taken"],))
                data = cur.fetchall()
        cur.close()
        conn.close()
        if len(data) == 0:
            return {'error': True, 'message': 'Database Empty'}
        else:
            data.insert(0,  ("transaction_id", "commission_taken", " payment_gateway", "payment_time",
                        "transaction_status", "payment_currency", "house_id", "Transaction_By"))
            return {'error': False, 'auctions': data}
    except Exception as _:
        if conn is not None:
            conn.close()
        return {'error': True, 'data': "can`t connect to database"}


def appUser(**kwargs):
    """params for filtering the db are
    name,
    balance
    """
    conn = None
    try:
        conn = get_db_instance()
        conn.autocommit = True
        cur = conn.cursor()
        cur.execute("""SELECT * FROM App_user""")
        data = cur.fetchall()
        if(kwargs["name"] != ""):
            cur.execute("""SELECT * FROM App_user where name= %s""",
                        (kwargs["name"],))
            data = cur.fetchall()
            if(len(data) == 0 and kwargs['balance'] != ""):
                cur.execute(
                    """SELECT * FROM App_user where balance= %s""", (kwargs['balance'],))
                data = cur.fetchall()

        cur.close()
        conn.close()
        if len(data) == 0:
            return {'error': True, 'message': 'Database Empty'}
        else:
            data.insert(0, ("user_id", "Name", "Password",
                        "Address", "Balance", "Phone"))
            return {'error': False, 'auctions': data}
    except Exception as _:
        if conn is not None:
            conn.close()
        return {'error': True, 'data': "can`t connect to database"}


def facilities(**kwargs):
    """parmas for filtering the db
    name,
    house_id,
    """
    conn = None
    try:
        conn = get_db_instance()
        conn.autocommit = True
        cur = conn.cursor()
        cur.execute(
            """Select a.*,b.name From Facilitates a inner join App_user b on (a.user_id = b.user_id)""")
        data = cur.fetchall()
        if(kwargs["name"] != ""):
            cur.execute(
                """Select a.*,b.name From Facilitates a inner join App_user b on (a.user_id = b.user_id) where b.name= %s""", (kwargs["name"],))
            data = cur.fetchall()
            if(len(data) == 0 and kwargs['house_id'] != ""):
                cur.execute(
                    """Select a.*,b.name From Facilitates a inner join App_user b on (a.user_id = b.user_id) where a.house_id= %s""", (kwargs['house_id'],))
                data = cur.fetchall()
        cur.close()
        conn.close()
        if len(data) == 0:
            return {'error': True, 'message': 'Database Empty'}
        else:
            data.insert(0, ("House_id", "user_id", "PRIMARY KEY", "Name"))
            return {'error': False, 'auctions': data}
    except Exception as _:
        if conn is not None:
            conn.close()
        return {'error': True, 'data': "can`t connect to database"}


def topbuyer(items: int):
    conn = None
    try:
        conn = get_db_instance()
        conn.autocommit = True
        cur = conn.cursor()
        cur.execute("""
        select d.user_id, d.name Buyer_name, concat('$',sum(a.current_bid_price))total_amount
        from Bid_regarding_product a inner join Product_listed_by_seller b on (a.product_id=b.product_id)
        inner join Offers c on (a.bid_id=c.bid_id)
        inner join app_user d on (c.user_id=d.user_id)
        where  a.status='1'
        group by  d.user_id,d.name 
        order by sum(a.current_bid_price) desc  limit %s""", (items,)
                    )
        data = cur.fetchall()
        cur.close()
        conn.close()
        if len(data) == 0:
            return {'error': True, 'message': 'Database Empty'}
        else:
            data.insert(0,  ("Buyer_id", "Buyer_name", "total_amount"))
            return {'error': False, 'topbuyer': data}
    except Exception as _:
        if conn is not None:
            conn.close()
        return {'error': True, 'data': "can`t connect to database"}


def topbuyerbyproduct(product_id: int, items: int):
    conn = None
    try:
        conn = get_db_instance()
        conn.autocommit = True
        cur = conn.cursor()
        cur.execute("""
        select d.user_id, d.name Buyer_name, concat('$',sum(a.current_bid_price))total_amount
        from Bid_regarding_product a inner join Product_listed_by_seller b on (a.product_id=b.product_id)
        inner join Offers c on (a.bid_id=c.bid_id)
        inner join app_user d on (c.user_id=d.user_id)
        where  a.status='0' and b.product_id = %s
        group by  d.user_id,d.name 
        order by sum(a.current_bid_price) desc  limit %s""", (product_id, items,)
                    )
        data = cur.fetchall()
        cur.close()
        conn.close()
        if len(data) == 0:
            return {'error': True, 'message': 'Database Empty'}
        else:
            data.insert(0,  ("Buyer_id", "Buyer_name", "total_amount"))
            return {'error': False, 'topbuyer': data}
    except Exception as _:
        if conn is not None:
            conn.close()
        return {'error': True, 'data': "can`t connect to database"}


def buyer(**kwargs):
    conn = None
    try:
        conn = get_db_instance()
        conn.autocommit = True
        cur = conn.cursor()
        cur.execute(
            """Select a.*,b.name From Buyer a inner join App_user b on (a.appuser_id = b.user_id)""")
        data = cur.fetchall()
        if(kwargs["name"] != ""):
            cur.execute(
                """Select a.*,b.name From Buyer a inner join App_user b on (a.appuser_id = b.user_id) where b.name= %s""", (kwargs["name"],))
            data = cur.fetchall()
        cur.close()
        conn.close()
        if len(data) == 0:
            return {'error': True, 'message': 'Database Empty'}
        else:
            data.insert(
                0,  ("user_id ", "Is_institution", "PRIMARY KEY", "Name"))
            return {'error': False, 'auctions': data}
    except Exception as _:
        if conn is not None:
            conn.close()
        return {'error': True, 'data': "can`t connect to database"}


def topseller(items: int):
    conn = None
    try:
        conn = get_db_instance()
        conn.autocommit = True
        cur = conn.cursor()
        cur.execute("""
        SELECT au.user_id,au.name, concat('$',sum(d.current_bid_price))total_amount  
        FROM seller s inner join app_user au on (s.appuser_id = au.user_id)
        inner join product_listed_by_seller c on (s.user_id = c.user_id)
        inner join bid_regarding_product d on (c.product_id = d.product_id)
        where d.status = true
        group by  au.user_id, au.name 
        order by sum(d.current_bid_price) desc  limit %s""", (items,)
                    )
        data = cur.fetchall()
        cur.close()
        conn.close()
        if len(data) == 0:
            return {'error': True, 'message': 'Database Empty'}
        else:
            data.insert(0,  ("Seller_id", "Seller_name", "total_amount"))
            return {'error': False, 'topseller': data}
    except Exception as _:
        if conn is not None:
            conn.close()
        return {'error': True, 'data': "can`t connect to database"}


def seller(**kwargs):
    conn = None
    try:
        conn = get_db_instance()
        conn.autocommit = True
        cur = conn.cursor()
        cur.execute(
            """Select a.*,b.name From Seller a inner join App_user b on (a.appuser_id = b.user_id)""")
        data = cur.fetchall()
        if(kwargs["name"] != ""):
            cur.execute(
                """Select a.*,b.name From Seller a inner join App_user b on (a.appuser_id = b.user_id) where b.name= %s""", (kwargs["name"],))
            data = cur.fetchall()
            if(len(data) == 0 and kwargs['active_listings'] != ""):
                cur.execute(
                    """Select a.*,b.name From Seller a inner join App_user b on (a.appuser_id = b.user_id) where a.active_listing= %s""", (kwargs['active_listings'],))
                data = cur.fetchall()
        cur.close()
        conn.close()
        if len(data) == 0:
            return {'error': True, 'message': 'Database Empty'}
        else:
            data.insert(
                0, ("user_id", "active_listings", "PRIMARY KEY", "Name"))
            return {'error': False, 'auctions': data}
    except Exception as _:
        if conn is not None:
            conn.close()
        return {'error': True, 'data': "can`t connect to database"}


def past_bids(**kwargs):
    conn = None
    try:
        conn = get_db_instance()
        conn.autocommit = True
        cur = conn.cursor()
        cur.execute(
            """Select o.* From Offers o inner join App_user a on (o.user_id = a.user_id) where o.user_id= %s""", (kwargs["user_id"], ))
        data = cur.fetchall()
        cur.close()
        conn.close()
        if len(data) == 0:
            return {'error': True, 'message': 'Database Empty'}
        return {'error': False, 'offers': data}
    except Exception as _:
        if conn is not None:
            conn.close()
        return {'error': True, 'data': str(_)}


def createNewProducts(**kwargs):
    conn = get_db_instance()
    id = random.randrange(1000, 100000)
    id2 = random.randrange(1000, 100000)
    if conn:
        try:
            conn.autocommit = True
            cur = conn.cursor()
            cur.execute("""
            INSERT INTO product_listed_by_seller (product_id,user_id, name, minimum_bid_price, description, reserve_price,status,product_list_time,auction_start_time,auction_end_time)
                        VALUES(%s, %s, %s, %s, %s, %s, %s, %s, %s, %s)""", (
                id,
                kwargs.get("user_id"),
                kwargs.get("name"),
                kwargs.get("minimum_bid_price"),
                kwargs.get("description"),
                kwargs.get("reserve_price"),
                kwargs.get("status"),
                datetime.datetime.now(),
                datetime.datetime.now(),
                datetime.datetime.now()+datetime.timedelta(10)
            ))
            cur.execute("""
            INSERT INTO Bid_regarding_product (bid_id,current_bid_price,product_id)
                        VALUES(%s, %s, %s)""", (
                id2,
                0,
                id,
            ))
            cur.execute(
                """SELECT * FROM Product_listed_by_seller where name= %s""", (kwargs.get("name"),))
            data = cur.fetchall()
            if(len(data) == 0):
                return {'error': False, 'message': "Product not created"}
            else:
                return{"error": False, "message": "Product Created"}
        except Exception as e:
            print(e)
            return {'error': True, 'data': e}
    return {'error': True, 'data': "can`t connect to database"}


def productListedBySeller(**kwargs):
    """params for filtering the db are
    offered_By,
    product_name,
    minimum_bid_price
    """
    conn = get_db_instance()
    if conn:
        try:
            conn.autocommit = True
            cur = conn.cursor()

            """This is filter logic to filter the data taken from params that is coming from ui"""
            name = kwargs.get("q")
            if name:
                name = f'%{name}%'.strip()
                cur.execute(
                    """
                        SELECT a.*, b.name 
                        FROM Product_listed_by_seller a 
                        INNER JOIN App_user b ON (a.user_id = b.user_id) 
                        WHERE UPPER(b.name) LIKE UPPER(%s) OR UPPER(a.name) LIKE UPPER(%s) 
                        ORDER BY b.name""", (name, name))  # a.name = product_name, b.name = seller name
                data = cur.fetchall()
                if(len(data) == 0):
                    return {'error': True, 'message': 'Database Empty'}
            else:
                cur.execute(
                    """
                        SELECT a.*, b.name
                        FROM Product_listed_by_seller a 
                        INNER JOIN App_user b ON (a.user_id = b.user_id)""")
                data = cur.fetchall()
                if(len(data) == 0):
                    return {'error': True, 'message': 'Database Empty'}
            data.insert(0, ("product_id", "user_id", "name", "minimum_bid_price", "description", "reserve_price",
                        "status", "sold_price", "product_list_time", "auction_start_time", "auction_end_time", "Offered_By"))
            cur.close()
            conn.close()
            return {'error': False, 'auctions': data}
        except Exception as _:
            conn.close()
            return {'error': True, 'data': "Form data errors"}
    return {'error': True, 'data': "can`t connect to database"}


def BidRegardingProduct(**kwargs):
    """params from ui for filter
    product_name,
    bid_price,
    """
    conn = get_db_instance()
    if conn:
        try:
            admin = isAdmin(kwargs.get("username"))
            conn.autocommit = True
            cur = conn.cursor()
            name = kwargs.get("q")
            if name:
                name = f'%{name}%'.strip()
                cur.execute(
                    """
                        SELECT b.*, a.name  
                        FROM product_listed_by_seller a 
                        INNER JOIN bid_regarding_product b ON (a.product_id=b.product_id)
                        WHERE UPPER(a.name) LIKE UPPER(%s)""", (name,))
                data = cur.fetchall()
                if(len(data) == 0):
                    return {'error': True, 'message': 'Database Empty'}
                else:
                    data.insert(
                        0, ("Product_Name", "current_bid_price", "status"))
                    return {'error': False, 'auctions': data, "admin": admin}
            else:
                cur.execute(
                    """Select a.*,b.name,b.status From bid_regarding_product a inner join product_listed_by_seller b on (a.product_id = b.product_id)""")
                data = cur.fetchall()
                if len(data) == 0:
                    return {'error': True, 'message': 'Database Empty'}
                else:
                    data.insert(0, ("Product_Name", "status", "id",
                                "current_bid_price", "foreign_key"))
            cur.close()
            conn.close()
            return {'error': False, 'auctions': data, "admin": admin}
        except Exception as _:
            print(_)
            conn.close()
            return {'error': True, 'data': "Form data errors"}
    return {'error': True, 'data': "can`t connect to database"}


def invokesTx(**kwargs):
    """params for filtering the db are
    bid_id,
    transaction_status"""
    conn = None
    try:
        conn = get_db_instance()
        conn.autocommit = True
        cur = conn.cursor()
        cur.execute("""Select a.*,b.transaction_status From Invokes_tx a inner join Auction_house_transaction b on (a.transaction_id = b.transaction_id)""")
        data = cur.fetchall()
        """This is filter logic to filter the data taken from params that is coming from ui"""

        if(kwargs["bid_id"] != ""):
            cur.execute(
                """Select a.*,b.transaction_status From Invokes_tx a inner join Auction_house_transaction b on (a.transaction_id = b.transaction_id) where a.bid_id= %s""", (kwargs["bid_id"],))
            data = cur.fetchall()
            if(len(data) == 0 and kwargs['transaction_status'] != ""):
                cur.execute("""Select a.*,b.transaction_status From Invokes_tx a inner join Auction_house_transaction b on (a.transaction_id = b.transaction_id) where b.transaction_status= %s""",
                            (kwargs["transaction_status"],))
                data = cur.fetchall()
        cur.close()
        conn.close()
        if len(data) == 0:
            return {'error': True, 'message': 'Database Empty'}
        else:
            data.insert(0, ("transaction_id", "bid_id",
                        "PRIMARY KEY", "Transaction Status"))
            return {'error': False, 'auctions': data}
    except Exception as _:
        if conn is not None:
            conn.close()
        return {'error': True, 'data': "can`t connect to database"}


def ManageBid(**kwargs):
    """params for filtering the db are
    manage_by,
    bid_id"""
    conn = None
    try:
        conn = get_db_instance()
        conn.autocommit = True
        cur = conn.cursor()
        cur.execute(
            """Select a.*,b.name From Manages_bid a inner join Auction_house b on (a.house_id = b.house_id)""")
        data = cur.fetchall()
        if(kwargs["manage_by"] != ""):
            cur.execute(
                """Select a.*,b.name From Manages_bid a inner join Auction_house b on (a.house_id = b.house_id) where b.name= %s""", (kwargs["manage_by"],))
            data = cur.fetchall()
            if(len(data) == 0 and kwargs['bid_id'] != ""):
                cur.execute(
                    """Select a.*,b.name From Manages_bid a inner join Auction_house b on (a.house_id = b.house_id) where a.bid_id= %s""", (kwargs['bid_id'],))
                data = cur.fetchall()
        cur.close()
        conn.close()
        if len(data) == 0:
            return {'error': True, 'message': 'Database Empty'}
        else:
            data.insert(0, ("Bid_id", "house_id", "PRIMARY KEY", "Manage_By"))
            return {'error': False, 'auctions': data}
    except Exception as _:
        if conn is not None:
            conn.close()
        return {'error': True, 'data': "can`t connect to database"}


def new_bid(**kwargs):
    conn = get_db_instance()
    bid_price = int(kwargs.get("price"))
    result = {'error': True, 'data': "can't connect to database"}
    if conn:
        try:
            conn.autocommit = True
            # result = {'error': True,
            #           'data': "User doesn't have enough balance"}
            cur = conn.cursor()
            cur.execute("Select balance from App_user WHERE user_id=%s",
                        (int(kwargs['user_id']),))
            balance = cur.fetchone()[0] or 0
            if int(balance) > int(kwargs.get('price')):
                cur.execute(
                    "SELECT MAX(bid_id) FROM Bid_regarding_product", [])
                next_bid_id = cur.fetchone()[0]+1
                cur.execute("""
                    UPDATE App_user SET balance = balance - %s 
                    WHERE user_id= %s""", (bid_price, int(kwargs['user_id'])))
                cur.execute("""
                            INSERT INTO Bid_regarding_product(
                                bid_id, current_bid_price, product_id
                            ) VALUES(%s, %s, %s)""", (next_bid_id, bid_price, int(kwargs['product_id'])))
                conn.commit()
                cur.execute("""
                            INSERT INTO Offers(
                                bid_id, user_id
                            ) VALUES(%s, %s)""", (next_bid_id, int(kwargs['user_id'])))
                cur.execute("""
                    SELECT balance FROM App_user 
                    WHERE user_id=%s""", (int(kwargs['user_id']),))
                data = cur.fetchone()
                try:
                    balance = data[0]
                except IndexError as _:
                    balance = 0
                result = {"error": False,
                          "data": "Bid added successfully", "balance": balance}
            else:
                cur.execute("""
                    SELECT balance FROM App_user 
                    WHERE user_id=%s""", (int(kwargs['user_id']),))
                data = cur.fetchone()
                try:
                    balance = data[0]
                except IndexError as _:
                    balance = 0
                result = {"error": True,
                          "data": "You don't have enough balance, select a lower price.", "balance": balance}
        except Exception as _:
            result = {'error': True,
                      'data': "Validation errors check your data"}
    return result


def productsData(**kwargs):
    conn = None
    try:
        conn = get_db_instance()
        conn.autocommit = True
        cur = conn.cursor()
        """someone complete this query for"""
        cur.execute(
            """SELECT a.*,b.name,c.current_bid_price FROM user_like_product a inner join App_user b on (a.user_id = b.user_id) inner join Bid_regarding_product c on (a.product_id =c.product_id) where a.product_id= %s""", (kwargs["product_id"],))
        data = cur.fetchall()
        if(len(data) != 0):
            data.insert(0, ("user_id", "product_id", "Name"))
        return {'error': False, 'auctions': data}

    except Exception as e:
        print(e)
        if conn is not None:
            conn.close()
        return {'error': True, 'data': "can`t connect to database"}
