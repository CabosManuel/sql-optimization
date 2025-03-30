USE WideWorldImporters
GO

-- -------
-- CASO 1
-- -------
SET STATISTICS IO ON

SELECT TOP 10000 * 
  FROM Application.People p INNER JOIN 
       Sales.InvoiceLines i ON p.PersonID = i.LastEditedBy INNER JOIN 
       Warehouse.StockItemTransactions s ON p.PersonID = s.LastEditedBy
 ORDER BY i.StockItemID
GO

CREATE NONCLUSTERED INDEX [IX_prueba]
ON [Warehouse].[StockItemTransactions] ([LastEditedBy])
INCLUDE ([StockItemTransactionID],[StockItemID],[TransactionTypeID],[CustomerID],[InvoiceID],[SupplierID],[PurchaseOrderID],[TransactionOccurredWhen],[Quantity],[LastEditedWhen])
GO

-- -------
-- CASO 2
-- -------
SET STATISTICS IO ON

SELECT [OrderID],[ContactPersonID],[PickingCompletedWhen]
FROM [WideWorldImporters].[Sales].[Orders]
WHERE ContactPersonID = 3176;

-- -------
-- CASO 3
-- -------
SET STATISTICS IO ON

SELECT InvoiceID
	,ContactPersonID
	,AccountsPersonID
FROM WideWorldImporters.Sales.Invoices
WHERE ContactPersonID >= 3032
	AND ContactPersonID <= 3035;

-- Corregir index FK_Sales_Invoices_ContactPersonID agregar [AccountPersonID]