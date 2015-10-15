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
    cusername char(20) NOT NULL,
    busername char(20) NOT NULL,
    PRIMARY KEY (tid, cusername, busername),
    FOREIGN KEY (iid) REFERENCES Item(iid),
    FOREIGN KEY (cusername) REFERENCES Usr(username),
    FOREIGN Key (busername) REFERENCES Usr(username)
)ENGINE=INNODB;

CREATE TABLE Item (
    iid char(20) NOT NULL,
    descr char(250),
    location char(20) NOT NULL,
    PRIMARY KEY (iid)
)ENGINE=INNODB;

CREATE TABLE Auction_Item (
    iid char(20) NOT NULL,
    bid char(20) NOT NULL,
    bidder char(20) NOT NULL,
    min_price REAL,
    PRIMARY KEY (iid),
    FOREIGN KEY (iid) REFERENCES Item(iid)
)ENGINE=INNODB;

CREATE TABLE Sale_Item (
    iid char(20) NOT NULL,
    price REAL,
    PRIMARY KEY (iid),
    FOREIGN KEY (iid) REFERENCES Item(iid)
)ENGINE=INNODB;

CREATE TABLE Category (
    cname char(20) NOT NULL,
    cid char(30) NOT NULL,
    PRIMARY KEY (cid)
)ENGINE=INNODB;

CREATE TABLE Categorized (
    iid char(20) NOT NULL,
    ccid char(30) NOT NULL,
    pcid char(30) NOT NULL,
    PRIMARY KEY (iid),
    FOREIGN KEY (iid) REFERENCES Item(iid),
    FOREIGN Key (ccid) REFERENCES Category(cid),
    FOREIGN Key (pcid) REFERENCES Category(cid)
)ENGINE=INNODB;

CREATE TABLE Connected_To (
    cid char(30) NOT NULL,
    mcid char(30) NOT NULL,
    FOREIGN KEY (mcid) REFERENCES Category (iid),
    FOREIGN KEY (cid) REFERENCES Category(cid)
)ENGINE=INNODB;

CREATE TABLE Loc_Addresses (
    username char(20) NOT NULL,
    aid char(30) NOT NULL,
    street char(25) NOT NULL,
    city char(20) NOT NULL,
    astate char(15) NOT NULL,
    zip REAL,
    apt_number REAL,
    PRIMARY KEY (aid, username),
    FOREIGN KEY (username) REFERENCES Usr(username)
            ON DELETE CASCADE
)ENGINE=INNODB;

CREATE TABLE Cont_Phone (
    username char(20) NOT NULL,
    number REAL,
    phid char(20) NOT NULL,
    PRIMARY KEY (phid, username),
    FOREIGN KEY (username) REFERENCES Usr(username)
            ON DELETE CASCADE
)ENGINE=INNODB;

CREATE TABLE Cash_Credit_Card (
    cnumber REAL,
    cname char(20) NOT NULL,
    ctype char(20) NOT NULL,
    username char(20) NOT NULL,
    expiration date,
    PRIMARY KEY (cnumber, username),
    FOREIGN KEY (username) REFERENCES Usr(username)
            ON DELETE CASCADE
)ENGINE=INNODB;

CREATE TABLE Search_Key (
    word char(20),
    kid char(30) NOT NULL,
    iid char(20) NOT NULL,
    PRIMARY KEY (kid, iid),
    FOREIGN KEY (iid) REFERENCES Item(iid)
            ON DELETE CASCADE
)ENGINE=INNODB;

CREATE TABLE Supplier_Trans (
    iid char(20) NOT NULL,
    username char(20) NOT NULL,
    stname char(20) NOT NULL,
    poc char(20) NOT NULL,
    stid char(30) NOT NULL,
    staddress char(30) NOT NULL,
    stphone REAL,
    PRIMARY KEY (stid, iid, username),
    FOREIGN KEY (iid) REFERENCES Item(iid)
            ON DELETE NO ACTION,
    FOREIGN KEY (username) REFERENCES Usr(username)
            ON DELETE NO ACTION
)ENGINE=INNODB;

CREATE TABLE Runs_Shop(
    username char(20) NOT NULL,
    rsname char(20) NOT NULL,
    shid char(30) NOT NULL,
    PRIMARY KEY (shid, username),
    FOREIGN KEY (username) REFERENCES Usr(username)
            ON DELETE CASCADE  
)ENGINE=INNODB;

CREATE TABLE Stocked_By (
    iid char(20) NOT NULL,
    shid char(30) NOT NULL,
    PRIMARY KEY (shid, iid),
    FOREIGN KEY (iid) REFERENCES Item(iid)
            ON DELETE NO ACTION,
    FOREIGN KEY (shid) REFERENCES Runs_Shop(shid)
            ON DELETE CASCADE
) ENGINE=INNODB;

CREATE TABLE Whishes_For (
    wid char(30) NOT NULL,
    username char(20) NOT NULL,
    PRIMARY KEY (wid, username),
    FOREIGN KEY (username) REFERENCES Usr(username)
            ON DELETE CASCADE
            ON UPDATE CASCADE
) ENGINE=INNODB;

CREATE TABLE Filled_With (
    ranking REAL,
    wid char(30) NOT NULL,
    iid char(20) NOT NULL,
    PRIMARY KEY (wid, iid),
    FOREIGN KEY (iid) REFERENCES Item(iid),
    FOREIGN KEY (wid) REFERENCES Whishes_For(wid) 
) ENGINE=INNODB;

CREATE TABLE Supplier_Stocked (
    iid char(20) NOT NULL,
    username char(20) NOT NULL,
    PRIMARY KEY (iid, username),
    FOREIGN KEY (iid) REFERENCES Item(iid),
    FOREIGN KEY (username) REFERENCES Usr (username)
)ENGINE=INNODB;

CREATE TABLE User_Stocked (
    iid char(20) NOT NULL,
    username char(20) NOT NULL,
    PRIMARY KEY (iid, username),
    FOREIGN KEY (iid) REFERENCES Item(iid),
    FOREIGN KEY (username) REFERENCES Usr (username)
)ENGINE=INNODB;