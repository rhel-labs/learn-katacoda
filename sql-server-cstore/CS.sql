-- This sample requires the Full version of the WideWorldImporters database.
--
-- Demonstrate Operational Analytics Performance.
--   This script can be run while the Order Insert workload driver is running.
--   A larger amount of data results in a bigger performance gain from using nonclustered columnstore.
--   Therefore, it is best to run the Order Insert workload for a while (at least 20 minutes, making sure 
--   to have enough rows, and making sure compression kicks in) before compare the performance.
-- The script runs the query with and without nonclustered columnstore index (the technology used for
--   operational analytics), and outputs the time taken in the messages pane.

USE WideWorldImporters;
GO
SET NOCOUNT ON
GO

-- During the working day, Wide World Importers processes orders from customers. It is important
-- to estimate if stock will run out soon. To avoid this, a stock burn down rate needs to be 
-- calculated. The first part of this is to work out quantities on order lines that have not
-- yet been picked.

-- Terry, an analyst with the company has written a query that assesses the rate at which
-- the stock is being sold, and estimates (based on the sales rate), when the excess stock will
-- be sold. The problem with this query is that it uses the same tables that are being used by
-- the core order processing function within the company, and can impact the performance of those
-- tables if the query is run frequently. 

-- Terry has heard that SQL Server 2016 has strengths in operational analytics and hopes that
-- these capabilbies can allow him to run his queries even during busy order processing periods.


-- The above procedure creates nonclustered columnstore indexes on the Sales.OrderLines and Sales.InvoiceLines 
-- tables. Take a moment to view them now using Object Explorer.

-- The following query can be used to sum the stock yet to be picked for all stock items.

DECLARE @StartingTime datetime2(7) = SYSDATETIME();

SELECT ol.StockItemID, [Description], SUM(Quantity - PickedQuantity) AS AllocatedQuantity
FROM Sales.OrderLines AS ol WITH (NOLOCK)
GROUP BY ol.StockItemID, [Description];

PRINT 'Using nonclustered columnstore index: ' + CAST(DATEDIFF(millisecond, @StartingTime, SYSDATETIME()) AS varchar(20)) + ' ms';

SET @StartingTime = SYSDATETIME();

SELECT ol.StockItemID, [Description], SUM(Quantity - PickedQuantity) AS AllocatedQuantity
FROM Sales.OrderLines AS ol WITH (NOLOCK)
GROUP BY ol.StockItemID, [Description]
OPTION (IGNORE_NONCLUSTERED_COLUMNSTORE_INDEX);

PRINT 'Without nonclustered columnstore index: ' + CAST(DATEDIFF(millisecond, @StartingTime, SYSDATETIME()) AS varchar(20)) + ' ms';
GO
