
-- ====================================================================
-- 1.Classification Table (Categories)
-- ====================================================================
CREATE TABLE [dbo].[Categories] (
    [CategoryID] INT IDENTITY(1,1) PRIMARY KEY,/*→*/ --FK_Products_Categories	Products.CategoryID→ Categories.CategoryID ok
    [CategoryName] NVARCHAR(100) NOT NULL,
    [CreatedAt] DATETIME DEFAULT GETDATE()
);

-- ====================================================================
-- 2.Unified Merchant Table(Unified Merchants Entity)
-- Covers all types of trade (manufacturing, importing, wholesale, retail, and mixed).
-- ====================================================================
CREATE TABLE [dbo].[Merchants] (
    [MerchantID] INT IDENTITY(1,1) PRIMARY KEY,/*→ M*//*─┼─*/ /*FK_Products_OwnerMerchant	Products.OwnerMerchantID → Merchants.MerchantID*/---ok
    [Name] NVARCHAR(200) NOT NULL,                    /*─┼─*//*FK_Mapping_Merchant    MerchantProductMapping.MerchantID→Merchants.MerchantID*/
    [MerchantLevel] NVARCHAR(20) NOT NULL             /*─┼─*//*FK_Transactions_Buyer Transactions.BuyerMerchantID → Merchants.MerchantID*/
    CHECK ([MerchantLevel] IN ('Big', 'Small')),      /*─┼─*//* FK_Transactions_Seller Transactions.SellerMerchantID → Merchants.MerchantID */
    [MerchantType] NVARCHAR(20) NOT NULL 
    CHECK ([MerchantType] IN ('Factory', 'Importer', 'Wholesale', 'Retail', 'Mixed')),
    [ContactInfo] NVARCHAR(300) NULL,
    [IsActive] BIT DEFAULT 1,
    [CreatedAt] DATETIME DEFAULT GETDATE()
);
-- ====================================================================
-- 3. جدول المنتجات الأصلية (Catalog / Master Products)
-- يعود ملكيته للتاجر المصنّع أو المستورد الأول للمنتج
-- ====================================================================
CREATE TABLE [dbo].[Products] (
    [ProductID] INT IDENTITY(1,1) PRIMARY KEY,/*→*//*FK_Mapping_Product MerchantProductMapping.ProductID→Products.ProductID*/
                                               /*& FK_TransactionItems_Product	 TransactionItems.ProductID → Products.ProductID*/
    [OwnerMerchantID] INT NOT NULL, /*→*/-- FK: The merchant who owns or originally organizes the product
    [CategoryID] INT NULL,/*→*/----------ok--FK_Products_Categories	Products.CategoryID→ Categories.CategoryID
    [ProductName] NVARCHAR(200) NOT NULL,
    [Description] NVARCHAR(MAX) NULL,
    [BaseUnit] NVARCHAR(50) NOT NULL DEFAULT N'قطعة', -- The owner's primary unit
    [WholesalePrice] DECIMAL(10,2) NOT NULL,        -- Original price from the owner
    [StockQuantity] INT NOT NULL DEFAULT 0,         -- Actual inventory held by the owner
    [IsActive] BIT DEFAULT 1,
    [CreatedAt] DATETIME DEFAULT GETDATE(),
    [UpdatedAt] DATETIME NULL,

    -- Constraints
    CONSTRAINT [FK_Products_OwnerMerchant] FOREIGN KEY ([OwnerMerchantID]) 
        REFERENCES [dbo].[Merchants]([MerchantID]),
    CONSTRAINT [FK_Products_Categories] FOREIGN KEY ([CategoryID]) 
        REFERENCES [dbo].[Categories]([CategoryID]) ON DELETE SET NULL
);

-- ====================================================================
-- 4.Table of 4. Re-displaying and pricing products for merchants.(Merchant Product Mapping)
-- It allows any merchant to resell any product, provided the price, unit, and quantity are specified.
-- ====================================================================
CREATE TABLE [dbo].[MerchantProductMapping] (
    [MappingID] INT IDENTITY(1,1) PRIMARY KEY,/*FK_TransactionItems_Mapping////TransactionItems.MappingID → MerchantProductMapping.MappingID*/
    [MerchantID] INT NOT NULL,    --The merchant offering the product for sale
    [ProductID] INT NOT NULL,     --The original product--→/*FK_Mapping_Product MerchantProductMapping.ProductID→Products.ProductID*/ --ok  
    [SellingPrice] DECIMAL(10,2) NOT NULL,  -- The price set by this merchant
    [VisibleStock] INT NULL,                 --Quantity visible to customers
    [SellingUnit] NVARCHAR(50) NOT NULL DEFAULT N'قطعة',
    [ConversionFactor] INT NOT NULL DEFAULT 1,  -- Equivalent ratio to the original unit
    [MOQ] INT NOT NULL DEFAULT 1,                   -- Minimum order quantity
    [SaleType] NVARCHAR(20) NOT NULL CHECK ([SaleType] IN ('Retail', 'Wholesale', 'Both')),
    [IsActive] BIT DEFAULT 1,
    [CreatedAt] DATETIME DEFAULT GETDATE(),

    -- Constraints
    CONSTRAINT [FK_Mapping_Merchant] FOREIGN KEY ([MerchantID]) 
        REFERENCES [dbo].[Merchants]([MerchantID]),
    CONSTRAINT [FK_Mapping_Product] FOREIGN KEY ([ProductID]) 
        REFERENCES [dbo].[Products]([ProductID]),
   -- Prevent the same merchant from listing the same product multiple times.
    CONSTRAINT [UQ_Merchant_Product_Mapping] UNIQUE ([MerchantID], [ProductID]),
    CONSTRAINT [CK_MOQ_Positive] CHECK ([MOQ] >= 1),
    CONSTRAINT [CK_ConversionFactor_Positive] CHECK ([ConversionFactor] >= 1)
);

-- ====================================================================
-- 5. TABLE of Operations and Commercial Transactions(Transactions / Orders Header)
-- ====================================================================
CREATE TABLE [dbo].[Transactions] (
    [TransactionID] INT IDENTITY(1,1) PRIMARY KEY,/*FK_TransactionItems_Transactions TransactionItems.TransactionID → Transactions.TransactionID*/
    [SellerMerchantID] INT NOT NULL,  --The seller merchant (i.e., any merchant from the Table)Merchants) 
    /* FK_Transactions_Seller Transactions.SellerMerchantID → Merchants.MerchantID */
    [BuyerMerchantID] INT NULL,       -- The buyer/merchant (in case B2B)
    /*FK_Transactions_Buyer Transactions.BuyerMerchantID → Merchants.MerchantID*/
    -- In the event of a sale to an unregistered foreign customer (B2C / Guest)
    [GuestCustomerName] NVARCHAR(150) NULL,
    [GuestCustomerPhone] VARCHAR(20) NULL,
    
    [TransactionType] NVARCHAR(20) NOT NULL CHECK ([TransactionType] IN ('Wholesale', 'Retail')),
    [TotalAmount] DECIMAL(10,2) NOT NULL,
    [Status] NVARCHAR(20) NOT NULL DEFAULT 'Pending' 
        CHECK ([Status] IN ('Pending', 'Approved', 'Shipped', 'Completed', 'Cancelled')),
    [TransactionDate] DATETIME DEFAULT GETDATE(),

    -- Constraints
    CONSTRAINT [FK_Transactions_Seller] FOREIGN KEY ([SellerMerchantID]) 
        REFERENCES [dbo].[Merchants]([MerchantID]),
    CONSTRAINT [FK_Transactions_Buyer] FOREIGN KEY ([BuyerMerchantID]) 
        REFERENCES [dbo].[Merchants]([MerchantID])
);

-- ====================================================================
-- 6. Business Transaction Details Table(Transaction Items / Order Details)
-- ====================================================================
CREATE TABLE [dbo].[TransactionItems] (
    [TransactionItemID] INT IDENTITY(1,1) PRIMARY KEY,
    [TransactionID] INT NOT NULL,/* FK_TransactionItems_Transactions	TransactionItems.TransactionID → Transactions.TransactionID*/
    [MappingID] INT NOT NULL,     -- Offer product at the seller's/*TransactionItems.MappingID → MerchantProductMapping.MappingID*/
    [ProductID] INT NOT NULL,     -- Original product (to deduct stock from the actual owner)  →TransactionItems.ProductID → Products.ProductID
    
    [Quantity] INT NOT NULL,
    [UnitPrice] DECIMAL(10,2) NOT NULL,
    [SoldUnit] NVARCHAR(50) NOT NULL,
    [ConversionFactor] INT NOT NULL DEFAULT 1,
    
    --Automatic calculation of the discounted amount and total price.
    [DeductedStockQuantity] AS ([Quantity] * [ConversionFactor]),
    [TotalPrice] AS ([Quantity] * [UnitPrice]),

    -- Constraints
    CONSTRAINT [FK_TransactionItems_Transactions] FOREIGN KEY ([TransactionID]) 
        REFERENCES [dbo].[Transactions]([TransactionID]) ON DELETE CASCADE,
    CONSTRAINT [FK_TransactionItems_Mapping] FOREIGN KEY ([MappingID]) 
        REFERENCES [dbo].[MerchantProductMapping]([MappingID]),
    CONSTRAINT [FK_TransactionItems_Product] FOREIGN KEY ([ProductID]) 
        REFERENCES [dbo].[Products]([ProductID])
);