FK_DigitalWallets_Users	DigitalWallets.UserID	Users.UserID
FK_Merchants_Transactions	Merchants.TransactionID	Transactions.TransactionID
FK_MT_Transaction	MerchantTransactions.TransactionID	Transactions.TransactionID
FK_WalletTransactions_DigitalWallets	WalletTransactions.WalletID	DigitalWallets.WalletID
FK_WalletTransactions_Transactions	WalletTransactions.TransactionID	Transactions.TransactionID


PK__DigitalW__84D4F92E0B864BFD	PRIMARY KEY	DigitalWallets.WalletID	 <--- [PK] 	N/A (Self Primary Key)
PK__Transact__55433A4B7F4D0E55	PRIMARY KEY	Transactions.TransactionID	 <--- [PK] 	N/A (Self Primary Key)
PK__Users__1788CCAC8D844323	PRIMARY KEY	Users.UserID	 <--- [PK] 	N/A (Self Primary Key)

-- =============================================
-- Table: [dbo].[DigitalWallets]
-- =============================================
CREATE TABLE [dbo].[DigitalWallets] (
    [WalletID] int NOT NULL,
    [UserID] int NOT NULL,
    [Balance] decimal(15,2) NULL,
    [Status] nvarchar(50) NULL,
    [CreatedAt] datetime NULL
);

-- =============================================
-- Table: [dbo].[MerchantTransactions]
-- =============================================
CREATE TABLE [dbo].[MerchantTransactions] (
    [TransactionID] int NOT NULL,
    [MerchantID] int NOT NULL,
    [Role] nvarchar(10) NOT NULL
);

-- =============================================
-- Table: [dbo].[WalletTransactions]---OK
-- =============================================
CREATE TABLE [dbo].[WalletTransactions] (
    [TransactionID] int NOT NULL,
    [WalletID] int NOT NULL,
    [UserID] int NOT NULL,
    [TransactionType] nvarchar(50) NULL,
    [Amount] decimal(15,2) NOT NULL,
    [TransactionDate] datetime NULL
);


-- =============================================
-- Table: [dbo].[Transactions]
-- =============================================
CREATE TABLE [dbo].[Transactions] (
    [TransactionID] int NOT NULL,
    [SellerMerchantID] int NULL,
    [BuyerMerchantID] int NULL,
    [GuestCustomerName] nvarchar(150) NULL,
    [GuestCustomerPhone] varchar(20) NULL,
    [TransactionType] nvarchar(20) NOT NULL,
    [TotalAmount] decimal(10,2) NOT NULL,
    [Status] nvarchar(20) NOT NULL,
    [TransactionDate] datetime NULL
);
-- =============================================
-- Table: [dbo].[Merchants]
-- =============================================
CREATE TABLE [dbo].[Merchants] (
    [MerchantID] int NOT NULL,
    [Name] nvarchar(200) NOT NULL,
    [MerchantLevel] nvarchar(20) NOT NULL,
    [MerchantType] nvarchar(20) NOT NULL,
    [ContactInfo] nvarchar(300) NULL,
    [IsActive] bit NOT NULL,
    [CreatedAt] datetime NULL,
    [SellerMerchantID] int NULL,
    [BuyerMerchantID] int NULL,
    [TransactionID] int NULL
);