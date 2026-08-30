
-- بعد التصليح  1

-- =============================================
-- Stored Procedure: [dbo].[GetAllEntitiesLedgerSummaryPivot]
-- =============================================

CREATE OR ALTER PROCEDURE GetAllEntitiesLedgerSummaryPivot
AS
BEGIN
    ;WITH EntityLedger AS (
        SELECT 
            CASE 
                WHEN u.UserID IS NOT NULL THEN 'User'
                WHEN r.RoleID IS NOT NULL THEN 'Role'
                WHEN sm.SmallMerchantID IS NOT NULL THEN 'SmallMerchant'
                WHEN bm.BigMerchantID IS NOT NULL THEN 'BigMerchant'
            END AS EntityType,
            ISNULL(u.UserID, ISNULL(r.RoleID, ISNULL(sm.SmallMerchantID, bm.BigMerchantID))) AS EntityID,
            ISNULL(u.UserName, ISNULL(r.RoleName, ISNULL(sm.ShopName, bm.CompanyName))) AS EntityName,
            YEAR(l.TransactionDate) AS Year,
            MONTH(l.TransactionDate) AS Month,
            DATEPART(QUARTER, l.TransactionDate) AS Quarter,
            SUM(CASE WHEN l.DebitCredit = 'Debit' THEN l.Amount ELSE 0 END) AS TotalDebits,
            SUM(CASE WHEN l.DebitCredit = 'Credit' THEN l.Amount ELSE 0 END) AS TotalCredits,
            SUM(l.Amount) AS NetAmount
        FROM Ledger l
        LEFT JOIN Payments p ON l.ReferenceID = p.PaymentID AND l.TransactionType = 'Payment'
        LEFT JOIN Orders o ON p.OrderID = o.OrderID
        LEFT JOIN Users u ON o.CustomerID = u.UserID
        LEFT JOIN Roles r ON u.RoleID = r.RoleID
        LEFT JOIN SmallMerchants sm ON o.SmallMerchantID = sm.SmallMerchantID
        LEFT JOIN SmallMerchantProducts smp ON sm.SmallMerchantID = smp.SmallMerchantID
        LEFT JOIN Products pr ON smp.ProductID = pr.ProductID
        LEFT JOIN BigMerchants bm ON pr.BigMerchantID = bm.BigMerchantID
        GROUP BY 
            CASE 
                WHEN u.UserID IS NOT NULL THEN 'User'
                WHEN r.RoleID IS NOT NULL THEN 'Role'
                WHEN sm.SmallMerchantID IS NOT NULL THEN 'SmallMerchant'
                WHEN bm.BigMerchantID IS NOT NULL THEN 'BigMerchant'
            END,
            ISNULL(u.UserID, ISNULL(r.RoleID, ISNULL(sm.SmallMerchantID, bm.BigMerchantID))),
            ISNULL(u.UserName, ISNULL(r.RoleName, ISNULL(sm.ShopName, bm.CompanyName))),
            YEAR(l.TransactionDate),
            MONTH(l.TransactionDate),
            DATEPART(QUARTER, l.TransactionDate)
    )
    -- 🔹 Monthly Report
    SELECT 'Monthly' AS ReportType, EntityType, EntityID, EntityName, Year, Month,
           SUM(TotalDebits) AS TotalDebits, SUM(TotalCredits) AS TotalCredits, SUM(NetAmount) AS NetAmount
    FROM EntityLedger
    GROUP BY EntityType, EntityID, EntityName, Year, Month

    UNION ALL

    -- 🔹 Quarterly Report
    SELECT 'Quarterly' AS ReportType, EntityType, EntityID, EntityName, Year, Quarter,
           SUM(TotalDebits) AS TotalDebits, SUM(TotalCredits) AS TotalCredits, SUM(NetAmount) AS NetAmount
    FROM EntityLedger
    GROUP BY EntityType, EntityID, EntityName, Year, Quarter

    UNION ALL

    -- 🔹 Yearly Report
    SELECT 'Yearly' AS ReportType, EntityType, EntityID, EntityName, Year, NULL AS Quarter,
           SUM(TotalDebits) AS TotalDebits, SUM(TotalCredits) AS TotalCredits, SUM(NetAmount) AS NetAmount
    FROM EntityLedger
    GROUP BY EntityType, EntityID, EntityName, Year

    ORDER BY EntityType, EntityName, Year, ReportType;
END;
GO

--1.
EXEC GetAllEntitiesLedgerSummaryPivot;

--2. أو فلترة مباشرة
SELECT *
FROM GetAllEntitiesLedgerSummaryPivotResult -- لو عملت View أو Table-Valued Function
WHERE ReportType = 'Monthly';

-- ⚙️ الـ EXEC المستخدم هنا
-- لتنفيذ الإجراء:

EXEC GetAllEntitiesLedgerSummaryPivot;

-- لو عايز تحدد نوع التقرير في نفس الاستدعاء، ممكن نعدل الإجراء ونضيف باراميتر اسمه مثلًا @ReportType، وبكده تقدر تعمل:

EXEC GetAllEntitiesLedgerSummaryPivot @ReportType = 'Monthly';
EXEC GetAllEntitiesLedgerSummaryPivot @ReportType = 'Quarterly';
EXEC GetAllEntitiesLedgerSummaryPivot @ReportType = 'Yearly';

           /*-----------------------------------------------END----------------------------------------------------------*/