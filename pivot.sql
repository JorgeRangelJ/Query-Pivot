WITH ventas (compañia, año, total) AS 
(
SELECT a.CompanyName AS compañia, DATEPART(YY, b.OrderDate) AS año, SUM(c.UnitPrice * c.Quantity) AS total
FROM Customers AS a
INNER JOIN Orders AS b
ON a.CustomerID = b.CustomerID
INNER JOIN [Order Details] AS c
ON b.OrderID = c.OrderID
GROUP BY a.CompanyName, DATEPART(YY, b.OrderDate)
)

SELECT * FROM ventas
PIVOT (SUM(total) FOR año IN ([1996],[1997],[1998])) AS pivotes