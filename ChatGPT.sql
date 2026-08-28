تمام. لن أدخل في الحل الآن. هذا **الواجب فقط**، وأنت تناقش نفسك وتحدد العلاقات، ثم ترسل لي قرارك وأنا أراجعه.

# الواجب: تصميم علاقة التجارة بين المنتجات والتجار

## الجداول الموجودة

### 1. Products

```text
Products
-------------------------
ProductID              PK
ProductName
Description
BasePrice
CategoryID             FK
CreatedAt
UpdatedAt
IsActive
```

---

### 2. BigMerchants

```text
BigMerchants
-------------------------
BigMerchantID          PK
Name
ContactInfo
CreatedAt
IsActive
```

---

### 3. SmallMerchants

```text
SmallMerchants
-------------------------
SmallMerchantID        PK
Name
StoreName
ContactInfo
CreatedAt
IsActive
```

---

# المطلوب منك التفكير فيه

لدينا هذه الحقائق:

### الحقيقة 1

التاجر الكبير الواحد يمكن أن يعرض أكثر من منتج.

```text
BigMerchant A
    ├── Product 1
    ├── Product 2
    └── Product 3
```

---

### الحقيقة 2

نفس المنتج يمكن أن يعرضه أكثر من تاجر كبير.

```text
Product 1
    ├── BigMerchant A
    ├── BigMerchant B
    └── BigMerchant C
```

---

### الحقيقة 3

التاجر الصغير الواحد يمكن أن يحصل على منتجات من أكثر من تاجر كبير.

```text
SmallMerchant A

    Product 1 ← BigMerchant A
    Product 2 ← BigMerchant B
    Product 3 ← BigMerchant C
```

---

### الحقيقة 4

التاجر الكبير الواحد يمكن أن يبيع لأكثر من تاجر صغير.

```text
BigMerchant A

    ├── SmallMerchant A
    ├── SmallMerchant B
    └── SmallMerchant C
```

---

### الحقيقة 5

نفس المنتج قد يأتي للتاجر الصغير من مصدرين مختلفين.

مثال:

```text
Product X

BigMerchant A → SmallMerchant A

BigMerchant B → SmallMerchant A
```

وهنا عليك أن تقرر:

> هل تعتبرهما نفس السجل أم سجلين مختلفين؟

---

# المطلوب منك

لا تكتب SQL الآن.

فقط أرسل لي إجابتك بهذا الشكل:

### A

ما نوع العلاقة بين:

```text
BigMerchants ↔ Products
```

---

### B

ما نوع العلاقة بين:

```text
SmallMerchants ↔ Products
```

---

### C

ما نوع العلاقة التجارية الحقيقية بين:

```text
BigMerchants ↔ SmallMerchants
```

---

### D

كم جدولًا وسيطًا تحتاج؟

وما أسماء هذه الجداول؟

---

### E

ما هو الـ PK و FK الذي تقترحه لكل جدول وسيط؟

---

### F — السؤال الأصعب

إذا كان:

```text
SmallMerchant A
```

اشترى:

```text
Product X
```

من:

```text
BigMerchant A
```

ثم اشترى **نفس Product X** من:

```text
BigMerchant B
```

كيف سيمثل ذلك في تصميمك؟

**هذا هو قلب الواجب. لا تستعجل.**
