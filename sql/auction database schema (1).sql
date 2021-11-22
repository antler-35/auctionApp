 CREATE TABLE Auction_house
  (house_id INTEGER CHECK (house_id>0),
  completed_transactions INTEGER CHECK (completed_transactions>0),
  admin_login VARCHAR(30) NOT NULL,
  admin_password_hash VARCHAR(30),
  name VARCHAR(200),
  PRIMARY KEY(house_id),
  UNIQUE(admin_login));


 CREATE TABLE Auction_house_transaction
  (transaction_id INTEGER CHECK (transaction_id>0),
  commission_taken REAL,
  payment_gateway VARCHAR(20),
  payment_time timestamp ,
  transaction_status BOOLEAN,
  payment_currency VARCHAR(20),
  house_id INTEGER NOT NULL,
  PRIMARY KEY(transaction_id),
  FOREIGN KEY(house_id) REFERENCES Auction_house ON DELETE SET NULL);

 CREATE TABLE App_user
  (user_id INTEGER CHECK (user_id>0),
  name VARCHAR(40),
  password VARCHAR(120),
  balance INTEGER CHECK(balance>0),
  address VARCHAR(40),
  phone VARCHAR(20),
  PRIMARY KEY (user_id),
  UNIQUE(phone));

 CREATE TABLE Facilitates
  (house_id INTEGER ,
  user_id INTEGER ,
  PRIMARY KEY(house_id, user_id),
  FOREIGN KEY(house_id) REFERENCES Auction_house ON DELETE CASCADE,
  FOREIGN KEY(user_id) REFERENCES App_user ON DELETE CASCADE);

 CREATE TABLE Buyer
  (user_id INTEGER ,
  appuser_id INTEGER,
  is_institution BOOLEAN,
  PRIMARY KEY(user_id),
  FOREIGN KEY(appuser_id) REFERENCES App_user ON DELETE CASCADE);

 CREATE TABLE Seller
  (user_id INTEGER ,
  appuser_id INTEGER,
  active_listings INTEGER,
  PRIMARY KEY(user_id),
  FOREIGN KEY(appuser_id) REFERENCES App_user ON DELETE CASCADE);

 CREATE TABLE Product_listed_by_seller
  (product_id INTEGER CHECK (product_id>0),
  user_id INTEGER NOT NULL ,
  name VARCHAR(400),
  minimum_bid_price REAL,
  description VARCHAR(100),
  reserve_price REAL,
  status BOOLEAN,
  sold_price REAL,
  product_list_time timestamp ,
  auction_start_time timestamp ,
  auction_end_time timestamp,
  check (auction_end_time>auction_start_time),
  check (sold_price>minimum_bid_price and sold_price>reserve_price),
  PRIMARY KEY(product_id),
  FOREIGN KEY(user_id) REFERENCES App_user ON DELETE CASCADE);

 CREATE TABLE Bid_regarding_product
  (bid_id INTEGER CHECK (bid_id>0),
  current_bid_price REAL,
  product_id INTEGER NOT NULL,
  PRIMARY KEY(bid_id),
  FOREIGN KEY(product_id) REFERENCES Product_listed_by_seller ON DELETE CASCADE);

 CREATE TABLE Offers
  (user_id INTEGER ,
  bid_id INTEGER ,
  PRIMARY KEY(user_id, bid_id),
  FOREIGN KEY(user_id) REFERENCES App_user ON DELETE CASCADE,
  FOREIGN KEY(bid_id) REFERENCES Bid_regarding_product ON DELETE CASCADE);

 CREATE TABLE Invokes_tx
  (transaction_id INTEGER NOT NULL ,
  bid_id INTEGER ,
  PRIMARY KEY(bid_id),
  FOREIGN KEY(transaction_id) REFERENCES Auction_house_transaction,
  FOREIGN KEY(bid_id) REFERENCES Bid_regarding_product ON DELETE SET NULL);

 CREATE TABLE Manages_bid
  (bid_id INTEGER ,
  house_id INTEGER NOT NULL ,
  PRIMARY KEY(bid_id),
  FOREIGN KEY(house_id) REFERENCES Auction_house ON DELETE CASCADE,
  FOREIGN KEY(bid_id) REFERENCES Bid_regarding_product ON DELETE CASCADE);
  

  CREATE TABLE user_like_product    
    (user_id integer NOT NULL,
    product_id integer NOT NULL,
    CONSTRAINT user_like_product_pkey PRIMARY KEY (user_id,product_id),
    CONSTRAINT user_like_product_productid_fkey FOREIGN KEY (product_id)
        REFERENCES product_listed_by_seller (product_id) MATCH SIMPLE
        ON UPDATE NO ACTION ON DELETE CASCADE,
    CONSTRAINT user_like_product_userid_fkey FOREIGN KEY (user_id)
        REFERENCES app_user(user_id) MATCH SIMPLE
        ON UPDATE NO ACTION ON DELETE CASCADE);
    
 