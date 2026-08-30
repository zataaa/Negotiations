
-- بعد التصليح  2
-- =============================================
-- Stored Procedure: [dbo].[GetAllEntitiesLedgerSummary]
-- =============================================

CREATE OR ALTER PROCEDURE GetAllEntitiesLedgerSummary
AS
BEGIN
    -- 🔹 ملخص مالي للمستخدمين
    SELECT 
        'User' AS EntityType,
        u.UserID AS EntityID,
        u.UserName AS EntityName,
        YEAR(l.TransactionDate) AS Year,
        DATEPART(QUARTER, l.TransactionDate) AS Quarter,
        SUM(CASE WHEN l.DebitCredit = 'Debit' THEN l.Amount ELSE 0 END) AS TotalDebits,
        SUM(CASE WHEN l.DebitCredit = 'Credit' THEN l.Amount ELSE 0 END) AS TotalCredits,
        SUM(l.Amount) AS NetAmount
    FROM Users u
    INNER JOIN Orders o ON u.UserID = o.CustomerID
    INNER JOIN Payments p ON o.OrderID = p.OrderID
    INNER JOIN Ledger l ON l.ReferenceID = p.PaymentID AND l.TransactionType = 'Payment'
    GROUP BY u.UserID, u.UserName, YEAR(l.TransactionDate), DATEPART(QUARTER, l.TransactionDate)

    UNION ALL

    -- 🔹 ملخص للأدوار
    SELECT 
        'Role' AS EntityType,
        r.RoleID AS EntityID,
        r.RoleName AS EntityName,
        YEAR(l.TransactionDate) AS Year,
        DATEPART(QUARTER, l.TransactionDate) AS Quarter,
        SUM(CASE WHEN l.DebitCredit = 'Debit' THEN l.Amount ELSE 0 END) AS TotalDebits,
        SUM(CASE WHEN l.DebitCredit = 'Credit' THEN l.Amount ELSE 0 END) AS TotalCredits,
        SUM(l.Amount) AS NetAmount
    FROM Roles r
    INNER JOIN Users u ON r.RoleID = u.RoleID
    INNER JOIN Orders o ON u.UserID = o.CustomerID
    INNER JOIN Payments p ON o.OrderID = p.OrderID
    INNER JOIN Ledger l ON l.ReferenceID = p.PaymentID AND l.TransactionType = 'Payment'
    GROUP BY r.RoleID, r.RoleName, YEAR(l.TransactionDate), DATEPART(QUARTER, l.TransactionDate)

    UNION ALL

    -- 🔹 ملخص للتجار الصغار (SmallMerchants)
    SELECT 
        'SmallMerchant' AS EntityType,
        sm.SmallMerchantID AS EntityID,
        sm.ShopName AS EntityName,
        YEAR(l.TransactionDate) AS Year,
        DATEPART(QUARTER, l.TransactionDate) AS Quarter,
        SUM(CASE WHEN l.DebitCredit = 'Debit' THEN l.Amount ELSE 0 END) AS TotalDebits,
        SUM(CASE WHEN l.DebitCredit = 'Credit' THEN l.Amount ELSE 0 END) AS TotalCredits,
        SUM(l.Amount) AS NetAmount
    FROM SmallMerchants sm
    INNER JOIN Orders o ON sm.SmallMerchantID = o.SmallMerchantID
    INNER JOIN Payments p ON o.OrderID = p.OrderID
    INNER JOIN Ledger l ON l.ReferenceID = p.PaymentID AND l.TransactionType = 'Payment'
    GROUP BY sm.SmallMerchantID, sm.ShopName, YEAR(l.TransactionDate), DATEPART(QUARTER, l.TransactionDate)

    UNION ALL

    -- 🔹 ملخص للتجار الكبار (BigMerchants)
    SELECT 
        'BigMerchant' AS EntityType,
        bm.BigMerchantID AS EntityID,
        bm.CompanyName AS EntityName,
        YEAR(l.TransactionDate) AS Year,
        DATEPART(QUARTER, l.TransactionDate) AS Quarter,
        SUM(CASE WHEN l.DebitCredit = 'Debit' THEN l.Amount ELSE 0 END) AS TotalDebits,
        SUM(CASE WHEN l.DebitCredit = 'Credit' THEN l.Amount ELSE 0 END) AS TotalCredits,
        SUM(l.Amount) AS NetAmount
    FROM BigMerchants bm
    INNER JOIN Products pr ON bm.BigMerchantID = pr.BigMerchantID
    INNER JOIN SmallMerchantProducts smp ON pr.ProductID = smp.ProductID
    INNER JOIN Orders o ON smp.SmallMerchantID = o.SmallMerchantID
    INNER JOIN Payments p ON o.OrderID = p.OrderID
    INNER JOIN Ledger l ON l.ReferenceID = p.PaymentID AND l.TransactionType = 'Payment'
    GROUP BY bm.BigMerchantID, bm.CompanyName, YEAR(l.TransactionDate), DATEPART(QUARTER, l.TransactionDate);
END;
GO


/*
## 📌 كيفية الاستخدام
بعد ما تحفظ الإجراء في قاعدة البيانات، أي مستخدم أو تاجر يقدر يستدعيه كالتالي:

```sql*/
EXEC GetAllEntitiesLedgerSummary;

/*
ده هيطلع ملخص مالي لكل الكيانات (Users, Roles, SmallMerchants, BigMerchants) على مستوى ربع سنوي وسنوي.  
ولو عايز تعرض النتائج في **Power BI** أو أي Dashboard، ببساطة تربط الـ Stored Procedure كمصدر بيانات وتفلتر حسب `EntityType`.

---

## 🔐 إعطاء الصلاحيات للتجار
علشان التجار (SmallMerchants و BigMerchants) يقدروا يستخدموا الإجراء:

1. **إعطاء صلاحية تنفيذ الإجراء**:
```sql*/
GRANT EXECUTE ON OBJECT::GetAllEntitiesLedgerSummary TO SmallMerchants;
GRANT EXECUTE ON OBJECT::GetAllEntitiesLedgerSummary TO BigMerchants;


/*> هنا لازم يكون عندك **Users أو Roles** في SQL Server باسم التجار أو مرتبطين بالجداول دي. لو عندك Login/Role للتجار، تديهم الصلاحية مباشرة.

2. **إعطاء صلاحية قراءة البيانات**:  
التجار محتاجين صلاحية `SELECT` على الجداول المرتبطة (Orders, Payments, Ledger). مثال:
```sql*/
GRANT SELECT ON Orders TO SmallMerchants;
GRANT SELECT ON Payments TO SmallMerchants;
GRANT SELECT ON Ledger TO SmallMerchants;

GRANT SELECT ON Orders TO BigMerchants;
GRANT SELECT ON Payments TO BigMerchants;
GRANT SELECT ON Ledger TO BigMerchants;


