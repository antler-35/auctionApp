select b.name seller, count(*) products 
from Product_listed_by_seller a inner join app_user b on a.user_id=b.user_id
group by b.name
order by count(*) desc; -- seller with the count of products listed

select b.name product_name,concat('$',sum(current_bid_price)) total_bid_amount 
from Bid_regarding_product a inner join Product_listed_by_seller b on a.product_id=b.product_id
group by b.name
order by sum(current_bid_price) desc; --product name with total amount of bid in auction (both 0 and 1)

select b.name product_name,concat('$',sum(current_bid_price)) sold_price 
from Bid_regarding_product a inner join Product_listed_by_seller b
on a.product_id=b.product_id
where a.status='1'
group by b.name
order by sum(current_bid_price) desc; -- product with their selling price


select d.name Buyer_name, count(a.product_id) product_count 
from Bid_regarding_product a inner join Offers c on (a.bid_id=c.bid_id)
inner join app_user d on (c.user_id=d.user_id)
where  a.status='1'
group by d.name
order by count(a.product_id) desc; -- buyers with count of product he owns


select d.name Buyer_name, b.name product_name 
from Bid_regarding_product a inner join Product_listed_by_seller b on (a.product_id=b.product_id)
inner join Offers c on (a.bid_id=c.bid_id)
inner join app_user d on (c.user_id=d.user_id)
where  a.status='1'
order by d.name; -- buyer with product name he owns

select d.name Buyer_name, concat('$',sum(a.current_bid_price))total_amount
from Bid_regarding_product a inner join Product_listed_by_seller b on (a.product_id=b.product_id)
inner join Offers c on (a.bid_id=c.bid_id)
inner join app_user d on (c.user_id=d.user_id)
where  a.status='1'
group by  d.name 
order by sum(a.current_bid_price) desc; -- total amount spent by a buyer.


SELECT house_id,completed_transactions,admin_login,admin_password_hash,name
FROM auction_house order by completed_transactions desc limit 10 ; -- get best houses

SELECT au.user_id,au.name, concat('$',sum(d.current_bid_price))total_amount  
FROM seller s inner join app_user au on (s.appuser_id = au.user_id)
inner join product_listed_by_seller c on (s.user_id = c.user_id)
inner join bid_regarding_product d on (c.product_id = d.product_id)
where d.status = true
group by  au.user_id, au.name 
order by sum(d.current_bid_price) desc  limit 10; -- get top seller

select d.user_id, d.name Buyer_name, concat('$',sum(a.current_bid_price))total_amount
from Bid_regarding_product a inner join Product_listed_by_seller b on (a.product_id=b.product_id)
inner join Offers c on (a.bid_id=c.bid_id)
inner join app_user d on (c.user_id=d.user_id)
where  a.status='1'
group by  d.user_id,d.name 
order by sum(a.current_bid_price) desc  limit 10; -- get top buyer

INSERT INTO user_like_product( user_id, product_id)
VALUES (%s, %s); -- user like product

DELETE FROM user_like_product a 
where a.user_id = %s and a.product_id = %s; --user dislike product

SELECT a.product_id, b.name
FROM public.user_like_product a inner join Product_listed_by_seller b on (a.product_id=b.product_id)
WHERE a.user_id = %s  limit 10; -- 10 products that une user like

SELECT a.user_id, b.name
FROM public.user_like_product a inner join app_user b on (a.user_id=b.user_id)
WHERE a.product_id = %s limit 10; -- 10 that users like a product 
