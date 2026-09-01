-- =============================================
-- Table: [dbo].[AuditLogs]
-- =============================================
CREATE TABLE [dbo].[AuditLogs] (
    [LogID] int NOT NULL,
    [EntityName] nvarchar(100) NOT NULL,
    [EntityID] int NOT NULL,
    [Action] nvarchar(50) NOT NULL,
    [ActionBy] nvarchar(150) NOT NULL,
    [ActionDate] datetime NULL,
    [Notes] nvarchar(250) NULL
);


-- =============================================
-- Table: [dbo].[AuthenticationLogs]
-- =============================================
CREATE TABLE [dbo].[AuthenticationLogs] (
    [LogID] int NOT NULL,
    [UserID] int NOT NULL,
    [LoginTime] datetime NOT NULL,
    [IsSuccessful] bit NOT NULL,
    [IPAddress] nvarchar(50) NULL
);


-- =============================================
-- Table: [dbo].[AvailabilityLogs]
-- =============================================
CREATE TABLE [dbo].[AvailabilityLogs] (
    [LogID] int NOT NULL,
    [RecordID] int NOT NULL,
    [IncidentDescription] nvarchar(500) NULL,
    [LogDate] datetime NULL,
    [LoggedBy] int NOT NULL
);


-- =============================================
-- Table: [dbo].[AvailabilityRecords]
-- =============================================
CREATE TABLE [dbo].[AvailabilityRecords] (
    [RecordID] int NOT NULL,
    [TargetID] int NOT NULL,
    [ActualUptime] decimal(5,2) NULL,
    [DowntimeMinutes] int NULL,
    [Status] nvarchar(50) NULL,
    [RecordedAt] datetime NULL
);


-- =============================================
-- Table: [dbo].[AvailabilityTargets]
-- =============================================
CREATE TABLE [dbo].[AvailabilityTargets] (
    [TargetID] int NOT NULL,
    [SystemName] nvarchar(150) NOT NULL,
    [TargetUptime] decimal(5,2) NOT NULL,
    [Period] nvarchar(50) NULL,
    [CreatedAt] datetime NULL
);


-- =============================================
-- Table: [dbo].[CapacityLogs]
-- =============================================
CREATE TABLE [dbo].[CapacityLogs] (
    [LogID] int NOT NULL,
    [RecordID] int NOT NULL,
    [Action] nvarchar(200) NULL,
    [ActionDate] datetime NULL,
    [ActionBy] int NOT NULL
);


-- =============================================
-- Table: [dbo].[CapacityRecords]
-- =============================================
CREATE TABLE [dbo].[CapacityRecords] (
    [RecordID] int NOT NULL,
    [TargetID] int NOT NULL,
    [ActualUsage] decimal(10,2) NOT NULL,
    [Status] nvarchar(50) NULL,
    [RecordedAt] datetime NULL
);


-- =============================================
-- Table: [dbo].[CapacityTargets]
-- =============================================
CREATE TABLE [dbo].[CapacityTargets] (
    [TargetID] int NOT NULL,
    [ResourceType] nvarchar(50) NOT NULL,
    [TargetUsage] decimal(10,2) NOT NULL,
    [Period] nvarchar(50) NULL,
    [CreatedAt] datetime NULL
);


-- =============================================
-- Table: [dbo].[CashOnDelivery]
-- =============================================
CREATE TABLE [dbo].[CashOnDelivery] (
    [CODID] int NOT NULL,
    [PaymentID] int NULL,
    [DeliveryAddress] nvarchar(250) NOT NULL,
    [DeliveryDate] datetime NULL,
    [IsPaid] bit NULL,
    [OrderID] int NOT NULL
);


-- =============================================
-- Table: [dbo].[ChangeApprovals]
-- =============================================
CREATE TABLE [dbo].[ChangeApprovals] (
    [ApprovalID] int NOT NULL,
    [RequestID] int NOT NULL,
    [ApprovedBy] int NOT NULL,
    [ApprovalStatus] nvarchar(50) NOT NULL,
    [Notes] nvarchar(500) NULL,
    [ApprovedAt] datetime NULL
);


-- =============================================
-- Table: [dbo].[ChangeLogs]
-- =============================================
CREATE TABLE [dbo].[ChangeLogs] (
    [LogID] int NOT NULL,
    [RequestID] int NOT NULL,
    [Action] nvarchar(200) NULL,
    [ActionDate] datetime NULL,
    [ActionBy] int NOT NULL
);


-- =============================================
-- Table: [dbo].[ChangeRequests]
-- =============================================
CREATE TABLE [dbo].[ChangeRequests] (
    [RequestID] int NOT NULL,
    [Title] nvarchar(200) NOT NULL,
    [Description] nvarchar(500) NULL,
    [Priority] nvarchar(20) NULL,
    [Status] nvarchar(50) NULL,
    [RequestedBy] int NOT NULL,
    [RequestedAt] datetime NULL
);


-- =============================================
-- Table: [dbo].[ConfigChanges]
-- =============================================
CREATE TABLE [dbo].[ConfigChanges] (
    [ChangeID] int NOT NULL,
    [ConfigID] int NOT NULL,
    [ChangeDescription] nvarchar(500) NULL,
    [ChangedBy] int NOT NULL,
    [ChangeDate] datetime NULL
);


-- =============================================
-- Table: [dbo].[ConfigItems]
-- =============================================
CREATE TABLE [dbo].[ConfigItems] (
    [ConfigID] int NOT NULL,
    [ItemName] nvarchar(150) NOT NULL,
    [ItemType] nvarchar(100) NULL,
    [Status] nvarchar(50) NULL,
    [Owner] nvarchar(150) NULL,
    [CreatedAt] datetime NULL
);


-- =============================================
-- Table: [dbo].[ConfigLogs]
-- =============================================
CREATE TABLE [dbo].[ConfigLogs] (
    [LogID] int NOT NULL,
    [ConfigID] int NOT NULL,
    [Action] nvarchar(200) NULL,
    [ActionDate] datetime NULL,
    [ActionBy] int NOT NULL
);


-- =============================================
-- Table: [dbo].[ContinuityLogs]
-- =============================================
CREATE TABLE [dbo].[ContinuityLogs] (
    [LogID] int NOT NULL,
    [PlanID] int NOT NULL,
    [Action] nvarchar(200) NULL,
    [ActionDate] datetime NULL,
    [ActionBy] nvarchar(150) NULL
);


-- =============================================
-- Table: [dbo].[ContinuityPlans]
-- =============================================
CREATE TABLE [dbo].[ContinuityPlans] (
    [PlanID] int NOT NULL,
    [PlanName] nvarchar(150) NOT NULL,
    [Description] nvarchar(500) NULL,
    [Status] nvarchar(50) NULL,
    [Owner] nvarchar(150) NULL,
    [CreatedAt] datetime NULL
);


-- =============================================
-- Table: [dbo].[ContinuityTests]
-- =============================================
CREATE TABLE [dbo].[ContinuityTests] (
    [TestID] int NOT NULL,
    [PlanID] int NOT NULL,
    [Scenario] nvarchar(100) NULL,
    [TestStatus] nvarchar(50) NULL,
    [TestedBy] nvarchar(150) NULL,
    [TestDate] datetime NULL
);


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
-- Table: [dbo].[ForecastingHistory]
-- =============================================
CREATE TABLE [dbo].[ForecastingHistory] (
    [HistoryID] int NOT NULL,
    [ForecastID] int NOT NULL,
    [ActualValue] decimal(18,2) NOT NULL,
    [ComparisonDate] datetime NOT NULL,
    [CreatedAt] datetime NULL
);


-- =============================================
-- Table: [dbo].[ForecastingReports]
-- =============================================
CREATE TABLE [dbo].[ForecastingReports] (
    [ForecastID] int NOT NULL,
    [ProductID] int NULL,
    [ForecastType] nvarchar(100) NOT NULL,
    [ForecastPeriod] nvarchar(50) NOT NULL,
    [ForecastDate] datetime NOT NULL,
    [ExpectedValue] decimal(18,2) NOT NULL,
    [CreatedAt] datetime NULL
);


-- =============================================
-- Table: [dbo].[IncidentReports]
-- =============================================
CREATE TABLE [dbo].[IncidentReports] (
    [IncidentID] int NOT NULL,
    [Title] nvarchar(200) NOT NULL,
    [Description] nvarchar(500) NULL,
    [TypeID] int NOT NULL,
    [Status] nvarchar(50) NULL,
    [ReportedBy] int NOT NULL,
    [AssignedTo] int NULL,
    [ReportedAt] datetime NULL,
    [ResolvedAt] datetime NULL
);


-- =============================================
-- Table: [dbo].[IncidentTypes]
-- =============================================
CREATE TABLE [dbo].[IncidentTypes] (
    [TypeID] int NOT NULL,
    [TypeName] nvarchar(100) NOT NULL,
    [Description] nvarchar(250) NULL
);


-- =============================================
-- Table: [dbo].[Invoices]
-- =============================================
CREATE TABLE [dbo].[Invoices] (
    [InvoiceID] int NOT NULL,
    [InvoiceNumber] nvarchar(50) NOT NULL,
    [IssueDate] datetime NULL,
    [DueDate] datetime NULL,
    [Amount] decimal(18,2) NOT NULL,
    [Status] nvarchar(50) NULL
);


-- =============================================
-- Table: [dbo].[Ledger]
-- =============================================
CREATE TABLE [dbo].[Ledger] (
    [LedgerID] int NOT NULL,
    [TransactionType] nvarchar(50) NOT NULL,
    [ReferenceID] int NOT NULL,
    [Amount] decimal(18,2) NOT NULL,
    [DebitCredit] nvarchar(10) NOT NULL,
    [TransactionDate] datetime NULL,
    [Notes] nvarchar(250) NULL
);


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
    [CreatedAt] datetime NULL
);


-- =============================================
-- Table: [dbo].[Payments]
-- =============================================
CREATE TABLE [dbo].[Payments] (
    [PaymentID] int NOT NULL,
    [TransactionID] int NOT NULL,
    [MerchantType] nvarchar(50) NOT NULL,
    [MerchantID] int NOT NULL,
    [Amount] decimal(18,2) NOT NULL,
    [Status] nvarchar(50) NULL,
    [PaymentDate] datetime NULL,
    [ReleaseDate] datetime NULL,
    [CreatedAt] datetime NULL
);


-- =============================================
-- Table: [dbo].[ProblemCatalog]
-- =============================================
CREATE TABLE [dbo].[ProblemCatalog] (
    [ProblemID] int NOT NULL,
    [Title] nvarchar(200) NOT NULL,
    [Description] nvarchar(500) NULL,
    [Category] nvarchar(100) NULL,
    [Status] nvarchar(50) NULL,
    [CreatedAt] datetime NULL,
    [CreatedBy] int NOT NULL
);


-- =============================================
-- Table: [dbo].[ProblemLogs]
-- =============================================
CREATE TABLE [dbo].[ProblemLogs] (
    [LogID] int NOT NULL,
    [ProblemID] int NOT NULL,
    [LogDescription] nvarchar(500) NULL,
    [LogDate] datetime NULL,
    [LoggedBy] int NOT NULL
);


-- =============================================
-- Table: [dbo].[ProblemRecords]
-- =============================================
CREATE TABLE [dbo].[ProblemRecords] (
    [RecordID] int NOT NULL,
    [ProblemID] int NOT NULL,
    [RelatedIncidentID] int NULL,
    [ActionTaken] nvarchar(250) NULL,
    [ActionDate] datetime NULL,
    [ActionBy] int NOT NULL
);


-- =============================================
-- Table: [dbo].[Products]
-- =============================================
CREATE TABLE [dbo].[Products] (
    [ProductID] int NOT NULL,
    [OwnerMerchantID] int NOT NULL,
    [CategoryID] int NOT NULL,
    [ProductName] nvarchar(200) NOT NULL,
    [Description] nvarchar(MAX) NULL,
    [BaseUnit] nvarchar(50) NULL,
    [WholesalePrice] decimal(10,2) NOT NULL,
    [StockQuantity] int NOT NULL,
    [IsActive] bit NOT NULL,
    [CreatedAt] datetime NULL,
    [UpdatedAt] datetime NULL
);


-- =============================================
-- Table: [dbo].[Refunds]
-- =============================================
CREATE TABLE [dbo].[Refunds] (
    [RefundID] int NOT NULL,
    [PaymentID] int NOT NULL,
    [RefundAmount] decimal(18,2) NOT NULL,
    [RefundDate] datetime NULL,
    [Reason] nvarchar(250) NULL
);


-- =============================================
-- Table: [dbo].[ReleaseDeployments]
-- =============================================
CREATE TABLE [dbo].[ReleaseDeployments] (
    [DeploymentID] int NOT NULL,
    [ReleaseID] int NOT NULL,
    [Environment] nvarchar(50) NOT NULL,
    [DeploymentStatus] nvarchar(50) NULL,
    [DeployedBy] nvarchar(150) NULL,
    [DeploymentNotes] nvarchar(500) NULL,
    [DeployedAt] datetime NULL
);


-- =============================================
-- Table: [dbo].[ReleaseLogs]
-- =============================================
CREATE TABLE [dbo].[ReleaseLogs] (
    [LogID] int NOT NULL,
    [ReleaseID] int NOT NULL,
    [Action] nvarchar(200) NULL,
    [ActionDate] datetime NULL,
    [ActionBy] nvarchar(150) NULL
);


-- =============================================
-- Table: [dbo].[Releases]
-- =============================================
CREATE TABLE [dbo].[Releases] (
    [ReleaseID] int NOT NULL,
    [ReleaseName] nvarchar(150) NOT NULL,
    [PlannedDate] date NOT NULL,
    [Status] nvarchar(50) NULL,
    [ReleaseManager] nvarchar(150) NULL,
    [Notes] nvarchar(500) NULL,
    [CreatedAt] datetime NULL
);


-- =============================================
-- Table: [dbo].[ReportLogs]
-- =============================================
CREATE TABLE [dbo].[ReportLogs] (
    [LogID] int NOT NULL,
    [ReportID] int NOT NULL,
    [Action] nvarchar(100) NULL,
    [ActionDate] datetime NULL
);


-- =============================================
-- Table: [dbo].[ReportRuns]
-- =============================================
CREATE TABLE [dbo].[ReportRuns] (
    [RunID] int NOT NULL,
    [ReportID] int NOT NULL,
    [RunDate] datetime NULL,
    [GeneratedBy] int NOT NULL
);


-- =============================================
-- Table: [dbo].[Reports]
-- =============================================
CREATE TABLE [dbo].[Reports] (
    [ReportID] int NOT NULL,
    [ReportName] nvarchar(150) NOT NULL,
    [ReportType] nvarchar(50) NOT NULL,
    [CreatedBy] int NOT NULL,
    [CreatedAt] datetime NULL,
    [Status] nvarchar(50) NULL
);


-- =============================================
-- Table: [dbo].[Roles]
-- =============================================
CREATE TABLE [dbo].[Roles] (
    [RoleID] int NOT NULL,
    [RoleName] nvarchar(100) NOT NULL,
    [Note] nvarchar(200) NULL,
    [CreatedAt] datetime NULL,
    [Description] nvarchar(255) NULL
);


-- =============================================
-- Table: [dbo].[Shipping]
-- =============================================
CREATE TABLE [dbo].[Shipping] (
    [ShippingID] int NOT NULL,
    [TransactionID] int NOT NULL,
    [CompanyName] nvarchar(150) NOT NULL,
    [TrackingNumber] nvarchar(100) NOT NULL,
    [Status] nvarchar(50) NOT NULL,
    [ShipmentDate] datetime NULL,
    [DeliveryDate] datetime NULL,
    [CreatedAt] datetime NULL
);


-- =============================================
-- Table: [dbo].[SupportTickets]
-- =============================================
CREATE TABLE [dbo].[SupportTickets] (
    [TicketID] int NOT NULL,
    [Title] nvarchar(200) NOT NULL,
    [Description] nvarchar(500) NULL,
    [CategoryID] int NOT NULL,
    [Status] nvarchar(50) NULL,
    [OpenedBy] int NOT NULL,
    [AssignedTo] int NULL,
    [OpenedAt] datetime NULL,
    [ClosedAt] datetime NULL
);


-- =============================================
-- Table: [dbo].[SymbolsColors]
-- =============================================
CREATE TABLE [dbo].[SymbolsColors] (
    [Id] int NOT NULL,
    [Symbol] nvarchar(10) NOT NULL,
    [Meaning] nvarchar(100) NOT NULL,
    [Category] nvarchar(50) NULL
);


-- =============================================
-- Table: [dbo].[sysdiagrams]
-- =============================================
CREATE TABLE [dbo].[sysdiagrams] (
    [name] nvarchar(128) NOT NULL,
    [principal_id] int NOT NULL,
    [diagram_id] int NOT NULL,
    [version] int NULL,
    [definition] varbinary(MAX) NULL
);


-- =============================================
-- Table: [dbo].[Taxes]
-- =============================================
CREATE TABLE [dbo].[Taxes] (
    [TaxID] int NOT NULL,
    [TransactionID] int NOT NULL,
    [TaxRate] decimal(5,2) NOT NULL,
    [TaxAmount] decimal(18,2) NOT NULL,
    [TaxDate] datetime NULL
);


-- =============================================
-- Table: [dbo].[TicketCategories]
-- =============================================
CREATE TABLE [dbo].[TicketCategories] (
    [CategoryID] int NOT NULL,
    [CategoryName] nvarchar(100) NOT NULL,
    [Description] nvarchar(250) NULL
);


-- =============================================
-- Table: [dbo].[TicketLogs]
-- =============================================
CREATE TABLE [dbo].[TicketLogs] (
    [LogID] int NOT NULL,
    [TicketID] int NOT NULL,
    [Action] nvarchar(200) NULL,
    [ActionDate] datetime NULL,
    [ActionBy] int NOT NULL
);


-- =============================================
-- Table: [dbo].[TransactionItems]
-- =============================================
CREATE TABLE [dbo].[TransactionItems] (
    [TransactionItemID] int NOT NULL,
    [TransactionID] int NOT NULL,
    [MappingID] int NULL,
    [ProductID] int NOT NULL,
    [Quantity] int NOT NULL,
    [UnitPrice] decimal(10,2) NOT NULL,
    [SoldUnit] nvarchar(50) NULL,
    [ConversionFactor] int NULL,
    [DeductedStockQuantity] int NULL,
    [TotalPrice] decimal(21,2) NULL
);


-- =============================================
-- Table: [dbo].[Transactions]
-- =============================================
CREATE TABLE [dbo].[Transactions] (
    [TransactionID] int NOT NULL,
    [SellerMerchantID] int NOT NULL,
    [BuyerMerchantID] int NULL,
    [GuestCustomerName] nvarchar(150) NULL,
    [GuestCustomerPhone] varchar(20) NULL,
    [TransactionType] nvarchar(20) NOT NULL,
    [TotalAmount] decimal(10,2) NOT NULL,
    [Status] nvarchar(20) NOT NULL,
    [TransactionDate] datetime NULL
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
    [Notes] nvarchar(250) NULL
);


-- =============================================
-- Table: [dbo].[UsersData]
-- =============================================
CREATE TABLE [dbo].[UsersData] (
    [UserID] int NOT NULL,
    [ProfileID] int NOT NULL,
    [Facebook] nvarchar(200) NULL,
    [Instagram] nvarchar(200) NULL,
    [Twitter] nvarchar(200) NULL,
    [TikTok] nvarchar(200) NULL,
    [LinkedIn] nvarchar(200) NULL,
    [Phone1] nvarchar(20) NULL,
    [Phone2] nvarchar(20) NULL,
    [Address] nvarchar(300) NULL,
    [Gender] nvarchar(20) NULL,
    [Age] int NULL,
    [Region] nvarchar(100) NULL,
    [IncomeLevel] nvarchar(50) NULL,
    [Education] nvarchar(100) NULL,
    [MaritalStatus] nvarchar(20) NULL,
    [CreatedAt] datetime NULL,
    [UpdatedAt] datetime NULL
);


-- =============================================
-- Table: [dbo].[UserSessions]
-- =============================================
CREATE TABLE [dbo].[UserSessions] (
    [SessionID] int NOT NULL,
    [UserID] int NOT NULL,
    [LoginTime] datetime NOT NULL,
    [DeviceType] nvarchar(100) NOT NULL,
    [Browser] nvarchar(100) NULL,
    [IPAddress] nvarchar(50) NULL
);


-- =============================================
-- Table: [dbo].[UsersRoles]
-- =============================================
CREATE TABLE [dbo].[UsersRoles] (
    [UserID] int NOT NULL,
    [RoleID] int NOT NULL
);


-- =============================================
-- Table: [dbo].[WalletTransactions]
-- =============================================
CREATE TABLE [dbo].[WalletTransactions] (
    [TransactionID] int NOT NULL,
    [WalletID] int NOT NULL,
    [TransactionType] nvarchar(50) NULL,
    [Amount] decimal(15,2) NOT NULL,
    [TransactionDate] datetime NULL
);



Completion time: 2026-09-01T16:38:31.0010762+03:00
