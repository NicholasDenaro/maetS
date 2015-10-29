CREATE TABLE Usr (
	uname char(30) NOT NULL,
    upassword char(20) NOT NULL,
    income REAL,
    gender char(1) NOT NULL,
    dob date,
    username char(20) NOT NULL,
    email char(30) NOT NULL,
    PRIMARY KEY (username)
)ENGINE=INNODB;

CREATE TABLE Item (
    iid char(20) NOT NULL,
    descr char(250),
    location char(20) NOT NULL,
    seller char(20) NOT NULL,
    PRIMARY KEY (iid),
    FOREIGN KEY (seller) REFERENCES Usr(username)
)ENGINE=INNODB;

CREATE TABLE User_Transaction (
    utdate date,
    iid char(20) NOT NULL,
    tid char(30) NOT NULL,
    cusername char(20) NOT NULL,
    busername char(20) NOT NULL,
    tcomment char(250),
    PRIMARY KEY (tid, cusername, busername),
    FOREIGN KEY (iid) REFERENCES Item(iid),
    FOREIGN KEY (cusername) REFERENCES Usr(username),
    FOREIGN Key (busername) REFERENCES Usr(username)
)ENGINE=INNODB;

CREATE TABLE Auction_Item (
    iid char(20) NOT NULL,
    bid char(20) NOT NULL,
    bidder char(20) NOT NULL,
    min_price REAL,
    PRIMARY KEY (bid),
    FOREIGN KEY (iid) REFERENCES Item(iid) 
        ON DELETE CASCADE,
    FOREIGN KEY (bidder) REFERENCES Usr(username)
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
    ccid char(30),
    pcid char(30),
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
    FOREIGN KEY (wid) REFERENCES Wishes_For(wid) 
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
('Fred', 'Pa$$W0rd', 19000, 'M', '1992-03-15', 'DemoFred123', 'Fred@fred.com'),
('Alice', 'purpleFl0w3R', 45000, 'F', '1988-06-05', 'CelticAlice220', 'Alice@alice.com'),
('Jake', 'DrAg0n1t3', 92000, 'M', '1994-02-09', 'Sepheroth23', 'jake@jake.com'),
('Christopher', 'Train!Hard3R', 130000, 'M', '1990-12-05', 'ChromeNight89', 'chris@chris.com'),
('Jessica', 'Discover1t', 34000, 'F', '1996-10-28', 'Jessintime', 'jessica@jess.net'),
('seller', 'sellerpass', 99999999, 'M', '0000-11-22', 'MassSeller', 'seller@seller.net');

INSERT INTO Item   
VALUES
('12345', 'This is an expansion pack for Skyrim (PC ONLY)', 'DIGITAL', 'Sepheroth23'),
('54321', 'This is a T-shirt worthy of any knight.', 'State College, PA, USA', 'Sepheroth23'),
('12345abc', 'This is a 200 card collection of Pokémon cards.', 'Wayne, PA, USA', 'ChromeNight89'),
('12345123', 'This limited edition FairyTail trading card!', 'New York, New York, USA', 'DemoFred123'),
('1234abc', 'This is an expansion pack for Sims 4 (PC ONLY).', 'DIGITAL', 'CelticAlice220'),
('143123412543', 'blah blah blah', 'nowhere', 'MassSeller'),
('1423bid', 'This is the first pikachu action figure ever created', 'Seattle, WA', 'ChromeNight89');

INSERT INTO User_Transaction
VALUES
('2015-02-10', '12345', '1ef131', 'DemoFred123', 'Sepheroth23', 'The worst experience ever!'),
('2015-09-23', '12345abc', 'dfvr1f3421q45', 'ChromeNight89', 'Sepheroth23', 'Very good service. 5 starts.'),
('2015-10-28', '12345123', '141v2f5', 'CelticAlice220', 'DemoFred123', ''),
('2015-03-09', '54321', 'f3134f13v', 'Jessintime', 'ChromeNight89', 'Everything went well! I am very satisfied.'),
('2015-10-28', '1234abc', '2n637472nb', 'Jessintime', 'CelticAlice220', 'This is what I was looking for! I am so excited!');

INSERT INTO Auction_Item
VALUES
('1423bid', '2435f5d1', 'Sepheroth23', 1),
('1423bid', '2435f5d2', 'Jessintime', 5),
('1423bid', '2435f5d3', 'DemoFred123', 9),
('1423bid', '2435f5d4', 'Sepheroth23', 11),
('1423bid', '2435f5d5', 'DemoFred123', 20);

INSERT INTO Sale_Item
VALUES
('12345', 20),
('54321', 10),
('12345abc', 50),
('12345123', 1000),
('1234abc', 30);

INSERT INTO Category
VALUES
('PARENT', ''),
('Digital Content', '23v542d3145v6b73'),
('Trading Cards', '2f457h385g246f3d45'),
('Limited Edition', '432g7h6g45435ff'),
('Action Figures', '3c4g356f14526f2'),
('Apparel', '234b63gf5f4536bg');

INSERT INTO Categorized
VALUES
('12345', '', '23v542d3145v6b73'),
('54321', '', '234b63gf5f4536bg'),
('12345abc', '', '2f457h385g246f3d45'),
('12345123', '432g7h6g45435ff', '2f457h385g246f3d45'),
('1423bid', '', '23v542d3145v6b73'),
('1234abc', '', '3c4g356f14526f2');

INSERT INTO Connected_To
VALUES
('432g7h6g45435ff' ,'2f457h385g246f3d45'),
('432g7h6g45435ff', '23v542d3145v6b73'),
('432g7h6g45435ff', '3c4g356f14526f2'),
('432g7h6g45435ff', '234b63gf5f4536bg');

INSERT INTO Loc_Addresses
VALUES
('DemoFred123', '123453t4vr', '112 tee street', 'hello', 'world', 19999, 0),
('CelticAlice220', '123453t4vrs', '112 high street', 'hello', 'world', 19999, 0),
('Sepheroth23', '123453t4vrf', '112 low street', 'my', 'world', 19599, 0),
('ChromeNight89', '123453t4vre', '112 keystone avenue', 'your', 'world', 19949, 0),
('Jessintime', '123453t4vrs', '112 montevideo drive', 'no', 'world', 19399, 0);

INSERT INTO Cont_Phone
VALUES
('DemoFred123', 17064364784, '17064364784'),
('CelticAlice220', 17063765230, '17063765230'),
('Jessintime', 14844616861, '14844616861'),
('ChromeNight89', 16103529046, '16103529046'),
('Sepheroth23', 16109898400, '16109898400');

INSERT INTO Cash_Credit_Card
VALUES
(1111222233334445, 'Fred', 'Discover', 'DemoFred123', '2020-12-12'),
(3333444455556667, 'Alice', 'Visa', 'CelticAlice220', '2018-12-12'),
(3333444455556668, 'Jake', 'Visa', 'Sepheroth23', '2020-09-09'),
(1111948572875384, 'Christopher', 'American Express', 'ChromeNight89', '2020-04-09'),
(1234263451253453, 'Jessica', 'Master Card', 'Jessintime', '2017-09-02');

INSERT INTO Search_Key
VALUES
('rare', '4352342345', '12345123'),
('collection', '2352366', '12345abc'),
('shirt', '23453245', '54321'),
('pikachu', '5236522', '1423bid'),
('sims', '36456234523', '1234abc');

INSERT INTO Supplier_Trans
VALUES
('143123412543', 'MassSeller', 'Gain', 'none', '125134512', '123 nowhere lane', 11112223345),
('143123412543', 'MassSeller', 'Gain', 'none', '573564621', '123 nowhere lane', 11112223345),
('143123412543', 'MassSeller', 'Gain', 'none', 'b25f54d14', '123 nowhere lane', 11112223345),
('143123412543', 'MassSeller', 'Gain', 'none', '56n4256b251', '123 nowhere lane', 11112223345),
('143123412543', 'MassSeller', 'Gain', 'none', '2b545b311', '123 nowhere lane', 11112223345);

INSERT INTO Runs_Shop
VALUES
('DemoFred123', '12341', '12c413412c3'),
('CelticAlice220', '4313451', '12c4124123v412c4'),
('Sepheroth23', '12451241', '123c4123vc412v4'),
('ChromeNight89', '145124124', 'c1234123c41'),
('Jessintime', '41541234', '234v51412c1');

INSERT INTO Stocked_By
VALUES
('143123412543', '12c413412c3'),
('143123412543', '12c4124123v412c4'),
('143123412543', '123c4123vc412v4'),
('143123412543', '234v51412c1'),
('143123412543', 'c1234123c41');

INSERT INTO Wishes_For
VALUES
('41c4134c14c', 'DemoFred123'),
('c4124123c41', 'CelticAlice220'),
('c1341241c11', 'Sepheroth23'),
('b35v252v41c', 'ChromeNight89'),
('234v234v231', 'Sepheroth23');

INSERT INTO Filled_With
VALUES
(1, '41c4134c14c', '12345123'),
(2, 'c4124123c41', '1234abc'),
(3, 'c1341241c11', '12345'),
(4, 'b35v252v41c', '12345abc'),
(5, '234v234v231', '54321');

INSERT INTO Supplier_Stocked
VALUES
('143123412543', 'MassSeller');

INSERT INTO User_Stocked
VALUES
('12345123', 'DemoFred123'),
('1234abc', 'CelticAlice220'),
('54321', 'Sepheroth23'),
('1423bid', 'ChromeNight89'),
('12345', 'Sepheroth23');