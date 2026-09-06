
ALTER TABLE Transactions
DROP CONSTRAINT FK_Transactions_SellerMerchant;

--  FK_Merchants_Transactions لا يوجد
/*Msg 3728, Level 16, State 1, Line 6
'FK_Merchants_Buyer' is not a constraint.
Msg 3727, Level 16, State 0, Line 6
Could not drop constraint. See previous errors.*/

--FK_Merchants_Buyer لا يوجد
/*Msg 3728, Level 16, State 1, Line 6
'FK_Merchants_Buyer' is not a constraint.
Msg 3727, Level 16, State 0, Line 6
Could not drop constraint. See previous errors.*/

--FK_Merchants_Seller لا يوجد
/*Msg 3728, Level 16, State 1, Line 6
'FK_Merchants_Buyer' is not a constraint.
Msg 3727, Level 16, State 0, Line 6
Could not drop constraint. See previous errors.*/

/* موجود
ALTER TABLE [dbo].[MerchantTransactions] ADD CONSTRAINT [FK_MerchantTransactions_Transaction] 
    FOREIGN KEY ([TransactionID]) REFERENCES [dbo].[Transactions] ([TransactionID]);*/

     /* موجود
ALTER TABLE [dbo].[TransactionItems] 
ADD CONSTRAINT [FK_TransactionItems_MerchantProductMapping] 
FOREIGN KEY ([MappingID]) REFERENCES [dbo].[MerchantProductMapping] ([MappingID]);*/

/* موجود
ALTER TABLE [dbo].[TransactionItems] 
ADD CONSTRAINT [FK_TransactionItems_Products] FOREIGN KEY ([ProductID]) 
REFERENCES [dbo].[Products] ([ProductID]);*/
