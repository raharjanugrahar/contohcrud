DECLARE @noinvoice AS VARCHAR(10)
SET @noinvoice = 'IN0001'


SELECT Top 1 i.InvoiceNo, i.InvoiceDate, i.ShipTo, 
i.InvoiceTo, m.PaymentName AS 'PAYMENT_TYPE' ,
m1.SalesName 'Sales',
C.CourierName AS 'Courier', ( i.CourierFee * D.Weight * D.Qty ) AS Courier_Fee  
FROM 
trinvoice i 
LEFT JOIN trinvoicedetail D ON i.InvoiceNo = D.InvoiceNo 
LEFT JOIN msproduct P ON D.ProductID = P.ProductID
LEFT JOIN mscourier C ON i.CourierID = C.CourierID
LEFT JOIN mspayment m ON i.PaymentType = m.PaymentID
LEFT JOIN mssales m1 ON i.SalesID = m1.SalesID
WHERE I.InvoiceNo = @noinvoice
ORDER BY P.ProductName ASC



SELECT i.InvoiceNo,
P.ProductName AS 'ITEM', P.Weight , D.Qty, P.Price AS 'Unit_Price' , (P.Weight * D.Qty * P.Price)  AS 'Total'
,( i.CourierFee * D.Weight * D.Qty ) AS Courier_Fee  
FROM 
trinvoice i 
LEFT JOIN trinvoicedetail D ON i.InvoiceNo = D.InvoiceNo 
LEFT JOIN msproduct P ON D.ProductID = P.ProductID
LEFT JOIN mscourier C ON i.CourierID = C.CourierID
LEFT JOIN mspayment m ON i.PaymentType = m.PaymentID
LEFT JOIN mssales m1 ON i.SalesID = m1.SalesID
WHERE I.InvoiceNo = @noinvoice
ORDER BY P.ProductName ASC

SELECT 
SUM (P.Weight * D.Qty * P.Price)  AS 'SUB_Total'
,SUM ( l.Price  * D.Weight * D.Qty ) AS Courier_Fee ,
SUM (P.Weight * D.Qty * P.Price) +  SUM ( l.Price  * D.Weight * D.Qty ) AS 'Total'
FROM 
trinvoice i 
LEFT JOIN trinvoicedetail D ON i.InvoiceNo = D.InvoiceNo 
LEFT JOIN msproduct P ON D.ProductID = P.ProductID
LEFT JOIN mscourier C ON i.CourierID = C.CourierID
LEFT JOIN mspayment m ON i.PaymentType = m.PaymentID
LEFT JOIN mssales m1 ON i.SalesID = m1.SalesID
LEFT JOIN ltcourierfee l ON C.CourierID = l.CourierID
WHERE I.InvoiceNo = @noinvoice

GO