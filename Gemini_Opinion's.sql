-- ====================================================================
-- 1. Big Traders Table (Factories and Importers - Actual Stock Owners)
-- ====================================================================
CREATE TABLE [dbo].[BigMerchants] (
    [BigMerchantID] INT IDENTITY(1,1) NOT NULL,
    [CompanyName] NVARCHAR(200) NOT NULL,
    [Phone] VARCHAR(20) NULL,
    [CreatedAt] DATETIME DEFAULT GETDATE(),

    CONSTRAINT [PK_BigMerchants] PRIMARY KEY ([BigMerchantID])
);

-- =======================================================
-- 2. Merchants/Vendors Table (Virtual)(Seller Merchants)
-- =======================================================
CREATE TABLE [dbo].[SellerMerchants] (
    [SellerMerchantID] INT IDENTITY(1,1) NOT NULL,
    [ShopName] NVARCHAR(200) NOT NULL,
    [OwnerName] NVARCHAR(150) NULL,
    [Phone] VARCHAR(20) NULL,
    [CreatedAt] DATETIME DEFAULT GETDATE(),

    CONSTRAINT [PK_SellerMerchants] PRIMARY KEY ([SellerMerchantID])
);

-- =============================================
-- 3. Original products table (for major traders only, with real stock)
-- =============================================
CREATE TABLE [dbo].[Products] (
    [ProductID] INT IDENTITY(1,1) NOT NULL,
    [BigMerchantID] INT NOT NULL, -- FK:(The big merchant who owns the product)
    [ProductName] NVARCHAR(200) NOT NULL,
    [Description] NVARCHAR(MAX) NULL,
    [BasePrice] DECIMAL(10,2) NOT NULL, -- The cost price to the middleman
    [ActualStockQuantity] INT NOT NULL DEFAULT 0, -- The actual remaining stock
    [IsActive] BIT DEFAULT 1,
    [CreatedAt] DATETIME DEFAULT GETDATE(),

    CONSTRAINT [PK_Products] PRIMARY KEY ([ProductID]),
    CONSTRAINT [FK_Products_BigMerchants] FOREIGN KEY ([BigMerchantID]) 
        REFERENCES [dbo].[BigMerchants]([BigMerchantID])
);

-- ===========================================================
-- 4. Middleman Trader Products Table(Seller Virtual Products)
-- ============================================================
CREATE TABLE [dbo].[SellerProducts] (
    [SellerProductID] INT IDENTITY(1,1) NOT NULL,
    [SellerMerchantID] INT NOT NULL, -- FK: The middleman merchant
    [ProductID] INT NOT NULL,        -- FK: Original product link for stock discount
    [CustomPrice] DECIMAL(10,2) NOT NULL, -- Retail/Wholesale Price
    [DisplayStockQuantity] INT NULL,      -- Limited quantity for display only
    [SaleType] NVARCHAR(20) NOT NULL CHECK ([SaleType] IN ('Retail', 'Wholesale', 'Both')), -- نوع البيع
    [IsActive] BIT DEFAULT 1,

    CONSTRAINT [PK_SellerProducts] PRIMARY KEY ([SellerProductID]),
    CONSTRAINT [FK_SellerProducts_SellerMerchants] FOREIGN KEY ([SellerMerchantID]) 
        REFERENCES [dbo].[SellerMerchants]([SellerMerchantID]),
    CONSTRAINT [FK_SellerProducts_Products] FOREIGN KEY ([ProductID]) 
        REFERENCES [dbo].[Products]([ProductID]),
    
    --Prevent the same product from being listed by the same intermediary seller
    CONSTRAINT [UQ_Seller_Product] UNIQUE ([SellerMerchantID], [ProductID])
);

CREATE TABLE [dbo].[Orders] (
    [OrderID] INT IDENTITY(1,1) NOT NULL,
    [SellerMerchantID] INT NOT NULL, -- FK: Intermediary Seller
    
    -- Dealing with the customer
    [CustomerID] INT NULL, -- FK (In the event that the buyer is registered in the system as a merchant or wholesale buyer)
    [GuestCustomerName] NVARCHAR(150) NULL, -- Unregistered customer name
    [GuestCustomerPhone] VARCHAR(20) NULL,   -- Unregistered customer's phone
    
    [OrderType] VARCHAR(20) CHECK ([OrderType] IN ('Wholesale', 'Retail')), -- (Transaction Type (Wholesale/Retail)
    [TotalAmount] DECIMAL(10,2) NOT NULL,
    [CreatedAt] DATETIME DEFAULT GETDATE(),

    CONSTRAINT [PK_Orders] PRIMARY KEY ([OrderID]),
    CONSTRAINT [FK_Orders_SellerMerchants] FOREIGN KEY ([SellerMerchantID]) 
        REFERENCES [dbo].[SellerMerchants]([SellerMerchantID])
);