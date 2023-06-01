DROP TABLE IF EXISTS UserInfo, BusinessInfo, Bank, AccountInfo,
SalesChannelBranch, SalesChannelOnline, DebitTransactions, CreditTransactions;
CREATE TABLE UserInfo (
user_id int not null auto_increment,
username varchar(50) not null,
name varchar(50) not null,
surname varchar(50) not null,
password varchar(50) not null,
PRIMARY KEY(user_id)
);

CREATE TABLE BusinessInfo (
bus_reg_no int not null,
name varchar(50) not null,
tax_number int(10) not null,
owner_id int not null,
city varchar(100),
zip_code int,
street varchar(100),
PRIMARY KEY (bus_reg_no, tax_number),
FOREIGN KEY (owner_id) REFERENCES UserInfo (user_id) ON DELETE CASCADE ON UPDATE CASCADE
);

CREATE TABLE Bank (
bank_id int not null auto_increment,
name varchar(50) not null,
telephone varchar(15),
city varchar(100),
zip_code int,
street varchar(100),
PRIMARY KEY (bank_id)
);

CREATE TABLE AccountInfo (
account_no int not null auto_increment,
iban varchar(34), 
account_name varchar (100) not null,
business_no int not null,
bank_id int not null,
PRIMARY KEY (account_no),
FOREIGN KEY (business_no) REFERENCES BusinessInfo(bus_reg_no) ON DELETE CASCADE,
FOREIGN KEY (bank_id) REFERENCES Bank(bank_id)
);

CREATE TABLE SalesChannelOnline(
sales_channel_id varchar(100) not null,
url varchar(100) not null,
platform varchar(20) not null,
business_no int not null,
PRIMARY KEY (sales_channel_id),
FOREIGN KEY (business_no) REFERENCES BusinessInfo(bus_reg_no) ON DELETE CASCADE
);

CREATE TABLE SalesChannelBranch (
sales_channel_id varchar(100) not null,
telephone varchar(15),
business_no int not null,
manager_id int not null,
city varchar(100),
zip_code int,
street varchar(100),
PRIMARY KEY (sales_channel_id),
FOREIGN KEY (business_no) REFERENCES BusinessInfo(bus_reg_no) ON DELETE CASCADE,
FOREIGN KEY (manager_id) REFERENCES UserInfo(user_id) ON DELETE CASCADE ON UPDATE CASCADE
);

CREATE TABLE CreditTransactions (
transaction_id int not null auto_increment,
date DATE not null,
amount decimal(7,2) not null,
account_no int not null,
category varchar(40) not null,
branch_credit varchar(100),
online_credit varchar(100),
PRIMARY KEY (transaction_id),
FOREIGN KEY (account_no) REFERENCES AccountInfo(account_no) ON DELETE CASCADE,
FOREIGN KEY (branch_credit) REFERENCES SalesChannelBranch(sales_channel_id) ON DELETE CASCADE ON UPDATE CASCADE,
FOREIGN KEY (online_credit) REFERENCES SalesChannelOnline(sales_channel_id) ON DELETE CASCADE ON UPDATE CASCADE
);

CREATE TABLE DebitTransactions (
transaction_id int not null auto_increment,
date DATE not null,
amount decimal(7,2) not null,
account_no int not null,
category varchar(40) not null,
branch_debit varchar(100),
online_debit varchar(100),
PRIMARY KEY (transaction_id),
FOREIGN KEY (account_no) REFERENCES AccountInfo(account_no) ON DELETE CASCADE,
FOREIGN KEY (branch_debit) REFERENCES SalesChannelBranch(sales_channel_id) ON DELETE CASCADE ON UPDATE CASCADE,
FOREIGN KEY (online_debit) REFERENCES SalesChannelOnline(sales_channel_id) ON DELETE CASCADE ON UPDATE CASCADE
);

