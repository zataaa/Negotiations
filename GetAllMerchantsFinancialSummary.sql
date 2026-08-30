-- بعد التصليح   3

-- =============================================
-- Stored Procedure: [dbo].[GetAllMerchantsFinancialSummary]
-- =============================================

تمام يا علاء الدين 👌  
خلينا نعدل الإجراء **GetAllMerchantsFinancialSummary** بحيث يعتمد على الجداول الصحيحة **SmallMerchants** و **BigMerchants** فقط، ونوضحلك كمان كيفية الاستخدام وإعطاء الصلاحيات للتجار.

---

## ⚙️ Stored Procedure: `GetAllMerchantsFinancialSummary`
```sql
CREATE OR ALTER PROCEDURE GetAllMerchantsFinancialSummary
AS
BEGIN
    -- 🔹 ملخص للتجار الصغار (SmallMerchants)
    SELECT 
        'SmallMerchant' AS MerchantType,
        sm.SmallMerchantID AS MerchantID,
        sm.ShopName AS MerchantName,
        COUNT(o.OrderID) AS TotalOrders,
        SUM(o.TotalAmount) AS TotalOrderAmount,
        SUM(p.Amount) AS TotalPayments
    FROM SmallMerchants sm
    INNER JOIN Orders o ON sm.SmallMerchantID = o.SmallMerchantID
    INNER JOIN Payments p ON o.OrderID = p.OrderID
    GROUP BY sm.SmallMerchantID, sm.ShopName

    UNION ALL

    -- 🔹 ملخص للتجار الكبار (BigMerchants)
    SELECT 
        'BigMerchant' AS MerchantType,
        bm.BigMerchantID AS MerchantID,
        bm.CompanyName AS MerchantName,
        COUNT(p.PaymentID) AS TotalPaymentsCount,
        SUM(p.Amount) AS TotalPayments,
        SUM(o.TotalAmount) AS TotalOrdersAmount
    FROM BigMerchants bm
    INNER JOIN Products pr ON bm.BigMerchantID = pr.BigMerchantID
    INNER JOIN SmallMerchantProducts smp ON pr.ProductID = smp.ProductID
    INNER JOIN Orders o ON smp.SmallMerchantID = o.SmallMerchantID
    INNER JOIN Payments p ON o.OrderID = p.OrderID
    GROUP BY bm.BigMerchantID, bm.CompanyName;
END;
GO

/*
---

## 📌 كيفية الاستخدام
- لتنفيذ الإجراء وعرض ملخص كل التجار:
```sql*/
EXEC GetAllMerchantsFinancialSummary;

/*
- النتيجة هتكون جدول فيه كل التجار (صغار وكبار) مع عدد الطلبات، إجمالي الطلبات، وإجمالي المدفوعات.

---*/

/*## 🔐 إعطاء الصلاحيات للتجار
علشان التجار يقدروا يستخدموا الإجراء:

1. **إعطاء صلاحية تنفيذ الإجراء**:
```sql*/
GRANT EXECUTE ON OBJECT::GetAllMerchantsFinancialSummary TO SmallMerchants;
GRANT EXECUTE ON OBJECT::GetAllMerchantsFinancialSummary TO BigMerchants;

/*2. **إعطاء صلاحية قراءة البيانات المرتبطة**:
```sql*/
GRANT SELECT ON Orders TO SmallMerchants;
GRANT SELECT ON Payments TO SmallMerchants;

GRANT SELECT ON Orders TO BigMerchants;
GRANT SELECT ON Payments TO BigMerchants;
GRANT SELECT ON Products TO BigMerchants;
GRANT SELECT ON SmallMerchantProducts TO BigMerchants;

---
/*
✨ كده كل تاجر صغير أو كبير يقدر يستدعي الإجراء ويطلع تقريره المالي بنفسه، من غير ما يشوف بيانات باقي الكيانات.  
تحب أضيفلك نسخة فيها **باراميتر @MerchantType** بحيث تاجر يقدر يطلب تقريره فقط (SmallMerchant أو BigMerchant) بدل ما يشوف الكل؟
*/