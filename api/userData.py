import psycopg2

from api.utils import get_db_instance, isAdmin


def user_data(**kwargs):
    conn = get_db_instance()
    admin = None
    try:
        cur = conn.cursor()
        admin = isAdmin(kwargs.get("user_name"))
        cur.execute(
            "CREATE TABLE IF NOT EXISTS app_user (name varchar(40), password varchar(120), phone varchar(20), address varchar(40), user_id int)")
        cur.execute("SELECT * FROM app_user WHERE name=%s", (kwargs.get('user_name'),))
        data = cur.fetchall()
        cur.close()
        conn.close()
        if len(data) == 0:
            return {'error': True, 'message': 'User not found'}
        else:
            balance = data[0][5] if data[0][5] else 0
            if data[0][1] == kwargs.get('user_name'):
                return {'error': False, 'name': data[0][1], 'phone': data[0][4], 'address': data[0][3],
                        'user_id': data[0][0], "admin": admin, "balance": balance}
            else:
                return {'error': True, 'message': 'Wrong password'}
    except (Exception, psycopg2.DatabaseError) as _:
        if conn is not None:
            conn.close()
            return {'error': True, 'message': 'Database error'}
        return {'error': True, 'message': 'Cant connect to the database'}


def user_like_product(user_id, product_id):
    conn = get_db_instance()
    try:
        cur = conn.cursor()
        try:
            cur.execute(
                """
                CREATE TABLE user_like_product
                (
                user_id integer NOT NULL,
                product_id integer NOT NULL,
                CONSTRAINT user_like_product_pkey PRIMARY KEY (user_id,product_id),
                CONSTRAINT user_like_product_productid_fkey FOREIGN KEY (product_id)
                    REFERENCES product_listed_by_seller (product_id) MATCH SIMPLE
                    ON UPDATE NO ACTION ON DELETE CASCADE,
                CONSTRAINT user_like_product_userid_fkey FOREIGN KEY (user_id)
                    REFERENCES app_user(user_id) MATCH SIMPLE
                    ON UPDATE NO ACTION ON DELETE CASCADE
                )
                """)
        except:
            conn = get_db_instance()
            cur = conn.cursor()

        try:

            cur.execute("""
               SELECT user_id, product_id 
               FROM user_like_product 
               where user_id = %s and product_id = %s """, (user_id, product_id)
                        )

            data = cur.fetchall()
        except(Exception, psycopg2.DatabaseError) as _:
            if conn is not None:
                conn.close()
            return {'error': True, 'message': 'Database error'}

        if len(data) == 0:
            try:
                cur.execute("""
                    INSERT INTO user_like_product( user_id, product_id)
                    VALUES (%s, %s)""", (user_id, product_id,)
                            )
                conn.commit()
            except(Exception, psycopg2.DatabaseError) as _:
                if conn is not None:
                    conn.close()
                return {'error': True, 'message': _.pgerror}

        cur.close()
        conn.close()
        return {'error': False, 'message': 'Added to Wishlist'}

    except (Exception, psycopg2.DatabaseError) as _:
        if conn is not None:
            conn.close()
            return {'error': True, 'message': 'Database error'}
        return {'error': True, 'message': 'Cant connect to the database'}


def user_dislike_product(user_id, product_id):
    conn = get_db_instance()
    admin = None
    try:
        cur = conn.cursor()
        try:
            cur.execute(
                """
                CREATE TABLE user_like_product
                (
                user_id integer NOT NULL,
                product_id integer NOT NULL,
                CONSTRAINT user_like_product_pkey PRIMARY KEY (user_id,product_id),
                CONSTRAINT user_like_product_productid_fkey FOREIGN KEY (product_id)
                    REFERENCES product_listed_by_seller (product_id) MATCH SIMPLE
                    ON UPDATE NO ACTION ON DELETE CASCADE,
                CONSTRAINT user_like_product_userid_fkey FOREIGN KEY (user_id)
                    REFERENCES app_user(user_id) MATCH SIMPLE
                    ON UPDATE NO ACTION ON DELETE CASCADE
                )
                """)
        except:
            conn = get_db_instance()
            cur = conn.cursor()

        try:

            cur.execute("""
               SELECT user_id, product_id 
               FROM user_like_product 
               where user_id = %s and product_id = %s """, (user_id, product_id)
                        )

            data = cur.fetchall()
        except(Exception, psycopg2.DatabaseError) as _:
            if conn is not None:
                conn.close()
            return {'error': True, 'message': 'Database error'}

        if len(data) > 0:
            try:
                cur.execute("""
                    DELETE FROM user_like_product a 
                    where a.user_id = %s and a.product_id = %s """, (user_id, product_id,)
                            )
                conn.commit()
            except(Exception, psycopg2.DatabaseError) as _:
                if conn is not None:
                    conn.close()
                return {'error': True, 'message': _.pgerror}
        cur.close()
        conn.close()
        return {'error': False, 'message': 'Product removed From Wishlist'}

    except (Exception, psycopg2.DatabaseError) as _:
        if conn is not None:
            conn.close()
            return {'error': True, 'message': 'Database error'}
        return {'error': True, 'message': 'Cant connect to the database'}


def user_like_list(user_id: int):
    conn = get_db_instance()
    admin = None
    try:
        cur = conn.cursor()

        try:
            cur.execute("""
                SELECT name  FROM app_user 
                where user_id = %s """, (user_id,)
                        )
            data = cur.fetchall()
            if len(data) == 0:
                if conn is not None:
                    conn.close()
                return {'error': True, 'message': 'Database error'}
            user_name = data[0][0]

            cur.execute("""
                SELECT a.product_id, b.name
                FROM public.user_like_product a inner join Product_listed_by_seller b on (a.product_id=b.product_id)
                WHERE 
                   a.user_id = %s  """, (user_id,)
                        )
            data = cur.fetchall()
            data.insert(0, ("product_id", "product_name"))
            cur.close()
            conn.close()
            return {'error': False, 'user_name': user_name, 'product_list': data}
        except:
            if conn is not None:
                conn.close()
            return {'error': True, 'message': 'Database error'}
    except (Exception, psycopg2.DatabaseError) as _:
        if conn is not None:
            conn.close()
            return {'error': True, 'message': 'Database error'}
        return {'error': True, 'message': 'Cant connect to the database'}


def product_like_by_userlist(product_id: int):
    conn = get_db_instance()
    admin = None
    try:
        cur = conn.cursor()

        try:
            cur.execute("""
                SELECT name 
                FROM product_listed_by_seller 
                where product_id = %s """, (product_id,)
                        )
            data = cur.fetchall()
            if len(data) == 0:
                if conn is not None:
                    conn.close()
                return {'error': True, 'message': 'Database error'}
            product_name = data[0][0]

            cur.execute("""
                SELECT a.user_id, b.name
                FROM public.user_like_product a inner join app_user b on (a.user_id=b.user_id)
                WHERE a.product_id = %s  """, (product_id,)
                        )
            data = cur.fetchall()
            data.insert(0, ("product_id", "product_name"))
            cur.close()
            conn.close()
            return {'error': False, 'product_name': product_name, 'user_list': data}
        except:
            if conn is not None:
                conn.close()
            return {'error': True, 'message': 'Database error'}
    except (Exception, psycopg2.DatabaseError) as _:
        if conn is not None:
            conn.close()
            return {'error': True, 'message': 'Database error'}
        return {'error': True, 'message': 'Cant connect to the database'}
