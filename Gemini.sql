
-- =============================================
-- 1. جدول التجار (الكبار والصغار)
-- =============================================
CREATE TABLE [dbo].[Merchants] (
    [MerchantID] INT IDENTITY(1,1) NOT NULL,
    [MerchantName] NVARCHAR(200) NOT NULL,
    [MerchantType] VARCHAR(20) NOT NULL CHECK ([MerchantType] IN ('Big', 'Small')),
    [CreatedAt] DATETIME DEFAULT GETDATE(),
    
    CONSTRAINT [PK_Merchants] PRIMARY KEY ([MerchantID])
);

-- =============================================
-- 2. جدول التصنيفات
-- =============================================
CREATE TABLE [dbo].[Categories] (
    [CategoryID] INT IDENTITY(1,1) NOT NULL,
    [CategoryName] NVARCHAR(100) NOT NULL,
    
    CONSTRAINT [PK_Categories] PRIMARY KEY ([CategoryID])
);

-- =============================================
-- 3. جدول منتجات التجار الكبار (المنتج الأصلي والكمية الحقيقية)
-- =============================================
CREATE TABLE [dbo].[Products] (
    [ProductID] INT IDENTITY(1,1) NOT NULL,
    [BigMerchantID] INT NOT NULL, -- FK إلى التجار
    [ProductName] NVARCHAR(200) NOT NULL,
    [Description] NVARCHAR(MAX) NULL,
    [Price] DECIMAL(10,2) NOT NULL, -- سعر التكلفة / الجملة الأساسي
    [StockQuantity] INT NOT NULL DEFAULT 0, -- الكمية الحقيقية لدى الكبير
    [CategoryID] INT NULL, -- FK إلى التصنيفات
    [IsActive] BIT DEFAULT 1,
    [CreatedAt] DATETIME DEFAULT GETDATE(),

    CONSTRAINT [PK_Products] PRIMARY KEY ([ProductID]),
    CONSTRAINT [FK_Products_BigMerchant] FOREIGN KEY ([BigMerchantID]) REFERENCES [dbo].[Merchants]([MerchantID]),
    CONSTRAINT [FK_Products_Categories] FOREIGN KEY ([CategoryID]) REFERENCES [dbo].[Categories]([CategoryID])
);

-- =============================================
-- 4. جدول تخصيص المنتجات للتجار الصغار (عرض البيع)
-- =============================================
CREATE TABLE [dbo].[SmallMerchantProducts] (
    [SmallMerchantProductID] INT IDENTITY(1,1) NOT NULL,
    [SmallMerchantID] INT NOT NULL, -- FK إلى التجار الصغار
    [ProductID] INT NOT NULL, -- FK إلى جدول المنتجات الأصلية
    [CustomPrice] DECIMAL(10,2) NOT NULL, -- السعر الخاص بالتاجر الصغير
    [DisplayStockQuantity] INT NULL, -- كمية مجتزأة يختار إظهارها (اختياري)
    [SaleType] NVARCHAR(20) NULL, -- قطاعي / جملة
    [IsActive] BIT DEFAULT 1,
    [CreatedAt] DATETIME DEFAULT GETDATE(),

    CONSTRAINT [PK_SmallMerchantProducts] PRIMARY KEY ([SmallMerchantProductID]),
    CONSTRAINT [FK_SmallMerchantProducts_Merchant] FOREIGN KEY ([SmallMerchantID]) REFERENCES [dbo].[Merchants]([MerchantID]),
    CONSTRAINT [FK_SmallMerchantProducts_Product] FOREIGN KEY ([ProductID]) REFERENCES [dbo].[Products]([ProductID]),
    
    -- منع تكرار نفس المنتج لنفس التاجر الصغير
    CONSTRAINT [UQ_SmallMerchant_Product] UNIQUE ([SmallMerchantID], [ProductID])
);