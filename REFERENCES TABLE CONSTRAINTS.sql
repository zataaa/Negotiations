-- =============================================
-- Table: [dbo].[AuditLogs]
-- Constraint: [FK_AuditLogs_AvailabilityLogs] (FOREIGN KEY)
-- =============================================
ALTER TABLE [dbo].[AuditLogs] ADD CONSTRAINT [FK_AuditLogs_AvailabilityLogs] FOREIGN KEY ([LogID]) REFERENCES [dbo].[AvailabilityLogs] ([LogID]);


-- =============================================
-- Table: [dbo].[AuditLogs]
-- Constraint: [FK_AuditLogs_CapacityLogs] (FOREIGN KEY)
-- =============================================
ALTER TABLE [dbo].[AuditLogs] ADD CONSTRAINT [FK_AuditLogs_CapacityLogs] FOREIGN KEY ([LogID]) REFERENCES [dbo].[CapacityLogs] ([LogID]);


-- =============================================
-- Table: [dbo].[AuditLogs]
-- Constraint: [FK_AuditLogs_AuthenticationLogs] (FOREIGN KEY)
-- =============================================
ALTER TABLE [dbo].[AuditLogs] ADD CONSTRAINT [FK_AuditLogs_AuthenticationLogs] FOREIGN KEY ([LogID]) REFERENCES [dbo].[AuthenticationLogs] ([LogID]);


-- =============================================
-- Table: [dbo].[AuditLogs]
-- Constraint: [FK_AuditLogs_ChangeLogs] (FOREIGN KEY)
-- =============================================
ALTER TABLE [dbo].[AuditLogs] ADD CONSTRAINT [FK_AuditLogs_ChangeLogs] FOREIGN KEY ([LogID]) REFERENCES [dbo].[ChangeLogs] ([LogID]);


-- =============================================
-- Table: [dbo].[AuditLogs]
-- Constraint: [FK_AuditLogs_ConfigLogs] (FOREIGN KEY)
-- =============================================
ALTER TABLE [dbo].[AuditLogs] ADD CONSTRAINT [FK_AuditLogs_ConfigLogs] FOREIGN KEY ([LogID]) REFERENCES [dbo].[ConfigLogs] ([LogID]);


-- =============================================
-- Table: [dbo].[AuditLogs]
-- Constraint: [FK_AuditLogs_ContinuityLogs] (FOREIGN KEY)
-- =============================================
ALTER TABLE [dbo].[AuditLogs] ADD CONSTRAINT [FK_AuditLogs_ContinuityLogs] FOREIGN KEY ([LogID]) REFERENCES [dbo].[ContinuityLogs] ([LogID]);


-- =============================================
-- Table: [dbo].[AuditLogs]
-- Constraint: [FK_AuditLogs_ReleaseLogs] (FOREIGN KEY)
-- =============================================
ALTER TABLE [dbo].[AuditLogs] ADD CONSTRAINT [FK_AuditLogs_ReleaseLogs] FOREIGN KEY ([LogID]) REFERENCES [dbo].[ReleaseLogs] ([LogID]);


-- =============================================
-- Table: [dbo].[AuditLogs]
-- Constraint: [FK_AuditLogs_ReportLogs] (FOREIGN KEY)
-- =============================================
ALTER TABLE [dbo].[AuditLogs] ADD CONSTRAINT [FK_AuditLogs_ReportLogs] FOREIGN KEY ([LogID]) REFERENCES [dbo].[ReportLogs] ([LogID]);


-- =============================================
-- Table: [dbo].[AuditLogs]
-- Constraint: [FK_AuditLogs_TicketLogs] (FOREIGN KEY)
-- =============================================
ALTER TABLE [dbo].[AuditLogs] ADD CONSTRAINT [FK_AuditLogs_TicketLogs] FOREIGN KEY ([LogID]) REFERENCES [dbo].[TicketLogs] ([LogID]);


-- =============================================
-- Table: [dbo].[AuditLogs]
-- Constraint: [FK_AuditLogs_ProblemLogs_] (FOREIGN KEY)
-- =============================================
ALTER TABLE [dbo].[AuditLogs] ADD CONSTRAINT [FK_AuditLogs_ProblemLogs_] FOREIGN KEY ([LogID]) REFERENCES [dbo].[ProblemLogs] ([LogID]);


-- =============================================
-- Table: [dbo].[AuditLogs]
-- Constraint: [PK__AuditLog__5E5499A80918CFC3] (PRIMARY KEY)
-- =============================================
ALTER TABLE [dbo].[AuditLogs] ADD CONSTRAINT [PK__AuditLog__5E5499A80918CFC3] PRIMARY KEY ([LogID]);


-- =============================================
-- Table: [dbo].[AuthenticationLogs]
-- Constraint: [FK_AuthenticationLogs_UserID] (FOREIGN KEY)
-- =============================================
ALTER TABLE [dbo].[AuthenticationLogs] ADD CONSTRAINT [FK_AuthenticationLogs_UserID] FOREIGN KEY ([UserID]) REFERENCES [dbo].[Users] ([UserID]);


-- =============================================
-- Table: [dbo].[AuthenticationLogs]
-- Constraint: [PK__Authenti__5E5499A83A24E32A] (PRIMARY KEY)
-- =============================================
ALTER TABLE [dbo].[AuthenticationLogs] ADD CONSTRAINT [PK__Authenti__5E5499A83A24E32A] PRIMARY KEY ([LogID]);


-- =============================================
-- Table: [dbo].[AvailabilityLogs]
-- Constraint: [FK__Availabil__Recor__1E3A7A34] (FOREIGN KEY)
-- =============================================
ALTER TABLE [dbo].[AvailabilityLogs] ADD CONSTRAINT [FK__Availabil__Recor__1E3A7A34] FOREIGN KEY ([RecordID]) REFERENCES [dbo].[AvailabilityRecords] ([RecordID]);


-- =============================================
-- Table: [dbo].[AvailabilityLogs]
-- Constraint: [PK__Availabi__5E5499A8D9BDEC7B] (PRIMARY KEY)
-- =============================================
ALTER TABLE [dbo].[AvailabilityLogs] ADD CONSTRAINT [PK__Availabi__5E5499A8D9BDEC7B] PRIMARY KEY ([LogID]);


-- =============================================
-- Table: [dbo].[AvailabilityRecords]
-- Constraint: [FK__Availabil__Targe__1A69E950] (FOREIGN KEY)
-- =============================================
ALTER TABLE [dbo].[AvailabilityRecords] ADD CONSTRAINT [FK__Availabil__Targe__1A69E950] FOREIGN KEY ([TargetID]) REFERENCES [dbo].[AvailabilityTargets] ([TargetID]);


-- =============================================
-- Table: [dbo].[AvailabilityRecords]
-- Constraint: [PK__Availabi__FBDF78C90D23DA6F] (PRIMARY KEY)
-- =============================================
ALTER TABLE [dbo].[AvailabilityRecords] ADD CONSTRAINT [PK__Availabi__FBDF78C90D23DA6F] PRIMARY KEY ([RecordID]);


-- =============================================
-- Table: [dbo].[AvailabilityTargets]
-- Constraint: [PK__Availabi__2B1F0FB613731466] (PRIMARY KEY)
-- =============================================
ALTER TABLE [dbo].[AvailabilityTargets] ADD CONSTRAINT [PK__Availabi__2B1F0FB613731466] PRIMARY KEY ([TargetID]);


-- =============================================
-- Table: [dbo].[CapacityLogs]
-- Constraint: [FK__CapacityL__Recor__30592A6F] (FOREIGN KEY)
-- =============================================
ALTER TABLE [dbo].[CapacityLogs] ADD CONSTRAINT [FK__CapacityL__Recor__30592A6F] FOREIGN KEY ([RecordID]) REFERENCES [dbo].[CapacityRecords] ([RecordID]);


-- =============================================
-- Table: [dbo].[CapacityLogs]
-- Constraint: [PK__Capacity__5E5499A8369603CB] (PRIMARY KEY)
-- =============================================
ALTER TABLE [dbo].[CapacityLogs] ADD CONSTRAINT [PK__Capacity__5E5499A8369603CB] PRIMARY KEY ([LogID]);


-- =============================================
-- Table: [dbo].[CapacityRecords]
-- Constraint: [FK__CapacityR__Targe__2C88998B] (FOREIGN KEY)
-- =============================================
ALTER TABLE [dbo].[CapacityRecords] ADD CONSTRAINT [FK__CapacityR__Targe__2C88998B] FOREIGN KEY ([TargetID]) REFERENCES [dbo].[CapacityTargets] ([TargetID]);


-- =============================================
-- Table: [dbo].[CapacityRecords]
-- Constraint: [PK__Capacity__FBDF78C94135708F] (PRIMARY KEY)
-- =============================================
ALTER TABLE [dbo].[CapacityRecords] ADD CONSTRAINT [PK__Capacity__FBDF78C94135708F] PRIMARY KEY ([RecordID]);


-- =============================================
-- Table: [dbo].[CapacityTargets]
-- Constraint: [PK__Capacity__2B1F0FB6DFA21F40] (PRIMARY KEY)
-- =============================================
ALTER TABLE [dbo].[CapacityTargets] ADD CONSTRAINT [PK__Capacity__2B1F0FB6DFA21F40] PRIMARY KEY ([TargetID]);


-- =============================================
-- Table: [dbo].[CashOnDelivery]
-- Constraint: [FK_CashOnDelivery_Transactions] (FOREIGN KEY)
-- =============================================
ALTER TABLE [dbo].[CashOnDelivery] ADD CONSTRAINT [FK_CashOnDelivery_Transactions] FOREIGN KEY ([TransactionID]) REFERENCES [dbo].[Transactions] ([TransactionID]);


-- =============================================
-- Table: [dbo].[CashOnDelivery]
-- Constraint: [PK__CashOnDe__F256EBBFFFBB764F] (PRIMARY KEY)
-- =============================================
ALTER TABLE [dbo].[CashOnDelivery] ADD CONSTRAINT [PK__CashOnDe__F256EBBFFFBB764F] PRIMARY KEY ([CashOnDelivery]);


-- =============================================
-- Table: [dbo].[Categories]
-- Constraint: [PK__Categori__19093A2B84B20B80] (PRIMARY KEY)
-- =============================================
ALTER TABLE [dbo].[Categories] ADD CONSTRAINT [PK__Categori__19093A2B84B20B80] PRIMARY KEY ([CategoryID]);


-- =============================================
-- Table: [dbo].[ChangeApprovals]
-- Constraint: [FK__ChangeApp__Reque__43A1090D] (FOREIGN KEY)
-- =============================================
ALTER TABLE [dbo].[ChangeApprovals] ADD CONSTRAINT [FK__ChangeApp__Reque__43A1090D] FOREIGN KEY ([RequestID]) REFERENCES [dbo].[ChangeRequests] ([RequestID]);


-- =============================================
-- Table: [dbo].[ChangeApprovals]
-- Constraint: [PK__ChangeAp__328477D46C5B3FDB] (PRIMARY KEY)
-- =============================================
ALTER TABLE [dbo].[ChangeApprovals] ADD CONSTRAINT [PK__ChangeAp__328477D46C5B3FDB] PRIMARY KEY ([ApprovalID]);


-- =============================================
-- Table: [dbo].[ChangeLogs]
-- Constraint: [FK__ChangeLog__Reque__4865BE2A] (FOREIGN KEY)
-- =============================================
ALTER TABLE [dbo].[ChangeLogs] ADD CONSTRAINT [FK__ChangeLog__Reque__4865BE2A] FOREIGN KEY ([RequestID]) REFERENCES [dbo].[ChangeRequests] ([RequestID]);


-- =============================================
-- Table: [dbo].[ChangeLogs]
-- Constraint: [PK__ChangeLo__5E5499A8DED22EBC] (PRIMARY KEY)
-- =============================================
ALTER TABLE [dbo].[ChangeLogs] ADD CONSTRAINT [PK__ChangeLo__5E5499A8DED22EBC] PRIMARY KEY ([LogID]);


-- =============================================
-- Table: [dbo].[ChangeRequests]
-- Constraint: [PK__ChangeRe__33A8519A3141D421] (PRIMARY KEY)
-- =============================================
ALTER TABLE [dbo].[ChangeRequests] ADD CONSTRAINT [PK__ChangeRe__33A8519A3141D421] PRIMARY KEY ([RequestID]);


-- =============================================
-- Table: [dbo].[ConfigChanges]
-- Constraint: [FK__ConfigCha__Confi__762C88DA] (FOREIGN KEY)
-- =============================================
ALTER TABLE [dbo].[ConfigChanges] ADD CONSTRAINT [FK__ConfigCha__Confi__762C88DA] FOREIGN KEY ([ConfigID]) REFERENCES [dbo].[ConfigItems] ([ConfigID]);


-- =============================================
-- Table: [dbo].[ConfigChanges]
-- Constraint: [PK__ConfigCh__0E05C5B75CA6BB9A] (PRIMARY KEY)
-- =============================================
ALTER TABLE [dbo].[ConfigChanges] ADD CONSTRAINT [PK__ConfigCh__0E05C5B75CA6BB9A] PRIMARY KEY ([ChangeID]);


-- =============================================
-- Table: [dbo].[ConfigItems]
-- Constraint: [PK__ConfigIt__C3BC333C08542607] (PRIMARY KEY)
-- =============================================
ALTER TABLE [dbo].[ConfigItems] ADD CONSTRAINT [PK__ConfigIt__C3BC333C08542607] PRIMARY KEY ([ConfigID]);


-- =============================================
-- Table: [dbo].[ConfigLogs]
-- Constraint: [FK__ConfigLog__Confi__7AF13DF7] (FOREIGN KEY)
-- =============================================
ALTER TABLE [dbo].[ConfigLogs] ADD CONSTRAINT [FK__ConfigLog__Confi__7AF13DF7] FOREIGN KEY ([ConfigID]) REFERENCES [dbo].[ConfigItems] ([ConfigID]);


-- =============================================
-- Table: [dbo].[ConfigLogs]
-- Constraint: [PK__ConfigLo__5E5499A83A3C9C5C] (PRIMARY KEY)
-- =============================================
ALTER TABLE [dbo].[ConfigLogs] ADD CONSTRAINT [PK__ConfigLo__5E5499A83A3C9C5C] PRIMARY KEY ([LogID]);


-- =============================================
-- Table: [dbo].[ContinuityLogs]
-- Constraint: [FK__Continuit__PlanI__4277DAAA] (FOREIGN KEY)
-- =============================================
ALTER TABLE [dbo].[ContinuityLogs] ADD CONSTRAINT [FK__Continuit__PlanI__4277DAAA] FOREIGN KEY ([PlanID]) REFERENCES [dbo].[ContinuityPlans] ([PlanID]);


-- =============================================
-- Table: [dbo].[ContinuityLogs]
-- Constraint: [PK__Continui__5E5499A896D3F35F] (PRIMARY KEY)
-- =============================================
ALTER TABLE [dbo].[ContinuityLogs] ADD CONSTRAINT [PK__Continui__5E5499A896D3F35F] PRIMARY KEY ([LogID]);


-- =============================================
-- Table: [dbo].[ContinuityPlans]
-- Constraint: [PK__Continui__755C22D71A22CECD] (PRIMARY KEY)
-- =============================================
ALTER TABLE [dbo].[ContinuityPlans] ADD CONSTRAINT [PK__Continui__755C22D71A22CECD] PRIMARY KEY ([PlanID]);


-- =============================================
-- Table: [dbo].[ContinuityTests]
-- Constraint: [FK__Continuit__PlanI__3DB3258D] (FOREIGN KEY)
-- =============================================
ALTER TABLE [dbo].[ContinuityTests] ADD CONSTRAINT [FK__Continuit__PlanI__3DB3258D] FOREIGN KEY ([PlanID]) REFERENCES [dbo].[ContinuityPlans] ([PlanID]);


-- =============================================
-- Table: [dbo].[ContinuityTests]
-- Constraint: [PK__Continui__8CC331000DFEB1A5] (PRIMARY KEY)
-- =============================================
ALTER TABLE [dbo].[ContinuityTests] ADD CONSTRAINT [PK__Continui__8CC331000DFEB1A5] PRIMARY KEY ([TestID]);


-- =============================================
-- Table: [dbo].[DigitalWallets]
-- Constraint: [FK_DigitalWallets_Users] (FOREIGN KEY)
-- =============================================
ALTER TABLE [dbo].[DigitalWallets] ADD CONSTRAINT [FK_DigitalWallets_Users] FOREIGN KEY ([UserID]) REFERENCES [dbo].[Users] ([UserID]);


-- =============================================
-- Table: [dbo].[DigitalWallets]
-- Constraint: [PK__DigitalW__84D4F92E0B864BFD] (PRIMARY KEY)
-- =============================================
ALTER TABLE [dbo].[DigitalWallets] ADD CONSTRAINT [PK__DigitalW__84D4F92E0B864BFD] PRIMARY KEY ([WalletID]);


-- =============================================
-- Table: [dbo].[ForecastingHistory]
-- Constraint: [FK_ForecastingHistory_ForecastingReports] (FOREIGN KEY)
-- =============================================
ALTER TABLE [dbo].[ForecastingHistory] ADD CONSTRAINT [FK_ForecastingHistory_ForecastingReports] FOREIGN KEY ([ForecastID]) REFERENCES [dbo].[ForecastingReports] ([ForecastID]);


-- =============================================
-- Table: [dbo].[ForecastingHistory]
-- Constraint: [PK__Forecast__4D7B4ADD5057FBEB] (PRIMARY KEY)
-- =============================================
ALTER TABLE [dbo].[ForecastingHistory] ADD CONSTRAINT [PK__Forecast__4D7B4ADD5057FBEB] PRIMARY KEY ([HistoryID]);


-- =============================================
-- Table: [dbo].[ForecastingReports]
-- Constraint: [FK_ForecastingReports_Products] (FOREIGN KEY)
-- =============================================
ALTER TABLE [dbo].[ForecastingReports] ADD CONSTRAINT [FK_ForecastingReports_Products] FOREIGN KEY ([ProductID]) REFERENCES [dbo].[Products] ([ProductID]);


-- =============================================
-- Table: [dbo].[ForecastingReports]
-- Constraint: [PK__Forecast__7F2744588F0B1B4D] (PRIMARY KEY)
-- =============================================
ALTER TABLE [dbo].[ForecastingReports] ADD CONSTRAINT [PK__Forecast__7F2744588F0B1B4D] PRIMARY KEY ([ForecastID]);


-- =============================================
-- Table: [dbo].[IncidentReports]
-- Constraint: [FK__IncidentR__TypeI__251C81ED] (FOREIGN KEY)
-- =============================================
ALTER TABLE [dbo].[IncidentReports] ADD CONSTRAINT [FK__IncidentR__TypeI__251C81ED] FOREIGN KEY ([TypeID]) REFERENCES [dbo].[IncidentTypes] ([TypeID]);


-- =============================================
-- Table: [dbo].[IncidentReports]
-- Constraint: [PK__Incident__3D80539235208CFB] (PRIMARY KEY)
-- =============================================
ALTER TABLE [dbo].[IncidentReports] ADD CONSTRAINT [PK__Incident__3D80539235208CFB] PRIMARY KEY ([IncidentID]);


-- =============================================
-- Table: [dbo].[IncidentTypes]
-- Constraint: [PK__Incident__516F03959377C4B8] (PRIMARY KEY)
-- =============================================
ALTER TABLE [dbo].[IncidentTypes] ADD CONSTRAINT [PK__Incident__516F03959377C4B8] PRIMARY KEY ([TypeID]);


-- =============================================
-- Table: [dbo].[Invoices]
-- Constraint: [FK_Invoices_Transactions] (FOREIGN KEY)
-- =============================================
ALTER TABLE [dbo].[Invoices] ADD CONSTRAINT [FK_Invoices_Transactions] FOREIGN KEY ([TransactionID]) REFERENCES [dbo].[Transactions] ([TransactionID]);


-- =============================================
-- Table: [dbo].[Invoices]
-- Constraint: [PK__Invoices__D796AAD54DC75255] (PRIMARY KEY)
-- =============================================
ALTER TABLE [dbo].[Invoices] ADD CONSTRAINT [PK__Invoices__D796AAD54DC75255] PRIMARY KEY ([InvoiceID]);


-- =============================================
-- Table: [dbo].[Invoices]
-- Constraint: [UQ__Invoices__D776E981BE9E3D7B] (UNIQUE)
-- =============================================
ALTER TABLE [dbo].[Invoices] ADD CONSTRAINT [UQ__Invoices__D776E981BE9E3D7B] UNIQUE ([InvoiceNumber]);


-- =============================================
-- Table: [dbo].[Ledger]
-- Constraint: [FK_Ledger_Transaction] (FOREIGN KEY)
-- =============================================
ALTER TABLE [dbo].[Ledger] ADD CONSTRAINT [FK_Ledger_Transaction] FOREIGN KEY ([TransactionID]) REFERENCES [dbo].[Transactions] ([TransactionID]);


-- =============================================
-- Table: [dbo].[Ledger]
-- Constraint: [PK__Ledger__AE70E0AF490499BC] (PRIMARY KEY)
-- =============================================
ALTER TABLE [dbo].[Ledger] ADD CONSTRAINT [PK__Ledger__AE70E0AF490499BC] PRIMARY KEY ([LedgerID]);


-- =============================================
-- Table: [dbo].[MerchantProductMapping]
-- Constraint: [PK_MerchantProductMapping] (PRIMARY KEY)
-- =============================================
ALTER TABLE [dbo].[MerchantProductMapping] ADD CONSTRAINT [PK_MerchantProductMapping] PRIMARY KEY ([MappingID]);


-- =============================================
-- Table: [dbo].[Merchants]
-- Constraint: [PK_Merchants] (PRIMARY KEY)
-- =============================================
ALTER TABLE [dbo].[Merchants] ADD CONSTRAINT [PK_Merchants] PRIMARY KEY ([MerchantID]);


-- =============================================
-- Table: [dbo].[MerchantTransactions]
-- Constraint: [FK_MerchantTransactions_Transaction] (FOREIGN KEY)
-- =============================================
ALTER TABLE [dbo].[MerchantTransactions] ADD CONSTRAINT [FK_MerchantTransactions_Transaction] FOREIGN KEY ([TransactionID]) REFERENCES [dbo].[Transactions] ([TransactionID]);


-- =============================================
-- Table: [dbo].[MerchantTransactions]
-- Constraint: [FK_MerchantTransactions_Merchant] (FOREIGN KEY)
-- =============================================
ALTER TABLE [dbo].[MerchantTransactions] ADD CONSTRAINT [FK_MerchantTransactions_Merchant] FOREIGN KEY ([MerchantID]) REFERENCES [dbo].[Merchants] ([MerchantID]);


-- =============================================
-- Table: [dbo].[MerchantTransactions]
-- Constraint: [PK_MerchantTransactions] (PRIMARY KEY)
-- =============================================
ALTER TABLE [dbo].[MerchantTransactions] ADD CONSTRAINT [PK_MerchantTransactions] PRIMARY KEY ([MerchantID]);


-- =============================================
-- Table: [dbo].[Payments]
-- Constraint: [FK_Payments_Transactions] (FOREIGN KEY)
-- =============================================
ALTER TABLE [dbo].[Payments] ADD CONSTRAINT [FK_Payments_Transactions] FOREIGN KEY ([TransactionID]) REFERENCES [dbo].[Transactions] ([TransactionID]);


-- =============================================
-- Table: [dbo].[Payments]
-- Constraint: [PK_Payments] (PRIMARY KEY)
-- =============================================
ALTER TABLE [dbo].[Payments] ADD CONSTRAINT [PK_Payments] PRIMARY KEY ([PaymentID]);


-- =============================================
-- Table: [dbo].[ProblemCatalog]
-- Constraint: [PK__ProblemC__5CED516A100B1636] (PRIMARY KEY)
-- =============================================
ALTER TABLE [dbo].[ProblemCatalog] ADD CONSTRAINT [PK__ProblemC__5CED516A100B1636] PRIMARY KEY ([ProblemID]);


-- =============================================
-- Table: [dbo].[ProblemLogs]
-- Constraint: [FK_ProblemLogs_ProblemCatalog] (FOREIGN KEY)
-- =============================================
ALTER TABLE [dbo].[ProblemLogs] ADD CONSTRAINT [FK_ProblemLogs_ProblemCatalog] FOREIGN KEY ([ProblemID]) REFERENCES [dbo].[ProblemCatalog] ([ProblemID]);


-- =============================================
-- Table: [dbo].[ProblemLogs]
-- Constraint: [PK_ProblemLogs] (PRIMARY KEY)
-- =============================================
ALTER TABLE [dbo].[ProblemLogs] ADD CONSTRAINT [PK_ProblemLogs] PRIMARY KEY ([LogID]);


-- =============================================
-- Table: [dbo].[ProblemRecords]
-- Constraint: [FK__ProblemRe__Relat__55BFB948] (FOREIGN KEY)
-- =============================================
ALTER TABLE [dbo].[ProblemRecords] ADD CONSTRAINT [FK__ProblemRe__Relat__55BFB948] FOREIGN KEY ([RelatedIncidentID]) REFERENCES [dbo].[IncidentReports] ([IncidentID]);


-- =============================================
-- Table: [dbo].[ProblemRecords]
-- Constraint: [FK__ProblemRe__Probl__54CB950F] (FOREIGN KEY)
-- =============================================
ALTER TABLE [dbo].[ProblemRecords] ADD CONSTRAINT [FK__ProblemRe__Probl__54CB950F] FOREIGN KEY ([ProblemID]) REFERENCES [dbo].[ProblemCatalog] ([ProblemID]);


-- =============================================
-- Table: [dbo].[ProblemRecords]
-- Constraint: [PK__ProblemR__FBDF78C928604353] (PRIMARY KEY)
-- =============================================
ALTER TABLE [dbo].[ProblemRecords] ADD CONSTRAINT [PK__ProblemR__FBDF78C928604353] PRIMARY KEY ([RecordID]);


-- =============================================
-- Table: [dbo].[Products]
-- Constraint: [FK_Products_Categories] (FOREIGN KEY)
-- =============================================
ALTER TABLE [dbo].[Products] ADD CONSTRAINT [FK_Products_Categories] FOREIGN KEY ([CategoryID]) REFERENCES [dbo].[Categories] ([CategoryID]);


-- =============================================
-- Table: [dbo].[Products]
-- Constraint: [PK__Products__B40CC6EDE88DC906] (PRIMARY KEY)
-- =============================================
ALTER TABLE [dbo].[Products] ADD CONSTRAINT [PK__Products__B40CC6EDE88DC906] PRIMARY KEY ([ProductID]);


-- =============================================
-- Table: [dbo].[Refunds]
-- Constraint: [FK_Refunds_Payments] (FOREIGN KEY)
-- =============================================
ALTER TABLE [dbo].[Refunds] ADD CONSTRAINT [FK_Refunds_Payments] FOREIGN KEY ([PaymentID]) REFERENCES [dbo].[Payments] ([PaymentID]);


-- =============================================
-- Table: [dbo].[ReleaseDeployments]
-- Constraint: [FK__ReleaseDe__Relea__093F5D4E] (FOREIGN KEY)
-- =============================================
ALTER TABLE [dbo].[ReleaseDeployments] ADD CONSTRAINT [FK__ReleaseDe__Relea__093F5D4E] FOREIGN KEY ([ReleaseID]) REFERENCES [dbo].[Releases] ([ReleaseID]);


-- =============================================
-- Table: [dbo].[ReleaseDeployments]
-- Constraint: [PK__ReleaseD__5EF8D717DDB6A8F2] (PRIMARY KEY)
-- =============================================
ALTER TABLE [dbo].[ReleaseDeployments] ADD CONSTRAINT [PK__ReleaseD__5EF8D717DDB6A8F2] PRIMARY KEY ([DeploymentID]);


-- =============================================
-- Table: [dbo].[ReleaseLogs]
-- Constraint: [FK__ReleaseLo__Relea__0D0FEE32] (FOREIGN KEY)
-- =============================================
ALTER TABLE [dbo].[ReleaseLogs] ADD CONSTRAINT [FK__ReleaseLo__Relea__0D0FEE32] FOREIGN KEY ([ReleaseID]) REFERENCES [dbo].[Releases] ([ReleaseID]);


-- =============================================
-- Table: [dbo].[ReleaseLogs]
-- Constraint: [PK__ReleaseL__5E5499A89DA714FD] (PRIMARY KEY)
-- =============================================
ALTER TABLE [dbo].[ReleaseLogs] ADD CONSTRAINT [PK__ReleaseL__5E5499A89DA714FD] PRIMARY KEY ([LogID]);


-- =============================================
-- Table: [dbo].[Releases]
-- Constraint: [PK__Releases__5D7A69ED4C2ED9F6] (PRIMARY KEY)
-- =============================================
ALTER TABLE [dbo].[Releases] ADD CONSTRAINT [PK__Releases__5D7A69ED4C2ED9F6] PRIMARY KEY ([ReleaseID]);


-- =============================================
-- Table: [dbo].[ReportLogs]
-- Constraint: [FK__ReportLog__Repor__76EBA2E9] (FOREIGN KEY)
-- =============================================
ALTER TABLE [dbo].[ReportLogs] ADD CONSTRAINT [FK__ReportLog__Repor__76EBA2E9] FOREIGN KEY ([ReportID]) REFERENCES [dbo].[Reports] ([ReportID]);


-- =============================================
-- Table: [dbo].[ReportLogs]
-- Constraint: [PK__ReportLo__5E5499A853E0F2E6] (PRIMARY KEY)
-- =============================================
ALTER TABLE [dbo].[ReportLogs] ADD CONSTRAINT [PK__ReportLo__5E5499A853E0F2E6] PRIMARY KEY ([LogID]);


-- =============================================
-- Table: [dbo].[ReportRuns]
-- Constraint: [FK__ReportRun__Repor__7226EDCC] (FOREIGN KEY)
-- =============================================
ALTER TABLE [dbo].[ReportRuns] ADD CONSTRAINT [FK__ReportRun__Repor__7226EDCC] FOREIGN KEY ([ReportID]) REFERENCES [dbo].[Reports] ([ReportID]);


-- =============================================
-- Table: [dbo].[ReportRuns]
-- Constraint: [PK__ReportRu__A259D53D21C74F0E] (PRIMARY KEY)
-- =============================================
ALTER TABLE [dbo].[ReportRuns] ADD CONSTRAINT [PK__ReportRu__A259D53D21C74F0E] PRIMARY KEY ([RunID]);


-- =============================================
-- Table: [dbo].[Reports]
-- Constraint: [PK__Reports__D5BD48E528D5775C] (PRIMARY KEY)
-- =============================================
ALTER TABLE [dbo].[Reports] ADD CONSTRAINT [PK__Reports__D5BD48E528D5775C] PRIMARY KEY ([ReportID]);


-- =============================================
-- Table: [dbo].[Roles]
-- Constraint: [PK__Roles__8AFACE3A53ABE0C7] (PRIMARY KEY)
-- =============================================
ALTER TABLE [dbo].[Roles] ADD CONSTRAINT [PK__Roles__8AFACE3A53ABE0C7] PRIMARY KEY ([RoleID]);


-- =============================================
-- Table: [dbo].[Shipping]
-- Constraint: [FK_Shipping_Transactions] (FOREIGN KEY)
-- =============================================
ALTER TABLE [dbo].[Shipping] ADD CONSTRAINT [FK_Shipping_Transactions] FOREIGN KEY ([TransactionID]) REFERENCES [dbo].[Transactions] ([TransactionID]);


-- =============================================
-- Table: [dbo].[Shipping]
-- Constraint: [PK__Shipping__5FACD460CA9BC227] (PRIMARY KEY)
-- =============================================
ALTER TABLE [dbo].[Shipping] ADD CONSTRAINT [PK__Shipping__5FACD460CA9BC227] PRIMARY KEY ([ShippingID]);


-- =============================================
-- Table: [dbo].[Shipping]
-- Constraint: [UQ__Shipping__784DB3D9F3CD0A8A] (UNIQUE)
-- =============================================
ALTER TABLE [dbo].[Shipping] ADD CONSTRAINT [UQ__Shipping__784DB3D9F3CD0A8A] UNIQUE ([TrackingNumber]);


-- =============================================
-- Table: [dbo].[SupportTickets]
-- Constraint: [FK__SupportTi__Categ__308E3499] (FOREIGN KEY)
-- =============================================
ALTER TABLE [dbo].[SupportTickets] ADD CONSTRAINT [FK__SupportTi__Categ__308E3499] FOREIGN KEY ([CategoryID]) REFERENCES [dbo].[TicketCategories] ([CategoryID]);


-- =============================================
-- Table: [dbo].[SupportTickets]
-- Constraint: [PK__SupportT__712CC627E3C92A30] (PRIMARY KEY)
-- =============================================
ALTER TABLE [dbo].[SupportTickets] ADD CONSTRAINT [PK__SupportT__712CC627E3C92A30] PRIMARY KEY ([TicketID]);


-- =============================================
-- Table: [dbo].[sysdiagrams]
-- Constraint: [PK__sysdiagr__C2B05B61FBB70C8D] (PRIMARY KEY)
-- =============================================
ALTER TABLE [dbo].[sysdiagrams] ADD CONSTRAINT [PK__sysdiagr__C2B05B61FBB70C8D] PRIMARY KEY ([diagram_id]);


-- =============================================
-- Table: [dbo].[sysdiagrams]
-- Constraint: [UK_principal_name] (UNIQUE)
-- =============================================
ALTER TABLE [dbo].[sysdiagrams] ADD CONSTRAINT [UK_principal_name] UNIQUE ([principal_id], [name]);


-- =============================================
-- Table: [dbo].[Taxes]
-- Constraint: [FK_Taxes_Transactions] (FOREIGN KEY)
-- =============================================
ALTER TABLE [dbo].[Taxes] ADD CONSTRAINT [FK_Taxes_Transactions] FOREIGN KEY ([TransactionID]) REFERENCES [dbo].[Transactions] ([TransactionID]);


-- =============================================
-- Table: [dbo].[Taxes]
-- Constraint: [PK__Taxes__711BE08C16587976] (PRIMARY KEY)
-- =============================================
ALTER TABLE [dbo].[Taxes] ADD CONSTRAINT [PK__Taxes__711BE08C16587976] PRIMARY KEY ([TaxID]);


-- =============================================
-- Table: [dbo].[TicketCategories]
-- Constraint: [PK__TicketCa__19093A2B9975A460] (PRIMARY KEY)
-- =============================================
ALTER TABLE [dbo].[TicketCategories] ADD CONSTRAINT [PK__TicketCa__19093A2B9975A460] PRIMARY KEY ([CategoryID]);


-- =============================================
-- Table: [dbo].[TicketLogs]
-- Constraint: [FK__TicketLog__Ticke__36470DEF] (FOREIGN KEY)
-- =============================================
ALTER TABLE [dbo].[TicketLogs] ADD CONSTRAINT [FK__TicketLog__Ticke__36470DEF] FOREIGN KEY ([TicketID]) REFERENCES [dbo].[SupportTickets] ([TicketID]);


-- =============================================
-- Table: [dbo].[TicketLogs]
-- Constraint: [PK__TicketLo__5E5499A8EDF96B9D] (PRIMARY KEY)
-- =============================================
ALTER TABLE [dbo].[TicketLogs] ADD CONSTRAINT [PK__TicketLo__5E5499A8EDF96B9D] PRIMARY KEY ([LogID]);


-- =============================================
-- Table: [dbo].[TransactionItems]
-- Constraint: [FK_TransactionItems_MerchantProductMapping] (FOREIGN KEY)
-- =============================================
ALTER TABLE [dbo].[TransactionItems] ADD CONSTRAINT [FK_TransactionItems_MerchantProductMapping] FOREIGN KEY ([MappingID]) REFERENCES [dbo].[MerchantProductMapping] ([MappingID]);


-- =============================================
-- Table: [dbo].[TransactionItems]
-- Constraint: [FK_TransactionItems_MPM] (FOREIGN KEY)
-- =============================================
ALTER TABLE [dbo].[TransactionItems] ADD CONSTRAINT [FK_TransactionItems_MPM] FOREIGN KEY ([MappingID]) REFERENCES [dbo].[MerchantProductMapping] ([MappingID]);


-- =============================================
-- Table: [dbo].[TransactionItems]
-- Constraint: [FK_TransactionItems_Transactions] (FOREIGN KEY)
-- =============================================
ALTER TABLE [dbo].[TransactionItems] ADD CONSTRAINT [FK_TransactionItems_Transactions] FOREIGN KEY ([TransactionID]) REFERENCES [dbo].[Transactions] ([TransactionID]);


-- =============================================
-- Table: [dbo].[TransactionItems]
-- Constraint: [FK_TransactionItems_Products] (FOREIGN KEY)
-- =============================================
ALTER TABLE [dbo].[TransactionItems] ADD CONSTRAINT [FK_TransactionItems_Products] FOREIGN KEY ([ProductID]) REFERENCES [dbo].[Products] ([ProductID]);


-- =============================================
-- Table: [dbo].[TransactionItems]
-- Constraint: [PK__Transact__0D2BBCBA620D9491] (PRIMARY KEY)
-- =============================================
ALTER TABLE [dbo].[TransactionItems] ADD CONSTRAINT [PK__Transact__0D2BBCBA620D9491] PRIMARY KEY ([TransactionItemID]);


-- =============================================
-- Table: [dbo].[TransactionItems]
-- Constraint: [UQ_TransactionItems_MappingID] (UNIQUE)
-- =============================================
ALTER TABLE [dbo].[TransactionItems] ADD CONSTRAINT [UQ_TransactionItems_MappingID] UNIQUE ([MappingID]);


-- =============================================
-- Table: [dbo].[Transactions]
-- Constraint: [FK_Transactions_BuyerMerchant] (FOREIGN KEY)
-- =============================================
ALTER TABLE [dbo].[Transactions] ADD CONSTRAINT [FK_Transactions_BuyerMerchant] FOREIGN KEY ([BuyerMerchantID]) REFERENCES [dbo].[Merchants] ([MerchantID]);


-- =============================================
-- Table: [dbo].[Transactions]
-- Constraint: [FK_Transactions_SellerMerchant] (FOREIGN KEY)
-- =============================================
ALTER TABLE [dbo].[Transactions] ADD CONSTRAINT [FK_Transactions_SellerMerchant] FOREIGN KEY ([SellerMerchantID]) REFERENCES [dbo].[Merchants] ([MerchantID]);


-- =============================================
-- Table: [dbo].[Transactions]
-- Constraint: [PK__Transact__55433A4B7F4D0E55] (PRIMARY KEY)
-- =============================================
ALTER TABLE [dbo].[Transactions] ADD CONSTRAINT [PK__Transact__55433A4B7F4D0E55] PRIMARY KEY ([TransactionID]);


-- =============================================
-- Table: [dbo].[Users]
-- Constraint: [PK__Users__1788CCAC8D844323] (PRIMARY KEY)
-- =============================================
ALTER TABLE [dbo].[Users] ADD CONSTRAINT [PK__Users__1788CCAC8D844323] PRIMARY KEY ([UserID]);


-- =============================================
-- Table: [dbo].[Users]
-- Constraint: [UQ__Users__A9D10534C975DE60] (UNIQUE)
-- =============================================
ALTER TABLE [dbo].[Users] ADD CONSTRAINT [UQ__Users__A9D10534C975DE60] UNIQUE ([Email]);


-- =============================================
-- Table: [dbo].[UsersData]
-- Constraint: [FK_UsersData_Users] (FOREIGN KEY)
-- =============================================
ALTER TABLE [dbo].[UsersData] ADD CONSTRAINT [FK_UsersData_Users] FOREIGN KEY ([UserID]) REFERENCES [dbo].[Users] ([UserID]);


-- =============================================
-- Table: [dbo].[UsersData]
-- Constraint: [PK__UsersDat__ED49528BC8A7BB1F] (PRIMARY KEY)
-- =============================================
ALTER TABLE [dbo].[UsersData] ADD CONSTRAINT [PK__UsersDat__ED49528BC8A7BB1F] PRIMARY KEY ([UsersDataID]);


-- =============================================
-- Table: [dbo].[UserSessions]
-- Constraint: [PK__UserSess__C9F4927098B594CD] (PRIMARY KEY)
-- =============================================
ALTER TABLE [dbo].[UserSessions] ADD CONSTRAINT [PK__UserSess__C9F4927098B594CD] PRIMARY KEY ([SessionID]);


-- =============================================
-- Table: [dbo].[UsersRoles]
-- Constraint: [FK_UsersRoles_Roles] (FOREIGN KEY)
-- =============================================
ALTER TABLE [dbo].[UsersRoles] ADD CONSTRAINT [FK_UsersRoles_Roles] FOREIGN KEY ([RoleID]) REFERENCES [dbo].[Roles] ([RoleID]);


-- =============================================
-- Table: [dbo].[UsersRoles]
-- Constraint: [FK_UsersRoles_Users] (FOREIGN KEY)
-- =============================================
ALTER TABLE [dbo].[UsersRoles] ADD CONSTRAINT [FK_UsersRoles_Users] FOREIGN KEY ([UserID]) REFERENCES [dbo].[Users] ([UserID]);


-- =============================================
-- Table: [dbo].[UsersRoles]
-- Constraint: [PK__UsersRol__AF27604F6CED457E] (PRIMARY KEY)
-- =============================================
ALTER TABLE [dbo].[UsersRoles] ADD CONSTRAINT [PK__UsersRol__AF27604F6CED457E] PRIMARY KEY ([UserID], [RoleID]);


-- =============================================
-- Table: [dbo].[WalletTransactions]
-- Constraint: [FK_WalletTransactions_Transactions] (FOREIGN KEY)
-- =============================================
ALTER TABLE [dbo].[WalletTransactions] ADD CONSTRAINT [FK_WalletTransactions_Transactions] FOREIGN KEY ([TransactionID]) REFERENCES [dbo].[Transactions] ([TransactionID]);


-- =============================================
-- Table: [dbo].[WalletTransactions]
-- Constraint: [FK_WalletTransactions_DigitalWallets] (FOREIGN KEY)
-- =============================================
ALTER TABLE [dbo].[WalletTransactions] ADD CONSTRAINT [FK_WalletTransactions_DigitalWallets] FOREIGN KEY ([WalletID]) REFERENCES [dbo].[DigitalWallets] ([WalletID]);



Completion time: 2026-09-06T19:30:28.9072975+03:00
