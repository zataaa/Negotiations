

-- =============================================
-- Table: [dbo].[BigMerchants]
-- =============================================

CREATE TABLE BigMerchants (
    BigMerchantID INT IDENTITY(1,1) PRIMARY KEY,
    Name NVARCHAR(200) NOT NULL,
    ContactInfo NVARCHAR(500) NULL
);

-- =============================================
-- Table: [dbo].[SmallMerchants]
-- =============================================

CREATE TABLE SmallMerchants (
    SmallMerchantID INT IDENTITY(1,1) PRIMARY KEY,
    ShopName NVARCHAR(200) NOT NULL,
    ContactInfo NVARCHAR(500) NULL
);

-- =============================================
-- Table: [dbo].[BigMerchantProducts]
-- =============================================

CREATE TABLE BigMerchantProducts (
    MerchantProductID INT IDENTITY(1,1) PRIMARY KEY,
    BigMerchantID INT NOT NULL,
    ProductName NVARCHAR(200) NOT NULL,
    Description NVARCHAR(MAX) NULL,
    Price DECIMAL(10,2) NOT NULL,
    StockQuantity INT NOT NULL,
    SaleType NVARCHAR(20) NOT NULL,
    CategoryID INT NOT NULL,
    IsActive BIT DEFAULT 1,
    CreatedAt DATETIME DEFAULT GETDATE(),
    UpdatedAt DATETIME NULL,

    CONSTRAINT FK_BigMerchantProducts_BigMerchants FOREIGN KEY (BigMerchantID)
        REFERENCES BigMerchants(BigMerchantID)
);

-- =============================================
-- Table: [dbo].[MerchantProductMapping]
-- =============================================

CREATE TABLE MerchantProductMapping (
    MappingID INT IDENTITY(1,1) PRIMARY KEY,
    SmallMerchantID INT NOT NULL,
    MerchantProductID INT NOT NULL,
    CustomPrice DECIMAL(10,2) NULL,   -- السعر الخاص بالتاجر الصغير
    VisibleStock INT NULL,            -- الكمية التي يقرر يظهرها
    SaleType NVARCHAR(20) NULL,       -- جملة / قطاعي
    CreatedAt DATETIME DEFAULT GETDATE(),

    CONSTRAINT FK_Mapping_SmallMerchants FOREIGN KEY (SmallMerchantID)
        REFERENCES SmallMerchants(SmallMerchantID),

    CONSTRAINT FK_Mapping_BigMerchantProducts FOREIGN KEY (MerchantProductID)
        REFERENCES BigMerchantProducts(MerchantProductID)
);
