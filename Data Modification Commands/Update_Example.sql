SELECT * FROM AccountInfo;

SET SQL_SAFE_UPDATES = 0;
UPDATE AccountInfo 
SET IBAN = 'TR-9999-0623-8197-1712-1538-1718'
WHERE account_name = 'SweeTooth Current Account';
SET SQL_SAFE_UPDATES=1;

SELECT * FROM AccountInfo;
