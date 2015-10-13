CREATE TABLE Usr (
	username char(20),
    upassword char(20),
    income REAL,
    gender char(1),
    dob date,
    uname char(30),
    email char(30),
    PRIMARY KEY (username)
);

CREATE TABLE User_Transaction (
   utdate date,
   tid char(30),
   PRIMARY KEY (tid)
);

CREATE TABLE Item (
    iid (20),
    descr char(350),
    location char(20),
    PRIMARY KEY (iid)
);

CREATE TABLE Auction_Item (
    bid char(20),
    bidder char(20),
    min_price REAL,
    PRIMARY KEY (iid),
    FOREIGN KEY (iid) REFERENCES Item.iid
);

CREATE TABLE Sale_Item (
    price REAL,
    PRIMARY KEY (iid),
    FOREIGN KEY (iid) REFERENCES Item.iid
);

CREATE TABLE 