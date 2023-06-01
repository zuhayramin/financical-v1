		(SELECT tc.category AS Type, SUM(tc.amount) AS TransactionValue
		FROM CreditTransactions tc
		INNER JOIN AccountInfo ac
		ON ac.account_no = tc.account_no
		INNER JOIN BusinessInfo b
		ON b.bus_reg_no = ac.business_no
		GROUP BY tc.category)
UNION
		(SELECT td.category AS Type, (0 - SUM(td.amount)) AS TransactionValue
		FROM DebitTransactions td
		INNER JOIN AccountInfo ac
		ON ac.account_no = td.account_no
		INNER JOIN BusinessInfo b
		ON b.bus_reg_no = ac.business_no
        INNER JOIN UserInfo u
		ON u.user_id = b.owner_id
        WHERE u.user_id = 1
		GROUP BY td.category);