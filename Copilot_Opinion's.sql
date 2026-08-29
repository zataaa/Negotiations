
-- ====================================================================
-- 1. Table of major traders (manufacturer/importer/wholesaler)
-- ====================================================================

-- )
CREATE TABLE BigMerchants (
    BigMerchantID INT IDENTITY(1,1) PRIMARY KEY,
    Name NVARCHAR(200) NOT NULL,
    Type NVARCHAR(50) NOT NULL, -- Factory, Importer, Wholesale
    ContactInfo NVARCHAR(300) NULL,
    CreatedAt DATETIME DEFAULT GETDATE()
);

-- ==============================================================
-- 2. Product table for each major merchant
-- ==============================================================

CREATE TABLE Products (
    ProductID INT IDENTITY(1,1) PRIMARY KEY,
    BigMerchantID INT NOT NULL,
    ProductName NVARCHAR(200) NOT NULL,
    Description NVARCHAR(MAX) NULL,
    Price DECIMAL(10,2) NOT NULL,
    StockQuantity INT NOT NULL,
    SaleType NVARCHAR(20) NULL,
    CategoryID INT NULL,
    IsActive BIT DEFAULT 1,
    CreatedAt DATETIME DEFAULT GETDATE(),
    UpdatedAt DATETIME NULL,
    FOREIGN KEY (BigMerchantID) REFERENCES BigMerchants(BigMerchantID)
);
-- ====================================================================
-- 3. -- Small Merchants Table (displays products from major merchants)
-- ====================================================================

CREATE TABLE SmallMerchants (
    SmallMerchantID INT IDENTITY(1,1) PRIMARY KEY,
    ShopName NVARCHAR(200) NOT NULL,
    ContactInfo NVARCHAR(300) NULL,
    CreatedAt DATETIME DEFAULT GETDATE()
);
-- ====================================================================
-- 4. -- Many-to-Many linking table between products and small merchantsCREATE TABLE MerchantProductMapping
-- ====================================================================

    MappingID INT IDENTITY(1,1) PRIMARY KEY,
    SmallMerchantID INT NOT NULL,
    ProductID INT NOT NULL,
    CustomPrice DECIMAL(10,2) NULL,
    VisibleStock INT NULL,
    SaleType NVARCHAR(20) NULL,
    CreatedAt DATETIME DEFAULT GETDATE(),
    FOREIGN KEY (SmallMerchantID) REFERENCES SmallMerchants(SmallMerchantID),
    FOREIGN KEY (ProductID) REFERENCES Products(ProductID)
);
-- ====================================================================
-- 5. -- -- Table of merchants selling to end-users
-- ====================================================================

-- جدول التجار البائعين للمستخدمين النهائيين
CREATE TABLE SellerMerchants (
    SellerMerchantID INT IDENTITY(1,1) PRIMARY KEY,
    SellerName NVARCHAR(200) NOT NULL,
    ContactInfo NVARCHAR(300) NULL,
    CreatedAt DATETIME DEFAULT GETDATE()
);
