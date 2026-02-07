# 📊 Nova Security – Sales & Profitability Analysis

## 🔍 Project Overview
The objective of this project is to analyze:
- **Sales performance**
- **Profitability**
- **Customer behavior**
- **Product trends**
- **Sales team effectiveness**
Using a structured **Business Intelligence (BI)** approach.

The project follows a **SQL-first analytics workflow**, where most of the data preparation, cleaning, and transformation were performed at the database level before visualization.

The final output is an **interactive Power BI dashboard**, exported here as a **PDF snapshot** due to hosting limitations.  

## 🧠 Business Questions Addressed
- How are **revenue** and **profit trending** over time?
- Which **customers and products** drive the most value?
- Who are the **loss-making customers and products?**
- How effective are **account managers** in driving sales and margins?
- How does performance vary by **brand, category, order source, and year?**  

## 🗂️ Data Scope & Source

Data Source: ERP transactional system (SAP-style schema)
Granularity: Order-line level transactions
Time Frame: 2024 – 2025

Key Entities
- Orders
- Customers
- Products
- Brands & Categories
- Sales
- Account Managers

Detailed field-level explanations and assumptions can be inferred from the dashboard visuals included in the PDF.  

## 🛠️ Data Preparation & SQL Processing
A significant portion of the analysis was completed **before Power BI**, directly in **SQL**.

### ✔ SQL-Level Work
- Selected **only analysis-relevant columns** from source tables
- Removed redundant, unused, and system-generated fields
- Applied business logic and filters (valid orders, dates, sources)
- Joined multiple transactional and master tables
- Created **clean analytical result sets** for reporting

#### This approach:
- Improves dashboard performance
- Keeps the Power BI model lean
- Demonstrates real-world, production-style BI workflows  

## 🧩 Data Modeling in Power BI

Within Power BI, a structured **star-style data model** was implemented:

- Fact tables connected to multiple dimensions
- Relationship optimization for correct filter propagation
- Creation of:
  - Calculated columns
  - Helper tables
  - Business measures (DAX)

#### 📊 Key Metrics Implemented
- Total Revenue
- Gross Profit
- Profit Margin (%)
- Average Order Value (AOV)
- Growth Metrics (YoY, MoM)
- Customer & Product Contribution

## 📈 Dashboard Pages Included

The Power BI dashboard consists of multiple analytical views:

#### 1. 🏠 Home / Executive Summary
  - KPIs
  - Revenue & profit trends
  - Order mix

#### 2. 📉 Sales Performance
- Monthly trends
- Growth analysis
- Order sources

#### 3. 👥 Customer Insights
- Top & loss-making customers
- Margin segmentation
- Customer lifecycle analysis

#### 4. 📦 Product Insights
- Product & category performance
- Brand contribution
- Loss-making products

#### 5. 🧑‍💼 Sales / Account Manager Performance
- Revenue & profit by manager
- Customer ownership
- Brand-wise performance

***📄 All pages are included as a PDF export in this repository.***

## 🚀 Tools & Technologies
- **SQL Server / T-SQL** – data extraction & preprocessing
- **Power BI Desktop** – data modeling & visualization
- **DAX** – business measures & calculations
- **GitHub** – version control & portfolio showcase

## 📌 Limitations & Notes
- Live dashboard hosting is not enabled (Power BI Service / Tableau Public not used)
- This repository focuses on analysis design, logic, and outcomes — not raw data sharing

## ⭐ Why This Project Matters
- This project reflects real-world BI practices:
- SQL-driven data preparation
- Business-focused metrics
- Scalable data modeling
- Executive-ready dashboards
