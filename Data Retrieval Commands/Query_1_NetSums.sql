#Query which shows the total debts of all businesses
SELECT ac.account_name, (0-SUM(td.amount)) AS TotalDebits, SUM(tc.amount) AS TotalCredits,
((SELECT SUM(tc.amount) FROM CreditTransactions group by tc.account_no)
 - (SELECT SUM(td.amount) FROM DebitTransactions group by tc.account_no)) AS NetProfit
FROM BusinessInfo b
INNER JOIN AccountInfo ac
ON ac.business_no = b.bus_reg_no
INNER JOIN DebitTransactions td
ON td.account_no = ac.account_no
INNER JOIN CreditTransactions tc
ON tc.account_no = ac.account_no
GROUP BY ac.account_no;