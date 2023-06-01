#All transactions will be sorted and displayed according to
# the volume of transactions with a certain sales channel

(SELECT distinct branch_debit AS SalesChannel,
	SUM(amount) AS TotalDebit
FROM debitTransactions
WHERE branch_debit IS NOT NULL
#where branch_debit = 'CG-DIA-004' for a particular branch
GROUP BY branch_debit
ORDER BY branch_debit DESC)
UNION
(SELECT distinct online_debit AS SalesChannel, SUM(amount) AS TotalDebit
FROM debitTransactions
WHERE online_debit IS NOT NULL
#where branch_debit = 'CG-DIA-004' for a particular branch
GROUP BY online_debit
ORDER BY online_debit DESC);