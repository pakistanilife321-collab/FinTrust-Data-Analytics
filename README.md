
# 🏦 FinTrust Digital Bank — Data Analytics Project

## 📌 Project Overview
This repository contains the **Data Preparation & Quality Assessment (Part A)** and **SQL Business Intelligence Analysis (Part B)** for FinTrust Digital Bank, completed as part of the AnalystLab Africa Experience Lab Internship Programme.

---

## 📁 Repository Structure & Deliverables
- **`FinTrust_Data_Quality_and_Cleaning_Workbook.xlsx`**: Cleaned Excel workbook with date-time formatting, XLOOKUP customer attribute joins, and custom compliance/outlier audit flags.
- **`FinTrust_Week2_SQL_Analysis.sql`**: Production-ready PostgreSQL query script addressing 8 core business questions.


---

## 🛠️ Tools & Technologies
- **Microsoft Excel**: Data profiling, Text-to-Columns conversion, XLOOKUP, Interquartile Range (IQR) outlier detection, and Pivot Table aggregations.
- **PostgreSQL / pgAdmin 4**: Relational schema setup, JOIN operations, conditional aggregations (`CASE WHEN`), and time-series analytics (`TO_CHAR`).

---

## 📊 Core Business Insights

### 1. Customer Segment Performance
- **Everyday Segment**: Drives overall bank liquidity, accounting for **46.65%** of total transaction value.
- **SME Segment**: Generates the highest average transaction size (**₦49,115.69**), reflecting commercial vendor payments.
- **Student Segment**: Shows high digital adoption, matching the total financial contribution of the **Premium** tier (**~₦107.48M**).

### 2. Channel Usage & Technical Failure Rates
- **Mobile App**: Dominates channel traffic, handling **42.52%** of total bank transactions (**₦240.10M**).
- **Technical Failures**: Mobile App records the highest technical failure rate (**5.80%**), indicating an urgent need for payment gateway stability improvements.

### 3. Operational & Compliance Audit
- **Inactive Account Activity**: **1,090 transactions** totaling **~₦49.61M** (8.85% of total bank value) originated from **Dormant** or **Restricted** accounts.
- **Recommendation**: Implement automated hard locks at the payment authorization gateway to prevent non-active accounts from executing debits/credits.

---

