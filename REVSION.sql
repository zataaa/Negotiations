
/* لمجموعة 1 — Users & Identity
Users
UsersData
UsersRoles
Roles
UserSessions
AuthenticationLogs
AuditLogs
ابدأ بها لأنها أساس المستخدمين والصلاحيات  .*/


-- =============================================
-- Table: [dbo].[UsersData]
-- =============================================
CREATE TABLE [dbo].[UsersData] (
    [UserID] int NOT NULL,
    [FacebookAccount] nvarchar(200) NULL,
    [InstagramAccount] nvarchar(200) NULL,
    [TwitterAccount] nvarchar(200) NULL,
    [TikTokAccount] nvarchar(200) NULL,
    [LinkedInAccount] nvarchar(200) NULL,
    [Phone1] nvarchar(20) NULL,
    [Phone2] nvarchar(20) NULL,
    [Address] nvarchar(300) NULL,
    [CreatedAt] datetime NULL,
    [UpdatedAt] datetime NULL,
    [UserName] nvarchar(100) NOT NULL,
    [Email] nvarchar(200) NOT NULL,
    [PasswordHash] nvarchar(200) NOT NULL,
    [Gender] nvarchar(20) NULL,
    [Age] int NULL,
    [Region] nvarchar(100) NULL
);

-- =============================================
-- Table: [dbo].[Users]
-- =============================================
CREATE TABLE [dbo].[Users] (
    [UserID] int NOT NULL,
    [UserName] nvarchar(150) NOT NULL,
    [Email] nvarchar(200) NOT NULL,
    [PasswordHash] nvarchar(200) NOT NULL,
    [CreatedAt] datetime NULL,
    [Status] nvarchar(50) NULL,
    [Notes] nvarchar(250) NULL,
    [RoleID] int NULL
    
);


ALTER TABLE dbo.Users
    DROP COLUMN Gender;
  GO
  ALTER TABLE dbo.Users
    DROP COLUMN Age;
  GO
    
     ALTER TABLE dbo.Users
    DROP COLUMN Region;
  GO
   
   --UsersData
   ALTER TABLE dbo.UsersData
    DROP COLUMN RoleID;
  GO
   
   ALTER TABLE dbo.UsersData
    DROP COLUMN RoleID;
  GO

   ALTER TABLE dbo.UsersData
  ALTER COLUMN Gender nvarchar(20) NULL;

  ALTER TABLE dbo.UsersData
  ALTER COLUMN Age int NULL;

  ALTER TABLE dbo.UsersData
  ALTER COLUMN Region nvarchar(100) NULL;




-- =============================================
-- Table: [dbo].[Roles]
-- =============================================
CREATE TABLE [dbo].[Roles] (    [RoleID] int NOT NULL,    [RoleName] nvarchar(100) NOT NULL,    [Note] nvarchar(200) NULL,    [CreatedAt] datetime NULL,    [Description] nvarchar(255) NULL);

-- =============================================
-- Table: [dbo].[UsersRoles]
-- =============================================
CREATE TABLE [dbo].[UsersRoles] (    [UserID] int NOT NULL,    [RoleID] int NOT NULL);/* يبقوا كما هما Roles يعتبر وصف للأدوار التي و اسم الدور اما UsersRoles هي الاداة التي يمكن من خلالها بربط النظام بالادوار */-- =============================================
-- Table: [dbo].[UserSessions]
-- =============================================
CREATE TABLE [dbo].[UserSessions] (                 -- جلسات المستخدم    [SessionID] int NOT NULL,    [UserID] int NOT NULL,    [LoginTime] datetime NOT NULL,    [DeviceType] nvarchar(100) NOT NULL,    [Browser] nvarchar(100) NULL,    [IPAddress] nvarchar(50) NULL);/* FK_UserSessions_UserID	UserSessions.UserID→Users.UserID*//* UserSessions : هي وقت وجود المستخدم داخل النظام

واحب ان اضيف علية وقت ممارسة الاطلاع في اي موقع من مواقغ التجار بقي هناك
وكذلك وقت انتاء الجلسة لانهما يحددان مدي شغف المستخدم باجزاء الموقع */-- =============================================
-- Table: [dbo].[AuthenticationLogs]
-- =============================================
CREATE TABLE [dbo].[AuthenticationLogs] (     -- سجلات المصادقة    [LogID] int NOT NULL,    [UserID] int NOT NULL,    [LoginTime] datetime NOT NULL,    [IsSuccessful] bit NOT NULL,    [IPAddress] nvarchar(50) NULL);/* AuthenticationLogs    -سجلات المصادقة
هي سجل دخول المستخدم وو قت الدخول  و اذا كانت ناجة ام فاشلة ويجب ربطها ب PasswordHash و ذلك للأمان و حماية المستخدم */-- =============================================
-- Table: [dbo].[AuditLogs]
-- =============================================
CREATE TABLE [dbo].[AuditLogs] (           -- سجلات التدقيق    [LogID] int NOT NULL,    [EntityName] nvarchar(100) NOT NULL,    -- اسم الكيان    [EntityID] int NOT NULL,    [Action] nvarchar(50) NOT NULL,    [ActionBy] nvarchar(150) NOT NULL,    [ActionDate] datetime NULL,    [Notes] nvarchar(250) NULL);/* AuditLogs  سجلات التدقيق
اسم الكيان من اسمة يعني في اي دور سيدخل المستخدم ك تاجر او كمستخدم*//*PK__AuditLog__5E5499A8511E3B7B	PRIMARY KEY	AuditLogs / LogID	 <--- [PK] 	N/A (Self Primary Key)
PK__Authenti__5E5499A83A24E32A	PRIMARY KEY	AuthenticationLogs / LogID	 <--- [PK] 	N/A (Self Primary Key)
FK_AuthenticationLogs_UserID	FOREIGN KEY	AuthenticationLogs / UserID	 ---> [FK] 	Users / UserID
FK__Orders__Customer__08162EEB	FOREIGN KEY	Orders / CustomerID	 ---> [FK] 	Users / UserID
PK__Roles__8AFACE3AB9D45077	PRIMARY KEY	Roles / RoleID	 <--- [PK] 	N/A (Self Primary Key)
PK__Users__1788CCAC8D844323	PRIMARY KEY	Users / UserID	 <--- [PK] 	N/A (Self Primary Key)
FK_UsersData_UserID	FOREIGN KEY	UsersData / UserID	 ---> [FK] 	Users / UserID
PK__UsersDat__1788CCAC20F23B57	PRIMARY KEY	UsersData / UserID	 <--- [PK] 	N/A (Self Primary Key)
PK__UserSess__C9F4927098B594CD	PRIMARY KEY	UserSessions / SessionID	 <--- [PK] 	N/A (Self Primary Key)
FK_UserSessions_UserID	FOREIGN KEY	UserSessions / UserID	 ---> [FK] 	Users / UserID
FK_UsersRoles_Role	FOREIGN KEY	UsersRoles / RoleID	 ---> [FK] 	Roles / RoleID
PK__UsersRol__AF27604F8FBED2C5	PRIMARY KEY	UsersRoles / RoleID	 <--- [PK] 	N/A (Self Primary Key)
FK_UsersRoles_User	FOREIGN KEY	UsersRoles / UserID	 ---> [FK] 	Users / UserID
PK__UsersRol__AF27604F8FBED2C5	PRIMARY KEY	UsersRoles / UserID	 <--- [PK] 	N/A (Self Primary Key)*//* واطلب منك ان تنقض كلامي حيث في شك من عدم قلبليتهم للدمج و عموما الممارسة قد تتطلب اضافة عواميد اخري*//*---------------------------------------------------------------------------------------------------------------------*//* المجموعة 2 — Merchant & Product System لجداول الحالية:

Merchants
Products
Categories
MerchantProductMapping*/-- ====================================================================
-- 2.Unified Merchant Table(Unified Merchants Entity)
-- Covers all types of trade (manufacturing, importing, wholesale, retail, and mixed).
-- ====================================================================
CREATE TABLE [dbo].[Merchants] (
    [MerchantID] INT IDENTITY(1,1) PRIMARY KEY,
    [Name] NVARCHAR(200) NOT NULL,
    [MerchantLevel] NVARCHAR(20) NOT NULL 
    CHECK ([MerchantLevel] IN ('Big', 'Small')),
    [MerchantType] NVARCHAR(20) NOT NULL 
    CHECK ([MerchantType] IN ('Factory', 'Importer', 'Wholesale', 'Retail', 'Mixed')),
    [ContactInfo] NVARCHAR(300) NULL,
    [IsActive] BIT DEFAULT 1,
    [CreatedAt] DATETIME DEFAULT GETDATE()
);/**/-- ====================================================================
-- 3. جدول المنتجات الأصلية (Catalog / Master Products)
-- يعود ملكيته للتاجر المصنّع أو المستورد الأول للمنتج
-- ====================================================================
CREATE TABLE [dbo].[Products] (
    [ProductID] INT IDENTITY(1,1) PRIMARY KEY,
    [OwnerMerchantID] INT NOT NULL, -- FK: The merchant who owns or originally organizes the product
    [CategoryID] INT NULL,
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
);/**/-- ====================================================================
-- 1.Classification Table (Categories)
-- ====================================================================
CREATE TABLE [dbo].[Categories] (
    [CategoryID] INT IDENTITY(1,1) PRIMARY KEY,
    [CategoryName] NVARCHAR(100) NOT NULL,
    [CreatedAt] DATETIME DEFAULT GETDATE()
);
/**/-- ====================================================================
-- 4.Table of 4. Re-displaying and pricing products for merchants.(Merchant Product Mapping)
-- It allows any merchant to resell any product, provided the price, unit, and quantity are specified.
-- ====================================================================
CREATE TABLE [dbo].[MerchantProductMapping] (
    [MappingID] INT IDENTITY(1,1) PRIMARY KEY,
    [MerchantID] INT NOT NULL,    --The merchant offering the product for sale
    [ProductID] INT NOT NULL,     --The original product
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
/*---------------------------------------------------بدون نقاش----------------------------------------------------*//* المجموعة 3 — Commercial Transactions

هذه المجموعة يجب مراجعتها بعناية لأن عندك تصميم قديم وجديد قد يكونان متداخلين.

Transactions
TransactionItems
Orders
OrderDetails
Customers
CustomerProfile*/


-- ====================================================================
-- 5. TABLE of Operations and Commercial Transactions(Transactions / Orders Header)
-- ====================================================================
CREATE TABLE [dbo].[Transactions] (
    [TransactionID] INT IDENTITY(1,1) PRIMARY KEY,
    [SellerMerchantID] INT NOT NULL,  --The seller merchant (i.e., any merchant from the Table)Merchants)
    [BuyerMerchantID] INT NULL,       -- The buyer/merchant (in case B2B)
    
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
    [TransactionID] INT NOT NULL,
    [MappingID] INT NOT NULL,     -- Offer product at the seller's
    [ProductID] INT NOT NULL,     -- Original product (to deduct stock from the actual owner)
    
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

-- =============================================
-- Table: [dbo].[OrderDetails]
-- =============================================
CREATE TABLE [dbo].[OrderDetails] (    [OrderDetailID] int NOT NULL,    [OrderID] int NOT NULL,    [SmallMerchantProductID] int NOT NULL,    [Quantity] int NOT NULL,    [Price] decimal(18,2) NOT NULL,    [Subtotal] decimal(29,2) NULL);
-- =============================================
-- Table: [dbo].[Orders]
-- =============================================
CREATE TABLE [dbo].[Orders] (    [OrderID] int NOT NULL,    [CustomerID] int NOT NULL,    [SmallMerchantID] int NULL,    [Status] nvarchar(50) NULL,    [PaymentStatus] nvarchar(50) NULL,    [TotalAmount] decimal(18,2) NOT NULL,    [CreatedAt] datetime NULL); ALTER TABLE dbo.OrderDetails
    DROP COLUMN SmallMerchantProductID;
  GO  ALTER TABLE dbo.Orders
    DROP COLUMN SmallMerchantID;
  GO

FK__Invoices__OrderI__269AB60B	Invoices.OrderID→Orders.OrderID
FK__Orders__Customer__08162EEB	Orders.CustomerID→Users.UserID
FK__Payments__OrderI__0DCF0841	Payments.OrderID→Orders	OrderID
FK__Taxes__OrderID__2D47B39A	Taxes.OrderID→Orders.OrderID

/* لسهولة عرض الطلبيات يفضل ان يكونان في جدولين ام يمكن دمجهم*/

PK__Orders__C3905BAFA20A46DE	PRIMARY KEY
FK__Orders__Customer__08162EEB	FOREIGN KEY
PK__OrderDet__D3B9D30C780DA41D  PRIMARY KEY


-- =============================================
-- Table: [dbo].[CustomerProfile]
-- =============================================
CREATE TABLE [dbo].[CustomerProfile] (
    [ProfileID] int NOT NULL,
    [UserID] int NOT NULL,
    [Gender] nvarchar(10) NULL,
    [Age] int NULL,
    [Region] nvarchar(100) NULL,
    [CreatedAt] datetime NULL,
    [IncomeLevel] nvarchar(50) NULL,
    [Education] nvarchar(100) NULL,
    [MaritalStatus] nvarchar(20) NULL
);


-- =============================================
-- Table: [dbo].[Customers]
-- =============================================
CREATE TABLE [dbo].[Customers] (
    [CustomerID] int NOT NULL,
    [FullName] nvarchar(200) NULL,
    [Email] nvarchar(200) NULL,
    [Phone] nvarchar(50) NULL,
    [CreatedAt] datetime NULL
);
/* يمكن حذف الجدولين و اضافة مكوناتهما الي كل منهما الي ('UsersData','Users')*/
/*
PK__Customer__290C8884FC02F372	PRIMARY KEY	CustomerProfile / ProfileID	 <--- [PK] 	N/A (Self Primary Key)
PK__Customer__A4AE64B8ED906246	PRIMARY KEY	Customers / CustomerID	 <--- [PK] 	N/A (Self Primary Key)
FK__Invoices__OrderI__269AB60B	FOREIGN KEY	Invoices / OrderID	 ---> [FK] 	Orders / OrderID
PK__OrderDet__D3B9D30C780DA41D	PRIMARY KEY	OrderDetails / OrderDetailID	 <--- [PK] 	N/A (Self Primary Key)
FK__Orders__Customer__08162EEB	FOREIGN KEY	Orders / CustomerID	 ---> [FK] 	Users / UserID
PK__Orders__C3905BAFA20A46DE	PRIMARY KEY	Orders / OrderID	 <--- [PK] 	N/A (Self Primary Key)
FK__Payments__OrderI__0DCF0841	FOREIGN KEY	Payments / OrderID	 ---> [FK] 	Orders / OrderID
FK__Taxes__OrderID__2D47B39A	FOREIGN KEY	Taxes / OrderID	 ---> [FK] 	Orders / OrderID*/

/*-----------------------------------------------------------------------------------------------------*/

/*
المجموعة 4 — Payments & Financial System
Payments
Refunds
Invoices
Taxes
CashOnDelivery
DigitalWallets
WalletTransactions
Ledger

عددها: 8 */

-- =============================================
-- Table: [dbo].[Payments]
-- =============================================
CREATE TABLE [dbo].[Payments] (    [PaymentID] int NOT NULL,    [OrderID] int NOT NULL,    [MerchantType] nvarchar(50) NOT NULL,--------------------قارن---------------------------    [MerchantID] int NOT NULL,-------------------------------قارن---------------------    [Amount] decimal(18,2) NOT NULL,    [Status] nvarchar(50) NULL,    [PaymentDate] datetime NULL,    [ReleaseDate] datetime NULL,    [CreatedAt] datetime NULL);-- =============================================
-- Table: [dbo].[Refunds]
-- =============================================
CREATE TABLE [dbo].[Refunds] (    [RefundID] int NOT NULL,    [PaymentID] int NOT NULL,    [RefundAmount] decimal(18,2) NOT NULL,    [RefundDate] datetime NULL,    [Reason] nvarchar(250) NULL);-- =============================================
-- Table: [dbo].[Invoices]
-- =============================================
CREATE TABLE [dbo].[Invoices] (    [InvoiceID] int NOT NULL,    [OrderID] int NOT NULL,    [InvoiceNumber] nvarchar(50) NOT NULL,    [IssueDate] datetime NULL,    [DueDate] datetime NULL,    [Amount] decimal(18,2) NOT NULL,    [Status] nvarchar(50) NULL);-- =============================================
-- Table: [dbo].[Taxes]
-- =============================================
CREATE TABLE [dbo].[Taxes] (    [TaxID] int NOT NULL,    [OrderID] int NOT NULL,    [TaxRate] decimal(5,2) NOT NULL,    [TaxAmount] decimal(18,2) NOT NULL,    [TaxDate] datetime NULL);-- =============================================
-- Table: [dbo].[CashOnDelivery]
-- =============================================
CREATE TABLE [dbo].[CashOnDelivery] (    [CODID] int NOT NULL,    [PaymentID] int NULL,    [DeliveryAddress] nvarchar(250) NOT NULL,    [DeliveryDate] datetime NULL,    [IsPaid] bit NULL,    [OrderID] int NOT NULL);-- =============================================
-- Table: [dbo].[DigitalWallets]
-- =============================================
CREATE TABLE [dbo].[DigitalWallets] (    [WalletID] int NOT NULL,    [UserID] int NOT NULL,    [Balance] decimal(15,2) NULL,    [Status] nvarchar(50) NULL,    [CreatedAt] datetime NULL);-- =============================================
-- Table: [dbo].[WalletTransactions]
-- =============================================
CREATE TABLE [dbo].[WalletTransactions] (    [TransactionID] int NOT NULL,    [WalletID] int NOT NULL,    [TransactionType] nvarchar(50) NULL,    [Amount] decimal(15,2) NOT NULL,    [TransactionDate] datetime NULL);-- =============================================
-- Table: [dbo].[Ledger]
-- =============================================
CREATE TABLE [dbo].[Ledger] (    [LedgerID] int NOT NULL,    [TransactionType] nvarchar(50) NOT NULL,    [ReferenceID] int NOT NULL,    [Amount] decimal(18,2) NOT NULL,    [DebitCredit] nvarchar(10) NOT NULL,    [TransactionDate] datetime NULL,    [Notes] nvarchar(250) NULL);/* RELATIONS *//*PK__CashOnDe__F256EBBFFFBB764F	PRIMARY KEY	CashOnDelivery / CODID	 <--- [PK] 	N/A (Self Primary Key)
PK__DigitalW__84D4F92E0B864BFD	PRIMARY KEY	DigitalWallets / WalletID	 <--- [PK] 	N/A (Self Primary Key)
PK__Invoices__D796AAD54DC75255	PRIMARY KEY	Invoices / InvoiceID	 <--- [PK] 	N/A (Self Primary Key)
FK__Invoices__OrderI__269AB60B	FOREIGN KEY	Invoices / OrderID	 ---> [FK] 	Orders / OrderID
PK__Ledger__AE70E0AF490499BC	PRIMARY KEY	Ledger / LedgerID	 <--- [PK] 	N/A (Self Primary Key)
FK__Payments__OrderI__0DCF0841	FOREIGN KEY	Payments / OrderID	 ---> [FK] 	Orders / OrderID
PK__Payments__9B556A584A65337D	PRIMARY KEY	Payments / PaymentID	 <--- [PK] 	N/A (Self Primary Key)
FK__Refunds__Payment__2A6B46EF	FOREIGN KEY	Refunds / PaymentID	 ---> [FK] 	Payments / PaymentID*/
/*
'Payments',
'Refunds',
'Invoices',
'Taxes',
'CashOnDelivery',
'DigitalWallets',
'WalletTransactions',
'Ledger'
*/

/* لا اري اي تغيير فيهم الا ان الممارسة قد تجعلنا نزيد من عدد العواميد لأهميتهم في النظام
ما ريك؟
شكرا ل GEMINI فقد اعطاني هذا الكود ولكن ما معني (Self Primary Key) 
هل يعني عدم تكرار القيد في الجدول فقط و ليس مرتبط ب FK خارجي ؟ */
/*---------------------------------------------------------------------------------------------------------------*/
/*
المجموعة 5 — Reports & Analytics
Reports
ReportRuns
ReportLogs
ForecastingReports
ForecastingHistory*/

-- =============================================
-- Table: [dbo].[ReportLogs]
-- =============================================
CREATE TABLE [dbo].[ReportLogs] (    [LogID] int NOT NULL,    [ReportID] int NOT NULL,    [Action] nvarchar(100) NULL,-- ما معناها    [ActionDate] datetime NULL);
-- =============================================
-- Table: [dbo].[ReportRuns]
-- =============================================
CREATE TABLE [dbo].[ReportRuns] (    [RunID] int NOT NULL,-- ما معناها    [ReportID] int NOT NULL,    [RunDate] datetime NULL,    [GeneratedBy] int NOT NULL);
-- =============================================
-- Table: [dbo].[Reports]
-- =============================================
CREATE TABLE [dbo].[Reports] (    [ReportID] int NOT NULL,    [ReportName] nvarchar(150) NOT NULL,    [ReportType] nvarchar(50) NOT NULL,    [CreatedBy] int NOT NULL,    [CreatedAt] datetime NULL,    [Status] nvarchar(50) NULL);

-- =============================================
-- Table: [dbo].[ForecastingHistory]
-- =============================================
CREATE TABLE [dbo].[ForecastingHistory] (    [HistoryID] int NOT NULL,-- ما معناها    [ForecastID] int NOT NULL,    [ActualValue] decimal(18,2) NOT NULL,-- ما معناها    [ComparisonDate] datetime NOT NULL,-- ما معناها    [CreatedAt] datetime NULL);
-- =============================================
-- Table: [dbo].[ForecastingReports]
-- =============================================
CREATE TABLE [dbo].[ForecastingReports] (    [ForecastID] int NOT NULL,    [ProductID] int NULL,    [ForecastType] nvarchar(100) NOT NULL,    [ForecastPeriod] nvarchar(50) NOT NULL,    [ForecastDate] datetime NOT NULL,    [ExpectedValue] decimal(18,2) NOT NULL,    [CreatedAt] datetime NULL);
/*
FK_ForecastingHistory_ForecastingReports	FOREIGN KEY	ForecastingHistory / ForecastID	 ---> [FK] 	ForecastingReports / ForecastID
PK__Forecast__4D7B4ADD5057FBEB	PRIMARY KEY	ForecastingHistory / HistoryID	 <--- [PK] 	N/A (Self Primary Key)
PK__Forecast__7F2744588F0B1B4D	PRIMARY KEY	ForecastingReports / ForecastID	 <--- [PK] 	N/A (Self Primary Key)
PK__ReportLo__5E5499A853E0F2E6	PRIMARY KEY	ReportLogs / LogID	 <--- [PK] 	N/A (Self Primary Key)
FK__ReportLog__Repor__76EBA2E9	FOREIGN KEY	ReportLogs / ReportID	 ---> [FK] 	Reports / ReportID
FK__ReportRun__Repor__7226EDCC	FOREIGN KEY	ReportRuns / ReportID	 ---> [FK] 	Reports / ReportID
PK__ReportRu__A259D53D21C74F0E	PRIMARY KEY	ReportRuns / RunID	 <--- [PK] 	N/A (Self Primary Key)
PK__Reports__D5BD48E528D5775C	PRIMARY KEY	Reports / ReportID	 <--- [PK] 	N/A (Self Primary Key)*/

/* لا اري اي تغيير فيهم الا ان الممارسة قد تجعلنا نزيد من عدد العواميد لأهميتهم في النظام
 و لكن اريد رأيك */

 /*-----------------------------------------------------------------------------------------*/

 /*
 المجموعة 6 — Support & Ticketing
SupportTickets
TicketCategories
TicketLogs

عددها: 3 */

-- =============================================
-- Table: [dbo].[SupportTickets]
-- =============================================
CREATE TABLE [dbo].[SupportTickets] (    [TicketID] int NOT NULL,    [Title] nvarchar(200) NOT NULL,    [Description] nvarchar(500) NULL,    [CategoryID] int NOT NULL,    [Status] nvarchar(50) NULL,    [OpenedBy] int NOT NULL,    [AssignedTo] int NULL,    [OpenedAt] datetime NULL,    [ClosedAt] datetime NULL);

-- =============================================
-- Table: [dbo].[TicketCategories]
-- =============================================
CREATE TABLE [dbo].[TicketCategories] (    [CategoryID] int NOT NULL,    [CategoryName] nvarchar(100) NOT NULL,    [Description] nvarchar(250) NULL);
-- =============================================
-- Table: [dbo].[TicketLogs]
-- =============================================
CREATE TABLE [dbo].[TicketLogs] (    [LogID] int NOT NULL,    [TicketID] int NOT NULL,    [Action] nvarchar(200) NULL,    [ActionDate] datetime NULL,    [ActionBy] int NOT NULL);

/*
FK__SupportTi__Categ__308E3499	FOREIGN KEY	SupportTickets / CategoryID	 ---> [FK] 	TicketCategories / CategoryID
PK__SupportT__712CC627E3C92A30	PRIMARY KEY	SupportTickets / TicketID	 <--- [PK] 	N/A (Self Primary Key)
PK__TicketCa__19093A2B9975A460	PRIMARY KEY	TicketCategories / CategoryID	 <--- [PK] 	N/A (Self Primary Key)
PK__TicketLo__5E5499A8EDF96B9D	PRIMARY KEY	TicketLogs / LogID	 <--- [PK] 	N/A (Self Primary Key)
FK__TicketLog__Ticke__36470DEF	FOREIGN KEY	TicketLogs / TicketID	 ---> [FK] 	SupportTickets / TicketID*/

/* لا اري اي تغيير فيهم الا ان الممارسة قد تجعلنا نزيد من عدد العواميد لأهميتهم في النظام
 و لكن اريد رأيك */
 /*------------------------------------------------------------------------------------------*/

 /*
 المجموعة 7 — Incident & Problem Management
IncidentTypes
IncidentReports
ProblemCatalog
ProblemRecords
ProblemLogs

عددها: 5 */
-- =============================================
-- Table: [dbo].[IncidentTypes]
-- =============================================
CREATE TABLE [dbo].[IncidentTypes] (    [TypeID] int NOT NULL,    [TypeName] nvarchar(100) NOT NULL,    [Description] nvarchar(250) NULL);

-- =============================================
-- Table: [dbo].[IncidentReports]
-- =============================================
CREATE TABLE [dbo].[IncidentReports] (    [IncidentID] int NOT NULL,    [Title] nvarchar(200) NOT NULL,    [Description] nvarchar(500) NULL,    [TypeID] int NOT NULL,    [Status] nvarchar(50) NULL,    [ReportedBy] int NOT NULL,    [AssignedTo] int NULL,    [ReportedAt] datetime NULL,    [ResolvedAt] datetime NULL);

-- =============================================
-- Table: [dbo].[ProblemCatalog]
-- =============================================
CREATE TABLE [dbo].[ProblemCatalog] (    [ProblemID] int NOT NULL,    [Title] nvarchar(200) NOT NULL,    [Description] nvarchar(500) NULL,    [Category] nvarchar(100) NULL,    [Status] nvarchar(50) NULL,    [CreatedAt] datetime NULL,    [CreatedBy] int NOT NULL);

-- =============================================
-- Table: [dbo].[ProblemRecords]
-- =============================================
CREATE TABLE [dbo].[ProblemRecords] (    [RecordID] int NOT NULL,    [ProblemID] int NOT NULL,    [RelatedIncidentID] int NULL,    [ActionTaken] nvarchar(250) NULL,    [ActionDate] datetime NULL,    [ActionBy] int NOT NULL);
-- =============================================
-- Table: [dbo].[ProblemLogs]
-- =============================================
CREATE TABLE [dbo].[ProblemLogs] (    [LogID] int NOT NULL,    [ProblemID] int NOT NULL,    [LogDescription] nvarchar(500) NULL,    [LogDate] datetime NULL,    [LoggedBy] int NOT NULL);

/* PK__Incident__3D80539235208CFB	PRIMARY KEY	IncidentReports / IncidentID	 <--- [PK] 	N/A (Self Primary Key)
FK__IncidentR__TypeI__251C81ED	FOREIGN KEY	IncidentReports / TypeID	 ---> [FK] 	IncidentTypes / TypeID
PK__Incident__516F03959377C4B8	PRIMARY KEY	IncidentTypes / TypeID	 <--- [PK] 	N/A (Self Primary Key)
PK__ProblemC__5CED516A100B1636	PRIMARY KEY	ProblemCatalog / ProblemID	 <--- [PK] 	N/A (Self Primary Key)
PK__ProblemL__5E5499A80C2FFB07	PRIMARY KEY	ProblemLogs / LogID	 <--- [PK] 	N/A (Self Primary Key)
FK__ProblemLo__Probl__69C6B1F5	FOREIGN KEY	ProblemLogs / ProblemID	 ---> [FK] 	ProblemCatalog / ProblemID
FK__ProblemRe__Probl__54CB950F	FOREIGN KEY	ProblemRecords / ProblemID	 ---> [FK] 	ProblemCatalog / ProblemID
PK__ProblemR__FBDF78C928604353	PRIMARY KEY	ProblemRecords / RecordID	 <--- [PK] 	N/A (Self Primary Key)
FK__ProblemRe__Relat__55BFB948	FOREIGN KEY	ProblemRecords / RelatedIncidentID	 ---> [FK] 	IncidentReports / IncidentID*/

/* لا اري اي تغيير فيهم الا ان الممارسة قد تجعلنا نزيد من عدد العواميد لأهميتهم في النظام
 و لكن اريد رأيك */

 /*----------------------------------------------------------------------------------------------------*/

 /* المجموعة 8 — Availability Monitoring
AvailabilityTargets
AvailabilityRecords
AvailabilityLogs

عددها: 3 */

-- =============================================
-- Table: [dbo].[AvailabilityLogs]
-- =============================================
CREATE TABLE [dbo].[AvailabilityLogs] (    [LogID] int NOT NULL,    [RecordID] int NOT NULL,    [IncidentDescription] nvarchar(500) NULL,    [LogDate] datetime NULL,    [LoggedBy] int NOT NULL);
-- =============================================
-- Table: [dbo].[AvailabilityRecords]
-- =============================================
CREATE TABLE [dbo].[AvailabilityRecords] (    [RecordID] int NOT NULL,    [TargetID] int NOT NULL,    [ActualUptime] decimal(5,2) NULL,    [DowntimeMinutes] int NULL,    [Status] nvarchar(50) NULL,    [RecordedAt] datetime NULL);
-- =============================================
-- Table: [dbo].[AvailabilityTargets]
-- =============================================
CREATE TABLE [dbo].[AvailabilityTargets] (    [TargetID] int NOT NULL,    [SystemName] nvarchar(150) NOT NULL,    [TargetUptime] decimal(5,2) NOT NULL,    [Period] nvarchar(50) NULL,    [CreatedAt] datetime NULL);/*
PK__Availabi__5E5499A8D9BDEC7B	PRIMARY KEY	AvailabilityLogs / LogID	 <--- [PK] 	N/A (Self Primary Key)
FK__Availabil__Recor__1E3A7A34	FOREIGN KEY	AvailabilityLogs / RecordID	 ---> [FK] 	AvailabilityRecords / RecordID
PK__Availabi__FBDF78C90D23DA6F	PRIMARY KEY	AvailabilityRecords / RecordID	 <--- [PK] 	N/A (Self Primary Key)
FK__Availabil__Targe__1A69E950	FOREIGN KEY	AvailabilityRecords / TargetID	 ---> [FK] 	AvailabilityTargets / TargetID
PK__Availabi__2B1F0FB613731466	PRIMARY KEY	AvailabilityTargets / TargetID	 <--- [PK] 	N/A (Self Primary Key)*/

/* لا اري اي تغيير فيهم الا ان الممارسة قد تجعلنا نزيد من عدد العواميد لأهميتهم في النظام
 و لكن اريد رأيك */
/*---------------------------------------------------------------------------------------------------------------------*/

-- =============================================
-- Table: [dbo].[CapacityLogs]
-- =============================================
CREATE TABLE [dbo].[CapacityLogs] (    [LogID] int NOT NULL,    [RecordID] int NOT NULL,    [Action] nvarchar(200) NULL,    [ActionDate] datetime NULL,    [ActionBy] int NOT NULL);
-- =============================================
-- Table: [dbo].[CapacityRecords]
-- =============================================
CREATE TABLE [dbo].[CapacityRecords] (    [RecordID] int NOT NULL,    [TargetID] int NOT NULL,    [ActualUsage] decimal(10,2) NOT NULL,    [Status] nvarchar(50) NULL,    [RecordedAt] datetime NULL);
-- =============================================
-- Table: [dbo].[CapacityTargets]
-- =============================================
CREATE TABLE [dbo].[CapacityTargets] (    [TargetID] int NOT NULL,    [ResourceType] nvarchar(50) NOT NULL,    [TargetUsage] decimal(10,2) NOT NULL,    [Period] nvarchar(50) NULL,    [CreatedAt] datetime NULL);
/*
PK__Capacity__5E5499A8369603CB	PRIMARY KEY	CapacityLogs / LogID	 <--- [PK] 	N/A (Self Primary Key)
FK__CapacityL__Recor__30592A6F	FOREIGN KEY	CapacityLogs / RecordID	 ---> [FK] 	CapacityRecords / RecordID
PK__Capacity__FBDF78C94135708F	PRIMARY KEY	CapacityRecords / RecordID	 <--- [PK] 	N/A (Self Primary Key)
FK__CapacityR__Targe__2C88998B	FOREIGN KEY	CapacityRecords / TargetID	 ---> [FK] 	CapacityTargets / TargetID
PK__Capacity__2B1F0FB6DFA21F40	PRIMARY KEY	CapacityTargets / TargetID	 <--- [PK] 	N/A (Self Primary Key)*/

/* لا اري اي تغيير فيهم الا ان الممارسة قد تجعلنا نزيد من عدد العواميد لأهميتهم في النظام
 و لكن اريد رأيك */
/*----------------------------------------------------------------------------------------------------------*/
/*
المجموعة 10 — Change & Configuration Management
ChangeRequests
ChangeApprovals
ChangeLogs
ConfigItems
ConfigChanges
ConfigLogs

عددها: 6 */


-- =============================================
-- Table: [dbo].[ChangeApprovals]
-- =============================================
CREATE TABLE [dbo].[ChangeApprovals] (    [ApprovalID] int NOT NULL,    [RequestID] int NOT NULL,    [ApprovedBy] int NOT NULL,    [ApprovalStatus] nvarchar(50) NOT NULL,    [Notes] nvarchar(500) NULL,    [ApprovedAt] datetime NULL);
-- =============================================
-- Table: [dbo].[ChangeLogs]
-- =============================================
CREATE TABLE [dbo].[ChangeLogs] (    [LogID] int NOT NULL,    [RequestID] int NOT NULL,    [Action] nvarchar(200) NULL,    [ActionDate] datetime NULL,    [ActionBy] int NOT NULL);
-- =============================================
-- Table: [dbo].[ChangeRequests]
-- =============================================
CREATE TABLE [dbo].[ChangeRequests] (    [RequestID] int NOT NULL,    [Title] nvarchar(200) NOT NULL,    [Description] nvarchar(500) NULL,    [Priority] nvarchar(20) NULL,    [Status] nvarchar(50) NULL,    [RequestedBy] int NOT NULL,    [RequestedAt] datetime NULL);
-- =============================================
-- Table: [dbo].[ConfigChanges]
-- =============================================
CREATE TABLE [dbo].[ConfigChanges] (    [ChangeID] int NOT NULL,    [ConfigID] int NOT NULL,    [ChangeDescription] nvarchar(500) NULL,    [ChangedBy] int NOT NULL,    [ChangeDate] datetime NULL);
-- =============================================
-- Table: [dbo].[ConfigItems]
-- =============================================
CREATE TABLE [dbo].[ConfigItems] (    [ConfigID] int NOT NULL,    [ItemName] nvarchar(150) NOT NULL,    [ItemType] nvarchar(100) NULL,    [Status] nvarchar(50) NULL,    [Owner] nvarchar(150) NULL,    [CreatedAt] datetime NULL);
-- =============================================
-- Table: [dbo].[ConfigLogs]
-- =============================================
CREATE TABLE [dbo].[ConfigLogs] (    [LogID] int NOT NULL,    [ConfigID] int NOT NULL,    [Action] nvarchar(200) NULL,    [ActionDate] datetime NULL,    [ActionBy] int NOT NULL);

/*
PK__ChangeAp__328477D46C5B3FDB	PRIMARY KEY	ChangeApprovals / ApprovalID	 <--- [PK] 	N/A (Self Primary Key)
FK__ChangeApp__Reque__43A1090D	FOREIGN KEY	ChangeApprovals / RequestID	 ---> [FK] 	ChangeRequests / RequestID
PK__ChangeLo__5E5499A8DED22EBC	PRIMARY KEY	ChangeLogs / LogID	 <--- [PK] 	N/A (Self Primary Key)
FK__ChangeLog__Reque__4865BE2A	FOREIGN KEY	ChangeLogs / RequestID	 ---> [FK] 	ChangeRequests / RequestID
PK__ChangeRe__33A8519A3141D421	PRIMARY KEY	ChangeRequests / RequestID	 <--- [PK] 	N/A (Self Primary Key)
PK__ConfigCh__0E05C5B75CA6BB9A	PRIMARY KEY	ConfigChanges / ChangeID	 <--- [PK] 	N/A (Self Primary Key)
FK__ConfigCha__Confi__762C88DA	FOREIGN KEY	ConfigChanges / ConfigID	 ---> [FK] 	ConfigItems / ConfigID
PK__ConfigIt__C3BC333C08542607	PRIMARY KEY	ConfigItems / ConfigID	 <--- [PK] 	N/A (Self Primary Key)
FK__ConfigLog__Confi__7AF13DF7	FOREIGN KEY	ConfigLogs / ConfigID	 ---> [FK] 	ConfigItems / ConfigID*/

/* لا اري اي تغيير فيهم الا ان الممارسة قد تجعلنا نزيد من عدد العواميد لأهميتهم في النظام
 و لكن اريد رأيك */
/*------------------------------------------------------------------------------------------------------*/

/*
لمجموعة 11 — Continuity & Business Recovery
ContinuityPlans
ContinuityLogs
ContinuityTests

عددها: 3 */

-- =============================================
-- Table: [dbo].[ContinuityLogs]
-- =============================================
CREATE TABLE [dbo].[ContinuityLogs] (    [LogID] int NOT NULL,    [PlanID] int NOT NULL,    [Action] nvarchar(200) NULL,    [ActionDate] datetime NULL,    [ActionBy] nvarchar(150) NULL);
-- =============================================
-- Table: [dbo].[ContinuityPlans]
-- =============================================
CREATE TABLE [dbo].[ContinuityPlans] (    [PlanID] int NOT NULL,    [PlanName] nvarchar(150) NOT NULL,    [Description] nvarchar(500) NULL,    [Status] nvarchar(50) NULL,    [Owner] nvarchar(150) NULL,    [CreatedAt] datetime NULL);
-- =============================================
-- Table: [dbo].[ContinuityTests]
-- =============================================
CREATE TABLE [dbo].[ContinuityTests] (    [TestID] int NOT NULL,    [PlanID] int NOT NULL,    [Scenario] nvarchar(100) NULL,    [TestStatus] nvarchar(50) NULL,    [TestedBy] nvarchar(150) NULL,    [TestDate] datetime NULL);

/*
PK__Continui__5E5499A896D3F35F	PRIMARY KEY	ContinuityLogs / LogID	 <--- [PK] 	N/A (Self Primary Key)
FK__Continuit__PlanI__4277DAAA	FOREIGN KEY	ContinuityLogs / PlanID	 ---> [FK] 	ContinuityPlans / PlanID
PK__Continui__755C22D71A22CECD	PRIMARY KEY	ContinuityPlans / PlanID	 <--- [PK] 	N/A (Self Primary Key)
FK__Continuit__PlanI__3DB3258D	FOREIGN KEY	ContinuityTests / PlanID	 ---> [FK] 	ContinuityPlans / PlanID
PK__Continui__8CC331000DFEB1A5	PRIMARY KEY	ContinuityTests / TestID	 <--- [PK] 	N/A (Self Primary Key)*/

/* لا اري اي تغيير فيهم الا ان الممارسة قد تجعلنا نزيد من عدد العواميد لأهميتهم في النظام
 و لكن اريد رأيك */
/*--------------------------------------------------------------------------------------------------------------*/

/*
المجموعة 12 — Release Management
Releases
ReleaseDeployments
ReleaseLogs

عددها: 3
*/

-- =============================================
-- Table: [dbo].[ReleaseDeployments]
-- =============================================
CREATE TABLE [dbo].[ReleaseDeployments] (    [DeploymentID] int NOT NULL,    [ReleaseID] int NOT NULL,    [Environment] nvarchar(50) NOT NULL,    [DeploymentStatus] nvarchar(50) NULL,    [DeployedBy] nvarchar(150) NULL,    [DeploymentNotes] nvarchar(500) NULL,    [DeployedAt] datetime NULL);
-- =============================================
-- Table: [dbo].[ReleaseLogs]
-- =============================================
CREATE TABLE [dbo].[ReleaseLogs] (    [LogID] int NOT NULL,    [ReleaseID] int NOT NULL,    [Action] nvarchar(200) NULL,    [ActionDate] datetime NULL,    [ActionBy] nvarchar(150) NULL);
-- =============================================
-- Table: [dbo].[Releases]
-- =============================================
CREATE TABLE [dbo].[Releases] (    [ReleaseID] int NOT NULL,    [ReleaseName] nvarchar(150) NOT NULL,    [PlannedDate] date NOT NULL,    [Status] nvarchar(50) NULL,    [ReleaseManager] nvarchar(150) NULL,    [Notes] nvarchar(500) NULL,    [CreatedAt] datetime NULL);

/*PK__ReleaseD__5EF8D717DDB6A8F2	PRIMARY KEY	ReleaseDeployments / DeploymentID	 <--- [PK] 	N/A (Self Primary Key)
FK__ReleaseDe__Relea__093F5D4E	FOREIGN KEY	ReleaseDeployments / ReleaseID	 ---> [FK] 	Releases / ReleaseID
PK__ReleaseL__5E5499A89DA714FD	PRIMARY KEY	ReleaseLogs / LogID	 <--- [PK] 	N/A (Self Primary Key)
FK__ReleaseLo__Relea__0D0FEE32	FOREIGN KEY	ReleaseLogs / ReleaseID	 ---> [FK] 	Releases / ReleaseID
PK__Releases__5D7A69ED4C2ED9F6	PRIMARY KEY	Releases / ReleaseID	 <--- [PK] 	N/A (Self Primary Key)*/

/* لا اري اي تغيير فيهم الا ان الممارسة قد تجعلنا نزيد من عدد العواميد لأهميتهم في النظام
 و لكن اريد رأيك */
/*--------------------------------------------------------------------------------------------------------------*/

/*
المجموعة 13 — Other / تحتاج مراجعة منفصلة
Shipping
SymbolsColors


عددها: 2 */

-- =============================================
-- Table: [dbo].[Shipping]
-- =============================================
CREATE TABLE [dbo].[Shipping] (    [ShippingID] int NOT NULL,    [OrderID] int NOT NULL,    [CompanyName] nvarchar(150) NOT NULL,    [TrackingNumber] nvarchar(100) NOT NULL,    [Status] nvarchar(50) NOT NULL,    [ShipmentDate] datetime NULL,    [DeliveryDate] datetime NULL,    [CreatedAt] datetime NULL);-- =============================================
-- Table: [dbo].[SymbolsColors]
-- =============================================
CREATE TABLE [dbo].[SymbolsColors] (    [Id] int NOT NULL,    [Symbol] nvarchar(10) NOT NULL,    [Meaning] nvarchar(100) NOT NULL,    [Category] nvarchar(50) NULL);

DROP TABLE SymbolsColors;
DROP TABLE Shipping;

/*
PK__Shipping__5FACD460CA9BC227	PRIMARY KEY	Shipping / ShippingID	 <--- [PK] 	N/A (Self Primary Key)
PK__SymbolsC__3214EC075326CC54	PRIMARY KEY	SymbolsColors / Id	 <--- [PK] 	N/A (Self Primary Key)*/

/* المقصود ب Shipping هو الشحن للمستخدمين و لكن كما قلنا سنتعاقد مع شركة شحن تتولي استلام المنتج وشحنة الي العملاء و 
 جداول سنضيفها لاحقا سنحتاج هنا عدة 
 /*-----------------------------------------------------------------------------------------------*/





