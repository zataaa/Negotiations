/* ### 1. Users & Identity *//*5 علاقات---.*/
-- ربط المنتج بالتاجر المالك
ALTER TABLE [dbo].[Products]
ADD CONSTRAINT FK_Products_OwnerMerchant FOREIGN KEY (OwnerMerchantID)
    REFERENCES [dbo].[Merchants](MerchantID)
    ON DELETE NO ACTION
    ON UPDATE CASCADE;
/*--------------------------------------------------------------------------------------------------*/
/*--NEW: TO MAKE RELATIONSHIP WITH TRANSACTIONS, ADDED CATEGORYID COLUMN.
-- MERCHANTS TABLE  HAS A RELATIONSHIP  WITH Transactions TABLE AND Transactions TABLE HAS 
--A RELATIONSHIP WITH CATEGORIES TABLE. SO, TO MAKE RELATIONSHIP WITH CATEGORIES TABLE, 
-- I ADDED CATEGORYID COLUMN IN CASHONDELIVERY TABLE.
--WITH Categories TABLE.
العلاقات:
Merchants → Products

كل تاجر عنده منتجات.

العلاقة: Products.OwnerMerchantID → Merchants.MerchantID.

Products → Categories

كل منتج له تصنيف.

العلاقة: Products.CategoryID → Categories.CategoryID.
*/
CREATE TABLE [dbo].[Categories] (
    CategoryID INT IDENTITY(1,1) PRIMARY KEY,
    CategoryName NVARCHAR(100) NOT NULL,
    Description NVARCHAR(250) NULL
);

ALTER TABLE [dbo].[Products]
ADD CONSTRAINT FK_Products_Categories FOREIGN KEY (CategoryID)
    REFERENCES [dbo].[Categories](CategoryID)
    ON DELETE NO ACTION
    ON UPDATE CASCADE;

/*--------------------------------------------------------------------------------------------------*/




-- تعديل جدول Merchants لإضافة الأعمدة
ALTER TABLE [dbo].[Transactions]
ALTER COLUMN SellerMerchantID INT NULL;

ALTER TABLE [dbo].[Transactions]
ALTER COLUMN BuyerMerchantID INT NULL;

ALTER TABLE [dbo].[Merchants]
ALTER COLUMN SellerMerchantID INT NULL;
ALTER TABLE [dbo].[Merchants]
ALTER COLUMN BuyerMerchantID INT NULL;



/*
-- FK للبائع
ALTER TABLE [dbo].[Transactions]
ADD CONSTRAINT FK_Transactions_Seller FOREIGN KEY (SellerMerchantID)
    REFERENCES [dbo].[Merchants](MerchantID)
    ON DELETE SET NULL
    ON UPDATE CASCADE;
Msg 2714, Level 16, State 5, Line 5
There is already an object named 'FK_Transactions_Seller' in the database.
Msg 1750, Level 16, State 1, Line 5
Could not create constraint or index. See previous errors.*/

-- FK للمشتري
ALTER TABLE [dbo].[Transactions]
ADD CONSTRAINT FK_Transactions_Buyer FOREIGN KEY (BuyerMerchantID)
    REFERENCES [dbo].[Merchants](MerchantID)
    ON DELETE SET NULL
    ON UPDATE CASCADE;

    Msg 1785, Level 16, State 0, Line 16
Introducing FOREIGN KEY constraint 'FK_Transactions_Buyer' on table 'Transactions' may cause cycles or multiple cascade paths. Specify ON DELETE NO ACTION or ON UPDATE NO ACTION, or modify other FOREIGN KEY constraints.
Msg 1750, Level 16, State 1, Line 16
Could not create constraint or index. See previous errors.

/* many-to-many relationships:
Merchants → Products → Transactions */  
CREATE TABLE MerchantTransactions (
    TransactionID INT NOT NULL,
    MerchantID INT NOT NULL,
    Role NVARCHAR(10) NOT NULL, -- Seller أو Buyer
    CONSTRAINT PK_MerchantTransactions PRIMARY KEY (TransactionID, MerchantID, Role),
    CONSTRAINT FK_MT_Transaction FOREIGN KEY (TransactionID) REFERENCES Transactions(TransactionID),
    CONSTRAINT FK_MT_Merchant FOREIGN KEY (MerchantID) REFERENCES Merchants(MerchantID)
);
/* --------------------------------------------------------------------------------------------------*/
FK_Shipping_Transactions	FOREIGN KEY	Shipping.TransactionID	 ---> [FK] 	Transactions.TransactionID
/* لم تذكرها في   لكن تم تعريفها في FOREIGN KEY.sql  و هي صحيحة و موجودة في التصميم*/
/* --------------------------------------------------------------------------------------------------*/

 `CashOnDelivery.TransactionID → Transactions.TransactionID`

ALTER TABLE [dbo].[Transactions]
ADD CODID INT NULL;

ALTER TABLE [dbo].[Transactions]
ADD CONSTRAINT FK_Transactions_CashOnDelivery FOREIGN KEY (CODID)
    REFERENCES [dbo].[CashOnDelivery](CODID)
    ON DELETE SET NULL
    ON UPDATE CASCADE;

    /* --------------------------------------------------------------------------------------------------*/
    --ForecastingReports.ProductID → Products.ProductID`

ALTER TABLE [dbo].[ForecastingReports]
ADD CONSTRAINT FK_ForecastingReports_Products FOREIGN KEY (ProductID)
    REFERENCES [dbo].[Products](ProductID)
    ON DELETE SET NULL
    ON UPDATE CASCADE;
/*---------------------------------------------------------------------------------------------------*/
--### 7. Incident / Problem

CREATE TABLE [dbo].[ProblemLogs] (
    [LogID] INT NOT NULL PRIMARY KEY,
    [ProblemID] INT NOT NULL,
    [LogDescription] NVARCHAR(500) NULL,
    [LogDate] DATETIME NULL,
    [LoggedBy] INT NOT NULL,
    CONSTRAINT FK_ProblemLogs_ProblemCatalog FOREIGN KEY (ProblemID)
        REFERENCES [dbo].[ProblemCatalog](ProblemID)
        ON DELETE CASCADE
        ON UPDATE CASCADE
);
/*---------------------------------------------------------------------------------------------------*/


DROP TABLE [dbo].[MerchantProductMapping];

-- =============================================
-- Table: [dbo].[MerchantProductMapping]
-- =============================================
CREATE TABLE [dbo].[MerchantProductMapping] (
    [MappingID] int NOT NULL,
    [MerchantID] int NOT NULL,
    [ProductID] int NOT NULL,
    [SellingPrice] decimal(10,2) NOT NULL,
    [VisibleStock] int NULL,
    [SellingUnit] nvarchar(50) NULL,
    [ConversionFactor] int NULL,
    [MOQ] int NULL,
    [SaleType] nvarchar(20) NULL,
    [IsActive] bit NULL,
    [CreatedAt] datetime NULL
);

ALTER TABLE [dbo].[MerchantProductMapping]
ADD CONSTRAINT PK_MerchantProductMapping PRIMARY KEY (MappingID);

ALTER TABLE [dbo].[MerchantProductMapping]
ADD CONSTRAINT FK_MerchantProductMapping_Merchants FOREIGN KEY (MerchantID)
    REFERENCES [dbo].[Merchants](MerchantID)
    ON DELETE CASCADE
    ON UPDATE CASCADE;

    ALTER TABLE [dbo].[MerchantProductMapping]
ADD CONSTRAINT FK_MerchantProductMapping_Products FOREIGN KEY (ProductID)
    REFERENCES [dbo].[Products](ProductID)
    ON DELETE NO ACTION
    ON UPDATE CASCADE;

    /*FORCE*/

    ALTER TABLE [dbo].[MerchantProductMapping]
ADD CONSTRAINT FK_MerchantProductMapping_Products FOREIGN KEY (ProductID)
    REFERENCES [dbo].[Products](ProductID)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION;

/* في تعديلات سابقة تم تعريف اخري */


