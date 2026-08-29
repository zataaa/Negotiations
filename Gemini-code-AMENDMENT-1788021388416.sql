-- ====================================================================
-- 1. Classification Table (Categories)
-- ====================================================================
CREATE TABLE [dbo].[Categories] (
    [CategoryID] INT IDENTITY(1,1) PRIMARY KEY,
    [CategoryName] NVARCHAR(100) NOT NULL,
    [CreatedAt] DATETIME DEFAULT GETDATE()
);

-- ====================================================================
-- 2. TABLE of Major Merchants (Factory Owners / Importers / Wholesalers)
-- ====================================================================
CREATE TABLE [dbo].[BigMerchants] (
    [BigMerchantID] INT IDENTITY(1,1) PRIMARY KEY,
    [Name] NVARCHAR(200) NOT NULL,
    [Type] NVARCHAR(50) NOT NULL CHECK ([Type] IN ('Factory', 'Importer', 'Wholesale')),
    [ContactInfo] NVARCHAR(300) NULL,
    [CreatedAt] DATETIME DEFAULT GETDATE()
);

-- ====================================================================
-- 3.TABLE of Merchants/Brokers(Seller / Small Merchants)
-- ====================================================================
CREATE TABLE [dbo].[SellerMerchants] (
    [SellerMerchantID] INT IDENTITY(1,1) PRIMARY KEY,
    [ShopName] NVARCHAR(200) NOT NULL,
    [ContactInfo] NVARCHAR(300) NULL,
    [CreatedAt] DATETIME DEFAULT GETDATE()
);

-- ====================================================================
-- 4.Master Product TABLE (for major wholesalers; contains actual inventory data)
-- ====================================================================
CREATE TABLE [dbo].[Products] (
    [ProductID] INT IDENTITY(1,1) PRIMARY KEY,
    [BigMerchantID] INT NOT NULL,
    [CategoryID] INT NULL,
    [ProductName] NVARCHAR(200) NOT NULL,
    [Description] NVARCHAR(MAX) NULL,
    [WholesalePrice] DECIMAL(10,2) NOT NULL, -- Cost price from the wholesaler
    [StockQuantity] INT NOT NULL DEFAULT 0,  --Actual available inventory
    [SaleType] NVARCHAR(20) NULL,            --Retail / Wholesale
    [IsActive] BIT DEFAULT 1,
    [CreatedAt] DATETIME DEFAULT GETDATE(),
    [UpdatedAt] DATETIME NULL,

    -- Foreign Keys
    CONSTRAINT [FK_Products_BigMerchants] FOREIGN KEY ([BigMerchantID]) 
        REFERENCES [dbo].[BigMerchants]([BigMerchantID]) ON DELETE CASCADE,
    CONSTRAINT [FK_Products_Categories] FOREIGN KEY ([CategoryID]) 
        REFERENCES [dbo].[Categories]([CategoryID]) ON DELETE SET NULL
);

-- ====================================================================
-- 5.Table Linking Products to Intermediary Merchants(Merchant Product Mapping)
-- ====================================================================
CREATE TABLE [dbo].[MerchantProductMapping] (
    [MappingID] INT IDENTITY(1,1) PRIMARY KEY,
    [SellerMerchantID] INT NOT NULL,
    [ProductID] INT NOT NULL,
    [SellingPrice] DECIMAL(10,2) NOT NULL,   -- Small merchant price
    [VisibleStock] INT NULL,                 -- The specified quantity is for the offer only.
    [SaleType] NVARCHAR(20) NULL,
    [IsActive] BIT DEFAULT 1,
    [CreatedAt] DATETIME DEFAULT GETDATE(),

    -- Foreign Keys
    CONSTRAINT [FK_Mapping_SellerMerchant] FOREIGN KEY ([SellerMerchantID]) 
        REFERENCES [dbo].[SellerMerchants]([SellerMerchantID]) ON DELETE CASCADE,
    CONSTRAINT [FK_Mapping_Product] FOREIGN KEY ([ProductID]) 
        REFERENCES [dbo].[Products]([ProductID]) ON DELETE CASCADE,

    -- Preventing the duplication of the same product for the same merchant.
    CONSTRAINT [UQ_Seller_Product_Mapping] UNIQUE ([SellerMerchantID], [ProductID])
);