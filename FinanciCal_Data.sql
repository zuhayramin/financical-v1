INSERT INTO UserInfo (username, name, surname, password) VALUES 
('mrtimmy', 'Timmy', 'Bacarat', 'timbos123'), #owner
('danyWells', 'Daniels', 'Wellbeck', 'pa$$word'), #owner
('UmarKhan21', 'Muhammad', 'Umar', 'm0ney'),#owner
('weblemon', 'Alfred', 'Pennyworth', 'batmanR00l3s'), #manager SweeTooth
('iamgroot', 'Jonathan', 'Ross', 'jman12345'),#manager Perfect Fit
('capricorn1997', 'Emma', 'Willis', 'emmydemmy789'), #owner
('adamsapple', 'Adam', 'Apple', 'apple1234'),#manager MedBay
('Evespear', 'Eve', 'DowntoEarth', 'earthhereicome'), #manager ice Lux
('grumptrump','Donald','Grump','Iloveputin'), #manager TechStop
("littlerocketman", 'Kim', 'Un', 'koreanpopfan'); #manager Cables Galore

INSERT INTO BusinessInfo VALUES 
(5671, 'SweeTooth', 16782978, 1, 'Istanbul', 34015, '12th Street'), 
(5620, 'IceLux', 89374671, 1, 'Ankara', 06135, '56th Street'),
(4105, 'TechStop', 67189350, 2, 'Istanbul', 34912, '6th Street'), 
(7813, 'Cables Galore', 81925186, 3, 'Ankara', 06089, '9th Street'), 
(9124, 'PerfectFit', 72819212, 6, 'Dubai', 99819, '46th Street'), 
(1472, 'MediBay', 66357973, 6, 'Islamabad', 44100, '98th Street');

INSERT INTO Bank(name, telephone, city, zip_code, street) VALUES('Money Bank', '242-400-6739','Istanbul','34671','7th Street'),
('Shark Bank','04-567-9812','Dubai','99718','16th Street'),
('BigBucks Bank','02-712-4538','Ankara','06189','2nd Street'),
('Loanly Bank','02-712-4538','Islamabad','44892','11th Street');

INSERT INTO AccountInfo(iban, account_name, business_no, bank_id) VALUES 
('TR420006232171749475147624','SweeTooth Current Account',5671,1),
('TR-6100-0624-1371-1413-9298-4484','SweeTooth Savings Account',5671,3),
('AE-1603-3418-2429-1536-8161-9','PerfectFit Current Account',9124,2),
('PK-02XQ-AY77-4186-8933-1463-53','MedBay Current Account',1472,4),
('TR-1600-0621-7898-9529-4128-3538','IceLux Current Account',5620,3),
('TR-5500-0627-6962-1991-4451-9751','TechStop Current Account',4105,1),
('TR-5500-0627-6962-1991-4451-9751','Cables Galore Current Account',7813,3);

INSERT INTO SalesChannelOnline VALUES 
('ST-Amazon','Amazon.com/SweeTooth', 'Amazon',5671),
('PF-Shopify','https://PerfectFit.com', 'Shopify',9124),
('MB-Facebook','Facebook.com/MedBay','Facebook Shop',1472),
('IL-Instagram','Instagram/IceLux','Instagram Shop',5620),
('TS-Ebay','Ebay.com/TechStop','eBay',4105),
('CG-Shopify','https://CablesGalore.com','Shopify',7813);

INSERT INTO SalesChannelBranch VALUES 
('ST-NY-001','7182334545',5671,4, 'New York',10005,'Wall Street'),
('PF-VM-001','3182838822',9124,5,'Burlington',05777,'Anderson Hill Road'),
('MB-DXB-005','89928882',1472, 7,'Dubai',00000, 'Financial Center Road'),
('IL-ISB-001','2020838920',5620,8,'Islamabad',44000,'Tariq Road'),
('TS-IST-001','3032020339',4105,9,'Istanbul',66377,'Istiklal Street'),
('CG-DIA-004','676766684',7813,10,'Doha',00000,'11th Street');

INSERT INTO DebitTransactions(date, amount, account_no, category, branch_debit, online_debit) VALUES ('2019-11-12', 144.49, 1, 'Raw Materials','ST-NY-001',NULL);
INSERT INTO DebitTransactions(date, amount, account_no, category, branch_debit, online_debit) VALUES ('2019-12-09', 25949, 4, 'Equipment','MB-DXB-005',NULL);
INSERT INTO DebitTransactions(date, amount, account_no, category, branch_debit, online_debit) VALUES ('2020-01-03', 1099.99, 3, 'Supplies','PF-VM-001',NULL);
INSERT INTO DebitTransactions(date, amount, account_no, category, branch_debit, online_debit) VALUES ('2020-01-03', 899, 4, 'Advertising',NULL,'MB-Facebook');
INSERT INTO DebitTransactions(date, amount, account_no, category, branch_debit, online_debit) VALUES ('2021-01-03', 98, 2, 'Office Supplies','ST-NY-001',NULL);
INSERT INTO DebitTransactions(date, amount, account_no, category, branch_debit, online_debit) VALUES ('2020-05-18', 59.99, 1, 'Advertising',NULL,'ST-Amazon');
INSERT INTO DebitTransactions(date, amount, account_no, category, branch_debit, online_debit) VALUES ('2020-02-03', 599, 3, 'Advertising',NULL,'PF-Shopify');
INSERT INTO DebitTransactions(date, amount, account_no, category, branch_debit, online_debit) VALUES ('2020-12-19', 489, 1, 'Raw Materials','ST-NY-001',NULL);
INSERT INTO DebitTransactions(date, amount, account_no, category, branch_debit, online_debit) VALUES ('2021-02-28', 10949, 4, 'Maintenance','MB-DXB-005',NULL);
INSERT INTO DebitTransactions(date, amount, account_no, category, branch_debit, online_debit) VALUES ('2021-03-01', 8999, 5, 'Inventory',NULL,NULL);
INSERT INTO DebitTransactions(date, amount, account_no, category, branch_debit, online_debit) VALUES ('2021-03-04', 399, 6, 'Advertising',NULL,NULL);
INSERT INTO DebitTransactions(date, amount, account_no, category, branch_debit, online_debit) VALUES ('2021-03-16', 1999, 5, 'Shipping, freight & delivery - COS','IL-ISB-001',NULL);
INSERT INTO DebitTransactions(date, amount, account_no, category, branch_debit, online_debit) VALUES ('2021-04-17', 2799, 7, 'Supplies & materials - COGS','CG-DIA-004',NULL);
INSERT INTO DebitTransactions(date, amount, account_no, category, branch_debit, online_debit) VALUES ('2021-04-28', 89.99, 5, 'Refunds','IL-ISB-001',NULL);
INSERT INTO DebitTransactions(date, amount, account_no, category, branch_debit, online_debit) VALUES ('2021-04-30', 64.99, 6, 'Subscription Fees',NULL,'TS-Ebay');
INSERT INTO DebitTransactions(date, amount, account_no, category, branch_debit, online_debit) VALUES ('2021-05-04', 9999, 7, 'Subscription',NULL,'CG-Shopify');
INSERT INTO DebitTransactions(date, amount, account_no, category, branch_debit, online_debit) VALUES ('2021-05-16', 1999, 5, 'Equipment','IL-ISB-001',NULL);
INSERT INTO DebitTransactions(date, amount, account_no, category, branch_debit, online_debit) VALUES ('2021-05-17', 1399, 7, 'Supplies & materials - COGS','CG-DIA-004',NULL);
INSERT INTO DebitTransactions(date, amount, account_no, category, branch_debit, online_debit) VALUES ('2021-05-28', 89.99, 5, 'Advertising',NULL,'IL-Instagram');
INSERT INTO DebitTransactions(date, amount, account_no, category, branch_debit, online_debit) VALUES ('2021-05-30', 64.99, 6, 'Office Expenses',NULL,NULL);
INSERT INTO DebitTransactions(date, amount, account_no, category, branch_debit, online_debit) VALUES ('2021-06-28', 345, 4, 'Maintenance','MB-DXB-005',NULL);
INSERT INTO DebitTransactions(date, amount, account_no, category, branch_debit, online_debit) VALUES ('2021-06-30', 1999, 5, 'Inventory',NULL,NULL);
INSERT INTO DebitTransactions(date, amount, account_no, category, branch_debit, online_debit) VALUES ('2021-08-30', 64.99, 6, 'Subscription Fees',NULL,'TS-Ebay');
INSERT INTO DebitTransactions(date, amount, account_no, category, branch_debit, online_debit) VALUES ('2021-09-04', 9999, 7, 'Subscription',NULL,'CG-Shopify');
INSERT INTO DebitTransactions(date, amount, account_no, category, branch_debit, online_debit) VALUES ('2021-09-16', 19.99, 5, 'Equipment','IL-ISB-001',NULL);
INSERT INTO DebitTransactions(date, amount, account_no, category, branch_debit, online_debit) VALUES ('2021-09-17', 13.99, 7, 'Supplies & materials - COGS','CG-DIA-004',NULL);
INSERT INTO DebitTransactions(date, amount, account_no, category, branch_debit, online_debit) VALUES ('2021-09-28', 99.99, 5, 'Advertising',NULL,'IL-Instagram');
INSERT INTO DebitTransactions(date, amount, account_no, category, branch_debit, online_debit) VALUES ('2021-09-30', 74.99, 6, 'Office Expenses',NULL,NULL);


INSERT INTO CreditTransactions(date, amount, account_no, category, branch_credit, online_credit) VALUES ('2020-02-03', 156, 2, 'Sales','ST-NY-001',NULL);
INSERT INTO CreditTransactions(date, amount, account_no, category, branch_credit, online_credit) VALUES ('2020-03-09', 5499, 4, 'Sales',NULL,'MB-Facebook');
INSERT INTO CreditTransactions(date, amount, account_no, category, branch_credit, online_credit) VALUES ('2020-03-17', 2999.99, 4, 'Sales','MB-DXB-005',NULL);
INSERT INTO CreditTransactions(date, amount, account_no, category, branch_credit, online_credit) VALUES ('2020-07-03', 100, 3, 'Sales',NULL,'PF-Shopify');
INSERT INTO CreditTransactions(date, amount, account_no, category, branch_credit, online_credit) VALUES ('2020-07-11', 3500, 4, 'Sales',NULL,'MB-Facebook');
INSERT INTO CreditTransactions(date, amount, account_no, category, branch_credit, online_credit) VALUES ('2020-07-13', 246, 3, 'Sales',NULL,'PF-Shopify');
INSERT INTO CreditTransactions(date, amount, account_no, category, branch_credit, online_credit) VALUES ('2020-07-19', 981, 3, 'Sales','PF-VM-001',NULL);
INSERT INTO CreditTransactions(date, amount, account_no, category, branch_credit, online_credit) VALUES ('2020-07-24', 762, 3, 'Sales',NULL,'PF-Shopify');
INSERT INTO CreditTransactions(date, amount, account_no, category, branch_credit, online_credit) VALUES ('2020-08-02', 299.99, 1, 'Sales',NULL,'ST-Amazon');
INSERT INTO CreditTransactions(date, amount, account_no, category, branch_credit, online_credit) VALUES ('2020-12-29', 9000, 4, 'Sales','MB-DXB-005',NULL);
INSERT INTO CreditTransactions(date, amount, account_no, category, branch_credit, online_credit) VALUES ('2021-01-04', 399, 3, 'Sales','PF-VM-001',NULL);
INSERT INTO CreditTransactions(date, amount, account_no, category, branch_credit, online_credit) VALUES ('2021-01-07', 4569, 4, 'Sales','MB-DXB-005',NULL);
INSERT INTO CreditTransactions(date, amount, account_no, category, branch_credit, online_credit) VALUES ('2021-01-16', 1045, 3, 'Sales',NULL,'PF-Shopify');
INSERT INTO CreditTransactions(date, amount, account_no, category, branch_credit, online_credit) VALUES ('2021-01-17', 8799, 4, 'Sales','MB-DXB-005',NULL);
INSERT INTO CreditTransactions(date, amount, account_no, category, branch_credit, online_credit) VALUES ('2021-03-01', 49.99, 7, 'Sales','CG-DIA-004',NULL);
INSERT INTO CreditTransactions(date, amount, account_no, category, branch_credit, online_credit) VALUES ('2021-03-07', 29.99, 6, 'Sales',NULL,'IL-Instagram');
INSERT INTO CreditTransactions(date, amount, account_no, category, branch_credit, online_credit) VALUES ('2021-05-07', 89.99, 6, 'Sales',NULL,'IL-Instagram');
INSERT INTO CreditTransactions(date, amount, account_no, category, branch_credit, online_credit) VALUES ('2021-06-03', 100, 5, 'Sales',NULL,'IL-Instagram');
INSERT INTO CreditTransactions(date, amount, account_no, category, branch_credit, online_credit) VALUES ('2021-06-11', 3500, 5, 'Sales',NULL,'IL-Instagram');
INSERT INTO CreditTransactions(date, amount, account_no, category, branch_credit, online_credit) VALUES ('2021-06-13', 246, 6, 'Sales',NULL,'TS-Ebay');
INSERT INTO CreditTransactions(date, amount, account_no, category, branch_credit, online_credit) VALUES ('2021-06-19', 981, 6, 'Sales','TS-IST-001',NULL);
INSERT INTO CreditTransactions(date, amount, account_no, category, branch_credit, online_credit) VALUES ('2021-06-24', 762, 7, 'Sales',NULL,'CG-Shopify');
INSERT INTO CreditTransactions(date, amount, account_no, category, branch_credit, online_credit) VALUES ('2021-07-01', 29.99, 7, 'Sales','CG-DIA-004',NULL);
INSERT INTO CreditTransactions(date, amount, account_no, category, branch_credit, online_credit) VALUES ('2021-07-04', 39.99, 6, 'Sales',NULL,'TS-Ebay');
INSERT INTO CreditTransactions(date, amount, account_no, category, branch_credit, online_credit) VALUES ('2021-08-07', 29.99, 6, 'Sales',NULL,'IL-Instagram');
INSERT INTO CreditTransactions(date, amount, account_no, category, branch_credit, online_credit) VALUES ('2021-08-16', 1999, 5, 'Sales','IL-ISB-001',NULL);
INSERT INTO CreditTransactions(date, amount, account_no, category, branch_credit, online_credit) VALUES ('2021-08-17', 2799, 7, 'Sales','CG-DIA-004',NULL);
INSERT INTO CreditTransactions(date, amount, account_no, category, branch_credit, online_credit) VALUES ('2021-08-28', 89.99, 5, 'Sales','IL-ISB-001',NULL);
INSERT INTO CreditTransactions(date, amount, account_no, category, branch_credit, online_credit) VALUES ('2021-09-07', 89.99, 6, 'Sales',NULL,'IL-Instagram');
INSERT INTO CreditTransactions(date, amount, account_no, category, branch_credit, online_credit) VALUES ('2021-10-03', 99.99, 5, 'Sales',NULL,'IL-Instagram');
INSERT INTO CreditTransactions(date, amount, account_no, category, branch_credit, online_credit) VALUES ('2021-10-11', 3500, 5, 'Sales',NULL,'IL-Instagram');
INSERT INTO CreditTransactions(date, amount, account_no, category, branch_credit, online_credit) VALUES ('2021-10-13', 24.99, 6, 'Sales',NULL,'TS-Ebay');
INSERT INTO CreditTransactions(date, amount, account_no, category, branch_credit, online_credit) VALUES ('2021-10-19', 99.99, 6, 'Sales','TS-IST-001',NULL);
INSERT INTO CreditTransactions(date, amount, account_no, category, branch_credit, online_credit) VALUES ('2021-10-24', 49.99, 7, 'Sales',NULL,'CG-Shopify');