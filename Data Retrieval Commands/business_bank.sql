Select ANY_VALUE(b.name), Bank.name
FROM Bank, BusinessInfo b, AccountInfo a 
Where Bank.bank_id = a.bank_id AND a.business_no = b.bus_reg_no;