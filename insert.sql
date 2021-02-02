INSERT [dbo].[ltcourierfee] ([WeightID], [CourierID], [StartKg], [EndKg], [Price]) VALUES (1, 1, 1, 2, CAST(8000 AS Decimal(10, 0)))
GO
INSERT [dbo].[ltcourierfee] ([WeightID], [CourierID], [StartKg], [EndKg], [Price]) VALUES (2, 1, 3, 4, CAST(9500 AS Decimal(10, 0)))
GO
INSERT [dbo].[ltcourierfee] ([WeightID], [CourierID], [StartKg], [EndKg], [Price]) VALUES (3, 2, 1, 2, CAST(7500 AS Decimal(10, 0)))
GO
INSERT [dbo].[ltcourierfee] ([WeightID], [CourierID], [StartKg], [EndKg], [Price]) VALUES (4, 2, 3, 4, CAST(8500 AS Decimal(10, 0)))
GO
INSERT [dbo].[ltcourierfee] ([WeightID], [CourierID], [StartKg], [EndKg], [Price]) VALUES (5, 3, 1, 2, CAST(10000 AS Decimal(10, 0)))
GO
INSERT [dbo].[ltcourierfee] ([WeightID], [CourierID], [StartKg], [EndKg], [Price]) VALUES (6, 3, 3, 4, CAST(10000 AS Decimal(10, 0)))
GO
INSERT [dbo].[ltcourierfee] ([WeightID], [CourierID], [StartKg], [EndKg], [Price]) VALUES (7, 1, 5, 10, CAST(10500 AS Decimal(10, 0)))
GO
INSERT [dbo].[ltcourierfee] ([WeightID], [CourierID], [StartKg], [EndKg], [Price]) VALUES (8, 2, 5, 10, CAST(9500 AS Decimal(10, 0)))
GO
INSERT [dbo].[ltcourierfee] ([WeightID], [CourierID], [StartKg], [EndKg], [Price]) VALUES (9, 3, 5, 10, CAST(12000 AS Decimal(10, 0)))
GO
INSERT [dbo].[mscourier] ( [CourierName]) VALUES ( N'JNE')
GO
INSERT [dbo].[mscourier] ( [CourierName]) VALUES ( N'J&T')
GO
INSERT [dbo].[mscourier] ( [CourierName]) VALUES ( N'Wahana')
GO
INSERT [dbo].[mspayment] ( [PaymentName]) VALUES ( N'Cash')
GO
INSERT [dbo].[mspayment] ( [PaymentName]) VALUES ( N'COD')
GO
INSERT [dbo].[msproduct] ( [ProductName], [Weight], [Price]) VALUES ( N'Tepung', 1.5, CAST(10000 AS Decimal(10, 0)))
GO
INSERT [dbo].[msproduct] ( [ProductName], [Weight], [Price]) VALUES ( N'Bluband', 0.25, CAST(8000 AS Decimal(10, 0)))
GO
INSERT [dbo].[msproduct] ( [ProductName], [Weight], [Price]) VALUES ( N'Beras', 1, CAST(64000 AS Decimal(10, 0)))
GO
INSERT [dbo].[msproduct] ( [ProductName], [Weight], [Price]) VALUES ( N'Eskrim', 0.5, CAST(20000 AS Decimal(10, 0)))
GO
INSERT [dbo].[msproduct] ( [ProductName], [Weight], [Price]) VALUES ( N'Kentang', 1, CAST(15000 AS Decimal(10, 0)))
GO
INSERT [dbo].[mssales] ([SalesName]) VALUES ( N'Andy')
GO
INSERT [dbo].[mssales] ([SalesName]) VALUES ( N'Jessica')
GO
INSERT [dbo].[trinvoice] ([InvoiceDate], [InvoiceTo], [ShipTo], [SalesID], [CourierID], [PaymentType], [CourierFee]) VALUES (CAST(N'2015-06-23T00:00:00.000' AS DateTime), N'Invoice Orang 1', N'Ship Orang 1', 1, 1, 1, CAST(0 AS Decimal(10, 0)))
GO
INSERT [dbo].[trinvoice] ([InvoiceDate], [InvoiceTo], [ShipTo], [SalesID], [CourierID], [PaymentType], [CourierFee]) VALUES (CAST(N'2019-02-27T00:00:00.000' AS DateTime), N'Invoice Orang 2', N'Ship Orang 2', 2, 2, 2, CAST(0 AS Decimal(10, 0)))
GO
INSERT [dbo].[trinvoicedetail] ([InvoiceNo], [ProductID], [Weight], [Qty], [Price]) VALUES (1, 1, 1.5, 3, CAST(10000 AS Decimal(10, 0)))
GO
INSERT [dbo].[trinvoicedetail] ([InvoiceNo], [ProductID], [Weight], [Qty], [Price]) VALUES (1, 7, 0.25, 1, CAST(8000 AS Decimal(10, 0)))
GO
INSERT [dbo].[trinvoicedetail] ([InvoiceNo], [ProductID], [Weight], [Qty], [Price]) VALUES (1, 9, 2, 3, CAST(64000 AS Decimal(10, 0)))
GO
INSERT [dbo].[trinvoicedetail] ([InvoiceNo], [ProductID], [Weight], [Qty], [Price]) VALUES (2, 7, 0.25, 1, CAST(8000 AS Decimal(10, 0)))
GO
INSERT [dbo].[trinvoicedetail] ([InvoiceNo], [ProductID], [Weight], [Qty], [Price]) VALUES (2, 10, 0.5, 3, CAST(20000 AS Decimal(10, 0)))
GO
INSERT [dbo].[trinvoicedetail] ([InvoiceNo], [ProductID], [Weight], [Qty], [Price]) VALUES (2, 9, 2, 2, CAST(64000 AS Decimal(10, 0)))
GO
