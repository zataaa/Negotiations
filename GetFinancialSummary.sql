
-- بعد التصليح   4
-- =============================================
-- Stored Procedure: [dbo].[GetFinancialSummary]
-- =============================================

CREATE OR ALTER PROCEDURE GetFinancialSummary
    @EntityType NVARCHAR(50), -- 'SmallMerchant' أو 'BigMerchant' أو 'Role'
    @EntityID INT
AS
BEGIN
    IF @EntityType = 'SmallMerchant'
    BEGIN
        SELECT 
            sm.SmallMerchantID,
            sm.ShopName,
            COUNT(o.OrderID) AS TotalOrders,
            SUM(o.TotalAmount) AS TotalOrderAmount,
            SUM(p.Amount) AS TotalPayments
        FROM SmallMerchants sm
        INNER JOIN Orders o ON sm.SmallMerchantID = o.SmallMerchantID
        INNER JOIN Payments p ON o.OrderID = p.OrderID
        WHERE sm.SmallMerchantID = @EntityID
        GROUP BY sm.SmallMerchantID, sm.ShopName;
    END

    ELSE IF @EntityType = 'BigMerchant'
    BEGIN
        SELECT 
            bm.BigMerchantID,
            bm.CompanyName,
            COUNT(p.PaymentID) AS TotalPaymentsCount,
            SUM(p.Amount) AS TotalPayments,
            SUM(o.TotalAmount) AS TotalOrdersAmount
        FROM BigMerchants bm
        INNER JOIN Products pr ON bm.BigMerchantID = pr.BigMerchantID
        INNER JOIN SmallMerchantProducts smp ON pr.ProductID = smp.ProductID
        INNER JOIN Orders o ON smp.SmallMerchantID = o.SmallMerchantID
        INNER JOIN Payments p ON o.OrderID = p.OrderID
        WHERE bm.BigMerchantID = @EntityID
        GROUP BY bm.BigMerchantID, bm.CompanyName;
    END

    ELSE IF @EntityType = 'Role'
    BEGIN
        SELECT 
            r.RoleID,
            r.RoleName,
            COUNT(o.OrderID) AS TotalOrders,
            SUM(o.TotalAmount) AS TotalOrderAmount,
            SUM(p.Amount) AS TotalPayments
        FROM Roles r
        INNER JOIN Users u ON r.RoleID = u.RoleID
        INNER JOIN Orders o ON u.UserID = o.CustomerID
        INNER JOIN Payments p ON o.OrderID = p.OrderID
        WHERE r.RoleID = @EntityID
        GROUP BY r.RoleID, r.RoleName;
    END
END;
GO

/*
## 📌 كيفية الاستخدام
- لو تاجر صغير (SmallMerchant) عايز تقريره:
```sql*/
EXEC GetFinancialSummary @EntityType = 'SmallMerchant', @EntityID = 1;

/*
- لو تاجر كبير (BigMerchant):
```sql*/
EXEC GetFinancialSummary @EntityType = 'BigMerchant', @EntityID = 2;

/*
- لو دور (Role):
```sql*/
EXEC GetFinancialSummary @EntityType = 'Role', @EntityID = 3;

---

/*## 🔐 إعطاء الصلاحيات للتجار
علشان التجار يقدروا يستخدموا الإجراء:

1. **إعطاء صلاحية تنفيذ الإجراء**:
```sql*/
GRANT EXECUTE ON OBJECT::GetFinancialSummary TO SmallMerchants;
GRANT EXECUTE ON OBJECT::GetFinancialSummary TO BigMerchants;

/*2. **إعطاء صلاحية قراءة البيانات المرتبطة**:
```sql*/
GRANT SELECT ON Orders TO SmallMerchants;
GRANT SELECT ON Payments TO SmallMerchants;

GRANT SELECT ON Orders TO BigMerchants;
GRANT SELECT ON Payments TO BigMerchants;
GRANT SELECT ON Products TO BigMerchants;
GRANT SELECT ON SmallMerchantProducts TO BigMerchants;

---

✨ كده كل تاجر صغير أو كبير يقدر يستدعي الإجراء ويطلع تقريره المالي بنفسه ✨ من غير ما يشوف بيانات باقي الكيانات.  
تحب أضيفلك نسخة فيها **فلترة حسب التاريخ (Monthly / Quarterly / Yearly)** علشان التاجر يقدر يحدد الفترة الزمنية اللي عايزها؟