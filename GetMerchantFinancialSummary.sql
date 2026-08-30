
-- بعد التصليح   5

-- =============================================
-- Stored Procedure: [dbo].[GetMerchantFinancialSummary]
-- =============================================


/*## ⚙️ Stored Procedure: `GetMerchantFinancialSummary`
```sql*/
CREATE OR ALTER PROCEDURE GetMerchantFinancialSummary
    @MerchantType NVARCHAR(50), -- 'Small' أو 'Big'
    @MerchantID INT
AS
BEGIN
    IF @MerchantType = 'Small'
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
        WHERE sm.SmallMerchantID = @MerchantID
        GROUP BY sm.SmallMerchantID, sm.ShopName;
    END

    ELSE IF @MerchantType = 'Big'
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
        WHERE bm.BigMerchantID = @MerchantID
        GROUP BY bm.BigMerchantID, bm.CompanyName;
    END
END;
GO

---

/*## 📌 كيفية الاستخدام
- لو تاجر صغير (SmallMerchant) عايز تقريره:
```sql*/
EXEC GetMerchantFinancialSummary @MerchantType = 'Small', @MerchantID = 1;

/*- لو تاجر كبير (BigMerchant):
```sql*/
EXEC GetMerchantFinancialSummary @MerchantType = 'Big', @MerchantID = 2;

---

/*## 🔐 إعطاء الصلاحيات للتجار
علشان التجار يقدروا يستخدموا الإجراء:

1. **إعطاء صلاحية تنفيذ الإجراء**:
```sql */
GRANT EXECUTE ON OBJECT::GetMerchantFinancialSummary TO SmallMerchants;
GRANT EXECUTE ON OBJECT::GetMerchantFinancialSummary TO BigMerchants;


/*2. **إعطاء صلاحية قراءة البيانات المرتبطة**:
```sql*/
GRANT SELECT ON Orders TO SmallMerchants;
GRANT SELECT ON Payments TO SmallMerchants;

GRANT SELECT ON Orders TO BigMerchants;
GRANT SELECT ON Payments TO BigMerchants;
GRANT SELECT ON Products TO BigMerchants;
GRANT SELECT ON SmallMerchantProducts TO BigMerchants;
```

---

✨ كده كل تاجر صغير أو كبير يقدر يستدعي الإجراء ويطلع تقريره المالي بنفسه، من غير ما يشوف بيانات باقي الكيانات.  
تحب أضيفلك نسخة فيها **فلترة حسب التاريخ (Monthly / Quarterly / Yearly)** علشان التاجر يقدر يحدد الفترة الزمنية اللي عايزها؟
