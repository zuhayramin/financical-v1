SELECT b.name AS Business, td.amount AS Amount, td.category AS Type, td.date AS Date
FROM DebitTransactions td
INNER JOIN AccountInfo ac
ON td.account_no = ac.account_no
INNER JOIN BusinessInfo b
ON b.bus_reg_no = ac.business_no
INNER JOIN UserInfo u
ON u.user_id = b.owner_id
ORDER BY td.date desc
LIMIT 10;
