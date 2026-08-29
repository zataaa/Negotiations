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
    [MerchantType] NVARCHAR(20) NOT NULL CHECK ([MerchantType] IN ('Retail', 'Wholesale', 'Mixed')), -- التعديل الأول
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
    [Unit] NVARCHAR(50) NULL DEFAULT N'قطعة', -- Second modifier (e.g., piece, box, carton, meter)
    [WholesalePrice] DECIMAL(10,2) NOT NULL,
    [StockQuantity] INT NOT NULL DEFAULT 0,
    [SaleType] NVARCHAR(20) NULL,
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
CREATE CREATE TABLE [dbo].[MerchantProductMapping] (
    [MappingID] INT IDENTITY(1,1) PRIMARY KEY,
    [SellerMerchantID] INT NOT NULL,
    [ProductID] INT NOT NULL,
    
    --Price and quantity supplied
    [SellingPrice] DECIMAL(10,2) NOT NULL,   -- Small merchant's selling price
    [VisibleStock] INT NULL,                 --Quantity offered only    
    
    -- Unit Improvements and Minimum Order Quantity
    [SellingUnit] NVARCHAR(50) NULL DEFAULT N'قطعة', -- Customer sales unit (e.g., piece, box)
    [ConversionFactor] INT NOT NULL DEFAULT 1,      -- How many units are in the wholesale pack (e.g., a carton = 12 boxes)?
    [MOQ] INT NOT NULL DEFAULT 1,                   -- Minimum Order Quantity (Minimum purchase quantity)
    
    [SaleType] NVARCHAR(20) NULL,                   -- Retail / Wholesale / Both
    [IsActive] BIT DEFAULT 1,
    [CreatedAt] DATETIME DEFAULT GETDATE(),

    -- القيود
    CONSTRAINT [FK_Mapping_SellerMerchant] FOREIGN KEY ([SellerMerchantID]) 
        REFERENCES [dbo].[SellerMerchants]([SellerMerchantID]) ON DELETE CASCADE,
    CONSTRAINT [FK_Mapping_Product] FOREIGN KEY ([ProductID]) 
        REFERENCES [dbo].[Products]([ProductID]) ON DELETE CASCADE,
    CONSTRAINT [UQ_Seller_Product_Mapping] UNIQUE ([SellerMerchantID], [ProductID]),
    CONSTRAINT [CK_MOQ_Positive] CHECK ([MOQ] >= 1),
    CONSTRAINT [CK_ConversionFactor_Positive] CHECK ([ConversionFactor] >= 1)
);

CREATE TABLE [dbo].[Orders] (
    [OrderID] INT IDENTITY(1,1) PRIMARY KEY,
    [SellerMerchantID] INT NOT NULL,     --The merchant-seller
    
    -- Customer Details (Registered or Unregistered)
    [CustomerID] INT NULL,               -- FK In the event that the buyer is registered in the system
    [GuestCustomerName] NVARCHAR(150) NULL,
    [GuestCustomerPhone] VARCHAR(20) NULL,
    
    [OrderType] NVARCHAR(20) NOT NULL CHECK ([OrderType] IN ('Retail', 'Wholesale')),
    [TotalAmount] DECIMAL(10,2) NOT NULL,
    [OrderStatus] NVARCHAR(20) NOT NULL DEFAULT 'Pending' 
        CHECK ([OrderStatus] IN ('Pending', 'Approved', 'Shipped', 'Completed', 'Cancelled')),
    
    [CreatedAt] DATETIME DEFAULT GETDATE(),

    CONSTRAINT [FK_Orders_SellerMerchant] FOREIGN KEY ([SellerMerchantID]) 
        REFERENCES [dbo].[SellerMerchants]([SellerMerchantID])
);
