# Data Model Design – Power BI
 
This project uses a **star schema** to separate transactional fact tables from descriptive dimensions.

The model is optimized for filter propagation, performance, and scalability.
 
---
 
## 📊 Fact Tables
 
### FactSalesHeader

- Grain: One row per sales order

- Key metrics: Revenue, Gross Profit, Discounts
 
### FactSalesLine

- Grain: One row per order line

- Key metrics: Quantity, Line Revenue, Line Profit
 
### FactInventory

- Grain: One row per product per warehouse

- Key metrics: OnHand, Committed, OnOrder
 
---
 
## 🗂 Dimension Tables
 
- DimCustomer – customer attributes & segmentation

- DimProduct – product, brand, category

- DimSalesEmployee – account manager details

- DimWarehouse – warehouse reference

- DimDate – calendar & time intelligence
 
---
 

## 🔗 Data Model Relationships

| From Table        | To Table          | Cardinality | Filter Direction |
|------------------|-------------------|-------------|------------------|
| DimCustomer       | FactSalesHeader   | 1 → *       | Single           |
| FactSalesHeader   | FactSalesLine     | 1 → *       | Single           |
| DimProduct        | FactSalesLine     | 1 → *       | Single           |
| DimProduct        | FactInventory     | 1 → *       | Single           |
| DimWarehouse      | FactSalesLine     | 1 → *       | Single           |
| DimSalesEmployee  | FactSalesHeader   | 1 → *       | Single           |

 
---
 
## 🧠 Design Decisions
 
- Single-direction filters used to avoid ambiguity

- Customer summary tables are disconnected to preserve model clarity

- Inventory modeled separately to support stock vs sales analysis

- Date intelligence handled via a dedicated date dimension
 
This model supports all analytical views shown in the dashboard.

 
