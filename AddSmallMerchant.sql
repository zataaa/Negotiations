/* 1. */
--1.1 DROP
DROP PROCEDURE dbo.AddBigMerchant;
--1.2 CREATE PROCEDURE
-- =============================================
-- Stored Procedure: [dbo].[AddBigMerchant]
-- =============================================

CREATE PROCEDURE AddBigMerchants
    @BigMerchantID INT,
    @CompanyName NVARCHAR(200),
    @TaxNumber NVARCHAR(100) = NULL
AS
BEGIN
    INSERT INTO BigMerchant (BigMerchantID, CompanyName, TaxNumber, CreatedAt)
    VALUES (@BigMerchantID, @CompanyName, @TaxNumber, GETDATE());
END;
GO

--END-1.5
DROP TABLE IF EXISTS dbo.BigMerchant;

/* 2.*/

--2.1 DROP
DROP PROCEDURE dbo.AddSmallMerchant;
--2.2 CREATE PROCEDURE
-- =============================================
-- Stored Procedure: [dbo].[AddSmallMerchant]
-- =============================================

CREATE PROCEDURE AddSmallMerchant
    @SmallMerchantID INT,
    @ShopName NVARCHAR(200),
    @LicenseNumber NVARCHAR(100) = NULL
AS
BEGIN
    INSERT INTO SmallMerchant (SmallMerchantID, ShopName, LicenseNumber, CreatedAt)
    VALUES (@SmallMerchantID, @ShopName, @LicenseNumber, GETDATE());
END;
GO

--END-2.5
DROP TABLE IF EXISTS dbo.SmallMerchant;

DROP PROCEDURE IF EXISTS dbo.AddSmallMerchant;
DROP PROCEDURE IF EXISTS dbo.AddBigMerchant;
DROP PROCEDURE IF EXISTS dbo.GetAllEntitiesLedgerSummaryPivot;

DROP VIEW IF EXISTS dbo.SmallMerchantView;
DROP VIEW IF EXISTS dbo.BigMerchantView;
