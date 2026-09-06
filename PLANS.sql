


1. **وعليكم السلام يا علاء.** نعم، نعمل خطة أسبوعية كاملة لإنهاء مشروعك، من تثبيت قاعدة البيانات إلى تشغيل الـ.NET والاختبار. ولن ننتقل إلى خطوة جديدة قبل مراجعة نتيجة الخطوة السابقة.

2. **القاعدة التي سنلتزم بها:** لا نكتب Controllers أو نعدّل Models قبل تثبيت الـDatabase Design. وأي علاقة غير مؤكدة نضعها للمراجعة، بدل ما نخمنها.

3. **الأسبوع الأول سيكون خاصًا بقاعدة البيانات فقط**، لأن هذا هو الأساس الذي سيحدد صحة الـModels والـControllers لاحقًا.


## 4. خطة إتمام مشروع .NET — 8 أسابيع

### الأسبوع 1 — تثبيت قاعدة البيانات والعلاقات

**الهدف:** نخرج بقاعدة بيانات نهائية، وليس مجرد Diagram.

1. مراجعة جميع الجداول الموجودة في `AMENDED.sql`.
2. تثبيت أسماء الجداول والأعمدة.
3. مراجعة جميع الـPK.
4. مراجعة جميع الـFK.
5. مراجعة العلاقات الخاصة بـ:

   * `Users`
   * `DigitalWallets`
   * `Merchants`
   * `Products`
   * `MerchantProductMapping`
   * `Transactions`
   * `TransactionItems`
   * `MerchantTransactions`
   * `Ledger`
6. مراجعة الجداول التي قررنا حذفها:

   * `Orders`
   * `OrderDetails`
   * `Customers`
   * `CustomerProfile`
7. مراجعة `IDENTITY(1,1)` لكل جدول.
8. مراجعة `NULL / NOT NULL`.
9. مراجعة `DEFAULT / CHECK / UNIQUE`.
10. استخراج نسخة نهائية من:

    * `CREATE TABLE.sql`
    * `PRIMARY KEY.sql`
    * `FOREIGN KEY.sql`

**نتيجة الأسبوع:**
`Database Design v1.0`

---

### الأسبوع 2 — تنظيف SQL Server وإنشاء قاعدة البيانات النهائية

**الهدف:** قاعدة البيانات تعمل بدون أخطاء.

1. مراجعة الجداول الموجودة فعليًا في SQL Server.
2. مقارنة الجداول مع `AMENDED.sql`.
3. حذف الجداول القديمة غير المطلوبة.
4. تعديل الأعمدة والأسماء.
5. إنشاء الـPK.
6. إنشاء الـFK.
7. إنشاء الـUNIQUE والـCHECK.
8. مراجعة الـIndexes.
9. مراجعة الـTriggers.
10. مراجعة الـViews.
11. مراجعة الـStored Procedures.
12. تشغيل Queries للتأكد من عدم وجود:

    * FK مكرر.
    * PK مكرر.
    * FK يشير إلى جدول محذوف.
    * أعمدة غير موجودة.
    * بيانات تخالف العلاقات.

**نتيجة الأسبوع:**
`Database v1.0 جاهزة للربط مع .NET`

---

### الأسبوع 3 — ربط ASP.NET بـ SQL Server

**الهدف:** المشروع يتصل بقاعدة البيانات بنجاح.

1. مراجعة `Program.cs`.
2. مراجعة `appsettings.json`.
3. مراجعة `ConnectionString`.
4. مراجعة `AppDbContext`.
5. إضافة جميع `DbSet`.
6. مراجعة أسماء الـModels.
7. مراجعة `OnModelCreating`.
8. مراجعة العلاقات داخل EF Core.
9. تشغيل المشروع.
10. اختبار الاتصال بقاعدة البيانات.

**نتيجة الأسبوع:**
`.NET → SQL Server` يعملان معًا.

---

### الأسبوع 4 — Models & Controllers

**الهدف:** كل جدول له Model صحيح وController مناسب.

1. مراجعة جميع الـModels.
2. مقارنة كل Model مع الجدول الحقيقي.
3. مراجعة:

   * PK
   * FK
   * Data Types
   * Required
   * MaxLength
   * Nullable
4. إنشاء أو تعديل Controllers.
5. مراجعة أسماء الـRoutes.
6. مراجعة CRUD:

   * Create
   * Read
   * Update
   * Delete
7. اختبار كل Controller من Swagger.

**نتيجة الأسبوع:**
كل الجداول الأساسية تعمل من خلال API.

---

### الأسبوع 5 — Users & Security

**الهدف:** نظام المستخدمين والصلاحيات يعمل.

1. `Users`
2. `UsersData`
3. `Roles`
4. `UsersRoles`
5. `UserSessions`
6. `AuthenticationLogs`
7. تسجيل مستخدم.
8. تسجيل دخول.
9. تسجيل خروج.
10. تشفير كلمات المرور.
11. JWT Authentication.
12. Role-based Authorization.
13. اختبار صلاحيات المستخدمين.

**نتيجة الأسبوع:**
المستخدم يسجل الدخول، وتُطبّق صلاحياته.

---

### الأسبوع 6 — Merchants & Commerce

**الهدف:** دورة التجارة الأساسية تعمل.

1. `Merchants`
2. `Products`
3. `Categories`
4. `MerchantProductMapping`
5. `Transactions`
6. `TransactionItems`
7. `MerchantTransactions`
8. `Payments`
9. `Refunds`
10. `Ledger`
11. إنشاء منتج.
12. ربط المنتج بMerchant.
13. إنشاء Transaction.
14. إضافة TransactionItems.
15. تسجيل Payment.
16. تسجيل Refund.
17. تسجيل Ledger Entry.
18. اختبار Seller / Buyer.

**نتيجة الأسبوع:**
دورة التجارة الأساسية تعمل من البداية للنهاية.

---

### الأسبوع 7 — Reports & Monitoring

**الهدف:** التقارير والمراقبة تعمل.

1. `Reports`
2. `ReportRuns`
3. `ReportLogs`
4. `ForecastingReports`
5. `ForecastingHistory`
6. `IncidentTypes`
7. `IncidentReports`
8. `ProblemCatalog`
9. `ProblemRecords`
10. `ProblemLogs`
11. `AvailabilityTargets`
12. `AvailabilityRecords`
13. `AvailabilityLogs`
14. `CapacityTargets`
15. `CapacityRecords`
16. `CapacityLogs`
17. `SupportTickets`
18. `TicketCategories`
19. `TicketLogs`

**نتيجة الأسبوع:**
التقارير والمراقبة الأساسية تعمل.

---

### الأسبوع 8 — Configuration / Continuity / Releases / Final Testing

**الهدف:** إنهاء الأجزاء الإدارية والاختبار النهائي.

1. `ChangeRequests`
2. `ChangeApprovals`
3. `ChangeLogs`
4. `ConfigItems`
5. `ConfigChanges`
6. `ConfigLogs`
7. `ContinuityPlans`
8. `ContinuityLogs`
9. `ContinuityTests`
10. `Releases`
11. `ReleaseDeployments`
12. `ReleaseLogs`
13. مراجعة جميع الـControllers.
14. اختبار جميع الـEndpoints.
15. اختبار العلاقات.
16. اختبار الصلاحيات.
17. اختبار الأخطاء.
18. اختبار البيانات.
19. تنظيف الكود.
20. تجهيز نسخة Production.

**نتيجة الأسبوع:**
`WebApplication1` جاهز للاختبار النهائي.

---

## 5. ترتيب العمل داخل كل أسبوع

كل أسبوع نعمل بنفس الطريقة:

```text
1. Review
2. Correct
3. Execute
4. Test
5. Confirm
6. Move to next week
```

### مثال

```text
Database
   ↓
AppDbContext
   ↓
Models
   ↓
Controllers
   ↓
API
   ↓
Swagger
   ↓
Testing
```

**لا ننتقل من Database إلى Models قبل أن نتأكد أن Database صحيحة.**

---

## 6. أول واجب لك الآن — الأسبوع الأول

أنت تعمل الـDiagram، وأنا أراجع معك.

**المطلوب منك الآن فقط:**

1. إكمال جميع علاقات الـERD.
2. مراجعة `DigitalWallets → Users`.
3. مراجعة `MerchantTransactions`.
4. مراجعة `Ledger`.
5. مراجعة Seller / Buyer.
6. مراجعة أي علاقة ناقصة.
7. إرسال النسخة النهائية من الـDiagram.

**بعدها نبدأ الأسبوع الثاني: تنظيف SQL Server وإنشاء قاعدة البيانات النهائية.**

### English — Weekly Plan

1. **Week 1:** Finalize database design and relationships.
2. **Week 2:** Clean and finalize SQL Server.
3. **Week 3:** Connect ASP.NET to SQL Server.
4. **Week 4:** Finalize Models and Controllers.
5. **Week 5:** Users, Authentication, and Roles.
6. **Week 6:** Merchants, Products, Transactions, Payments, and Ledger.
7. **Week 7:** Reports, Forecasting, Incidents, Availability, Capacity, and Support.
8. **Week 8:** Configuration, Continuity, Releases, and final testing.

**We start with Week 1 only.**


   

