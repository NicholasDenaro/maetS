CREATE TABLE Usr (
	username char(20) NOT NULL,
    upassword char(20) NOT NULL,
    income REAL,
    gender char(1) NOT NULL,
    dob date,
    uname char(30) NOT NULL,
    email char(30) NOT NULL,
    PRIMARY KEY (username)
)ENGINE=INNODB;

CREATE TABLE User_Transaction (
    utdate date,
    tid char(30) NOT NULL,
    PRIMARY KEY (tid)
    FOREIGN KEY (busername) REFERENCES Usr (username)
            ON DELETE NO ACTION,
    FOREIGN KEY (susername) REFERENCES Usr (username)
            ON DELETE NO ACTION,
    FOREIGN KEY (iid) REFERENCES Item
            ON DELETE NO ACTION
)ENGINE=INNODB;

CREATE TABLE Item (
    iid char(20) NOT NULL,
    descr char(350),
    location char(20) NOT NULL,
    PRIMARY KEY (iid)
)ENGINE=INNODB;

CREATE TABLE Auction_Item (
    bid char(20) NOT NULL,
    bidder char(20) NOT NULL,
    min_price REAL,
    PRIMARY KEY (iid),
    FOREIGN KEY (iid) REFERENCES Item.iid
)ENGINE=INNODB;

CREATE TABLE Sale_Item (
    price REAL,
    PRIMARY KEY (iid),
    FOREIGN KEY (iid) REFERENCES Item.iid
)ENGINE=INNODB;

CREATE TABLE Category (
    cname char(20) NOT NULL,
    cid char(30) NOT NULL,
    PRIMARY KEY (cid)
)ENGINE=INNODB;

CREATE TABLE Categorized (
    PRIMARY KEY (iid) REFERENCES Item (iid),
    FOREIGN KEY (pcid) REFERENCES Category (cid)
            ON DELETE NO ACTION
            ON UPDATE CASCADE,
    FOREIGN KEY (ccid) REFERENCES Category (cid)
            ON DELETE NO ACTION
            ON UPDATE CASCADE
)ENGINE=INNODB;

CREATE TABLE Connected_To (
    FOREIGN KEY (mcid) REFERENCES Category (iid)
    FOREIGN KEY (cid) REFERENCES Category
)ENGINE=INNODB;

CREATE TABLE Loc_Addresses (
    aid char(30) NOT NULL,
    street char(25) NOT NULL,
    city char(20) NOT NULL,
    astate char(15) NOT NULL,
    zip REAL,
    apt_number REAL,
    PRIMARY KEY (aid, username),
    FOREIGN KEY (username) REFERENCES Usr
            ON DELETE CASCADE
)ENGINE=INNODB;

CREATE TABLE Cont_Phone (
    number REAL,
    phid char(20) NOT NULL,
    PRIMARY KEY (phid, username),
    FOREIGN KEY (username) REFERENCES Usr
            ON DELETE CASCADE
)ENGINE=INNODB;

CREATE TABLE Cash_Credit_Card (
    cnumber REAL,
    cname char(20) NOT NULL,
    ctype char(20) NOT NULL,
    expiration date,
    PRIMARY KEY (cnumber, username),
    FOREIGN KEY (username) REFERENCES Usr
            ON DELETE CASCADE
)ENGINE=INNODB;

CREATE TABLE Search_Key (
    word char(20),
    kid char(30) NOT NULL,
    PRIMARY KEY (kid, iid)
    FOREIGN KEY (iid) REFERENCES Item
            ON DELETE CASCADE
)ENGINE=INNODB;

CREATE TABLE Supplier_Trans (
    stname char(20) NOT NULL,
    poc char(20) NOT NULL,
    stid char(30) NOT NULL,
    staddress char(30) NOT NULL,
    stphone REAL,
    PRIMARY KEY (stid, iid, username),
    FOREIGN KEY (iid) REFERENCES Item
            ON DELETE NO ACTION,
    FOREIGN KEY (username) REFERENCES Usr
            ON DELETE NO ACTION
)ENGINE=INNODB;

CREATE TABLE Runs_Shop(
    rsname char(20) NOT NULL,
    shid char(30) NOT NULL,
    PRIMARY KEY (shid, username),
    FOREIGN KEY (username) REFERENCES Usr
            ON DELETE CASCADE  
)ENGINE=INNODB;

CREATE TABLE Stocked_By (
    PRIMARY KEY (shid, iid),
    FOREIGN KEY (iid) REFERENCES Item
            ON DELETE NO ACTION,
    FOREIGN KEY (shid) REFERENCES Runs_Shop
            ON DELETE CASCADE
) ENGINE=INNODB;