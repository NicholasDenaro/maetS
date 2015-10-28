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
    tcomment char(250),
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
        ON DELETE CASCADE
)ENGINE=INNODB;

CREATE TABLE Sale_Item (
    iid char(20) NOT NULL,
    price REAL,
    PRIMARY KEY (iid),
    FOREIGN KEY (iid) REFERENCES Item(iid) 
        ON DELETE CASCADE
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
    PRIMARY KEY (cid, mcid),
    FOREIGN KEY (mcid) REFERENCES Category(cid),
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

CREATE TABLE Wishes_For (
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

INSERT INTO Usr 
VALUES
('Fred', 'Pa$$W0rd', 19000, 'M', 03/15/92, 'DemoFred123', 'Fred@fred.com'),
('Alice', 'purpleFl0w3R', 45000, 'F', 06/05/88, 'CelticAlice220', 'Alice@alice.com'),
('Jake', 'DrAg0n1t3', 92000, 'M', 02/09/94, 'Sepheroth23', 'jake@jake.com'),
('Christopher', 'Train!Hard3R', 130000, 'M', 12/05/90, 'ChromeNight89', 'chris@chris.com'),
('Jessica', 'Discover1t', 34000, 'F', 10/28/96, 'Jessintime', 'jessica@jess.net');

INSERT INTO User_Transaction
VALUES
('1ef131', 'Fred', 'Jake', 'The worst experience ever!'),
('f3134f13v', 'Jessica', 'Christopher', 'Everything went well! I am very satisfied.'),
('dfvr1f3421q45', 'Christopher', 'Jake', 'Very good service. 5 starts.'),
('141v2f5', 'Alice', 'Jake', ''),
('2n637472nb', 'Jessica', 'Alice', 'This is what I was looking for! I am so excited!');

INSERT INTO Item   
VALUES
('12345', 'This is an expansion pack for Skyrim (PC ONLY)', 'DIGITAL'),
('54321', 'This is a T-shirt worthy of any knight.', 'State College, PA, USA'),
('12345abc', 'This is a 200 card collection of Pokémon cards.', 'Wayne, PA, USA'),
('12345123', 'This limited edition FairyTail trading card!', 'New York, New York, USA'),
('1234abc', 'This is an expansion pack for Sims 4 (PC ONLY).', 'DIGITAL'),

INSERT INTO Auction_Item
VALUES
(),
(),
(),
(),
();

INSERT INTO Sale_Item
VALUES
(),
(),
(),
(),
();

INSERT INTO Category
VALUES
(),
(),
(),
(),
();

INSERT INTO Categorized
VALUES
(),
(),
(),
(),
();

INSERT INTO Connected_To
VALUES
(),
(),
(),
(),
();

INSERT INTO Loc_Addresses
VALUES
(),
(),
(),
(),
();

INSERT INTO Cont_Phone
VALUES
(),
(),
(),
(),
();

INSERT INTO Cash_Credit_Card
VALUES
(),
(),
(),
(),
();

INSERT INTO Search_Key
VALUES
(),
(),
(),
(),
();

INSERT INTO Supplier_Trans
VALUES
(),
(),
(),
(),
();

INSERT INTO Runs_Shop
VALUES
(),
(),
(),
(),
();

INSERT INTO Stocked_By
VALUES
(),
(),
(),
(),
();

INSERT INTO Wishes_For
VALUES
(),
(),
(),
(),
();

INSERT INTO Filled_With
VALUES
(),
(),
(),
(),
();

INSERT INTO Supplier_Stocked
VALUES
(),
(),
(),
(),
();

INSERT INTO User_Stocked
VALUES
(),
(),
(),
(),
();