# 🏦 FinTrust Digital Bank — End-to-End Data Analytics Project

## 📌 Project Overview
This repository contains the complete end-to-end data analytics lifecycle for **FinTrust Digital Bank**, completed as part of the AnalystLab Africa Experience Lab Internship Programme. 

The project spans **Data Preparation & Quality Assessment (Part A)**, **SQL Business Intelligence Analysis (Part B)**, **Python Exploratory Data Analysis (Part C)** and **Interactive Power BI Management Dashboard Design (Part D)**  to evaluate customer behavior, payment channel performance, operational reliability, and compliance risks.

---

## 📁 Repository Structure & Deliverables
- **`FinTrust_Data_Quality_and_Cleaning_Workbook.xlsx`**: Cleaned Excel workbook containing date-time standardization (ISO 8601), XLOOKUP customer attribute joins, and custom compliance/outlier audit flags.
- **`FinTrust_Part_A_Data_Quality_Assessment_Report.docx`**: Word documentation detailing the 10 data quality dimensions and Excel data cleaning methodology.
- **`FinTrust_Week2_SQL_Analysis.sql`**: Production-ready PostgreSQL query script addressing 8 core business analytics questions.
- **`FinTrust_Week2_Analytics_Dashboard.pbix`**: Interactive Power BI management dashboard featuring 6 core KPIs, 6 dynamic visual layouts, and multi-dimensional slicers.
- **`FinTrust_Week2_Data_Analysis.ipynb`**: Comprehensive Python exploratory data analysis (EDA) Jupyter Notebook featuring 5 core business visualizations and data insights.

---

## 🛠️ Tools & Technologies
- **Microsoft Excel**: Data profiling, Text-to-Columns, XLOOKUP, Interquartile Range (IQR) outlier detection, and Pivot Table aggregations.
- **PostgreSQL / pgAdmin 4**: Relational schema modeling, JOINs, conditional aggregations (`CASE WHEN`), and time-series analytics (`TO_CHAR`).
- **Microsoft Power BI Desktop**: Data modeling ($1 : *$ cardinality), DAX measure development (`CALCULATE`, `DIVIDE`, `DISTINCTCOUNT`), and interactive dashboard design.
- **Python (Google Colab / Jupyter)**: Data manipulation (`Pandas`, `NumPy`) and statistical visualization (`Matplotlib`, `Seaborn`).

---

## 📊 Core Business Insights

### 1. Customer Segment Performance
- **Everyday Segment**: Serves as the primary engine for bank liquidity, generating **46.65% (₦261.46M)** of total processed transaction value across 5,644 transactions.
- **SME Segment**: Records the largest average transaction size (**₦49,115.69**), reflecting high-value commercial and vendor payments.
- **Student Segment**: Demonstrates remarkable digital adoption, matching the total financial throughput of **Premium** clients (**~₦107.48M**), signaling strong long-term customer lifetime value (LTV).

### 2. Channel Performance & Operational Failure Rates
- **Mobile App Dominance**: Dominates overall channel traffic, handling **42.52%** of all transactions (**5,102 transactions / ₦240.10M**).
- **Technical Failure Rates**: Mobile App exhibits the highest technical failure rate (**5.80%**), followed by USSD (**5.40%**) and POS (**5.22%**). Server infrastructure and payment gateway optimization are urgently needed to minimize user drop-offs.

### 3. Transaction Types & Revenue Throughput
- **Core Capital Movements**: **Transfers (42.45%)** and **Deposits (23.37%)** account for over **65.8% of total financial volume** (₦368.90M combined).
- **Micro-Services**: High-frequency, low-ticket services like **Airtime/Data** and **Bill Payments** drive everyday customer engagement across app channels.

### 4. Operational Risk & Anti-Fraud Patterns
- **Risk Interception**: Transactions flagged for Risk Review (`Risk_Review_Flag = Yes`) account for **19.60% of total volume** (2,352 transactions) and exhibit a significantly higher non-success rate (**9.78%**) than unflagged transactions (**7.52%**), confirming effective automated fraud detection.

### 5. Compliance & Regulatory Exposure Audit
- **Inactive Account Transactions**: **1,090 transactions** totaling **~₦49.61M** (8.85% of total bank value) originated from accounts marked as **Dormant** or **Restricted**.
- **Recommendation**: Implement automated, gateway-level hard blocks to restrict debit and credit operations on non-active customer accounts.

---

## 🚀 How to Run the Project
1. **Database Queries:** Import `FinTrust_Data_customer.csv` and `FinTrust_Data_transaction.csv` into **pgAdmin 4** and execute `FinTrust_Week2_SQL_Analysis.sql`.
2. **Power BI Dashboard:** Open `FinTrust_Week2_Analytics_Dashboard.pbix` in **Power BI Desktop** to interact with dynamic slicers and KPI visuals.
3. **Python EDA Notebook:** Upload `FinTrust_Week2_Data_Analysis.ipynb` alongside the CSV datasets to **Google Colab** and select **Runtime > Run all**.
