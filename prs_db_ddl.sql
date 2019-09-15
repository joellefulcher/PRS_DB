-- create PRS database --
drop database if exists prs_db_ddl;
create database prs_db_ddl;
use prs_db_ddl;

-- create tables for database --
create table User (
	id 					int 				not null primary key auto_increment,
	UserName 			varchar(20) 		not null unique,
	Password 			varchar(10) 		not null,
	FirstName			varchar(20) 		not null,
	LastName			varchar(20) 		not null,
	PhoneNumber 		varchar(12)			not null,
	Email				varchar(75)			not null,
    IsReviewer			TinyInt(1)			not null,
    IsAdmin				TinyInt(1)			not null,
    constraint	uname	unique (UserName)
);

create table Vendor (
	id 					int 				not null primary key auto_increment,
	Code				varchar(10) 		not null unique,
	Name				varchar(255) 		not null,
	Address				varchar(255) 		not null,
	City				varchar(255) 		not null,
	State		 		varchar(2)			not null,
	Zip					varchar(5)			not null,
    PhoneNumber			varchar(12)			not null,
    Email				varchar(100)		not null,
    constraint	vcode	unique (Code)
);

create table PurchaseRequest (
	id 						int 				not null primary key auto_increment,
	UserID					int			 		not null,
	Description				varchar(100) 		not null,
	Justification			varchar(255) 		not null,
	DateNeeded				Date		 		not null,
	DeliveryMode			varchar(25)			not null,
	Status					varchar(20)			not null,
    Total					Decimal(10,2)		not null,
    SubmittedDate			datetime			not null,
    ReasonForRejection		varchar(100)		null,
    Constraint	FK_UserID foreign key (UserID) REFERENCES User(ID)
);

create table Product (
	id 						int 				not null primary key auto_increment,
	VendorID				int	 				not null unique,
	PartNumber				varchar(50) 		not null unique,
	Name					varchar(150) 		not null,
	Price					decimal(10,2) 		not null,
	Unit			 		varchar(255)		null,
	PhotoPath				varchar(255)		null,
    constraint	vendor_part	unique (VendorID, PartNumber),
    Constraint	FK_VendorID foreign key (VendorID) REFERENCES Vendor(ID)
);

create table PurchaseRequestLineItem (
	id 							int 			not null primary key auto_increment,
	PurchaseRequestID			int	 			not null unique,
	ProductID					int 			not null unique,
	Quantity					int	 			not null,
    constraint	req_pdt	unique (PurchaseRequestID, ProductID),
    Constraint	FK_PurchaseRequestID foreign key (PurchaseRequestID) REFERENCES PurchaseRequest(ID),
    Constraint	FK_ProductID foreign key (UserID) REFERENCES Product(ID)
);

/*
Insert into customer (name, city, state, isCorpAcct, creditLimit)
values ('Mercury LTD', 'Newport', 'KY', 0, 100000);
Insert into customer (name, city, state, isCorpAcct, creditLimit)
values ('Venus LLC', 'Dayton', 'OH', 0, 300000);
Insert into customer (name, city, state, isCorpAcct, creditLimit)
values ('Mars INC', 'Cincinnati', 'OH', 1, 1000000);
Insert into customer (name, city, state, isCorpAcct, creditLimit)
values ('Jupiter LPA', 'Covington', 'KY', 0, 250000);
Insert into customer (name, city, state, isCorpAcct, creditLimit)
values ('Saturn INC', 'Batesville', 'IN', 0, 300000);
Insert into customer (name, city, state, isCorpAcct, creditLimit)
values ('Uranus LPA', 'Indianapolis', 'IN', 1, 1000000);
Insert into customer (name, city, state, isCorpAcct, creditLimit)
values ('Neptune INC', 'Cleveland', 'OH', 1, 1000000);
*/


/*
Insert into orders (date, total, customerID)
values ('2017-12-31', 778, 6);
Insert into orders (date, total, customerID)
values ('2017-7-3', 156, 5);
Insert into orders (date, total, customerID)
values ('2017-6-23', 491, 7);
Insert into orders (date, total, customerID)
values ('2017-3-6', 230, 6);
Insert into orders (date, total, customerID)
values ('2017-11-21', 844, 5);
Insert into orders (date, total, customerID)
values ('2017-9-18', 849, 2);
Insert into orders (date, total, customerID)
values ('2017-4-15', 371, 2);
Insert into orders (date, total, customerID)
values ('2017-7-13', 451, 2);
Insert into orders (date, total, customerID)
values ('2017-1-7', 510, 4);
Insert into orders (date, total, customerID)
values ('2017-9-23', 612, 6);
Insert into orders (date, total, customerID)
values ('2017-10-11', 736, 5);
*/