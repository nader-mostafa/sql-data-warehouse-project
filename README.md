# Data Warehouse and Analytics Project

A modern Data Warehouse and Analytics project built with SQL Server, focusing on ETL, data transformation, data modeling, data quality, and analytics.

## 🏗️ Architecture

The project follows the Medallion Architecture:

ERP / CRM
   ↓
Bronze
   ↓
Silver
   ↓
Gold
   ↓
Analytics

- Bronze: Raw data ingested from ERP and CRM sources.
- Silver: Cleaned, standardized, and transformed data.
- Gold: Business-ready data modeled using a Star Schema.

## 🔄 ETL Process

Extract → Transform → Load

The project includes:

- ERP and CRM data integration
- Data cleansing and standardization
- Data quality checks
- Dimensional modeling
- Fact and Dimension tables
- Star Schema

## 📊 Analytics

The Data Warehouse supports analysis of:

- Customer Behavior
- Product Performance
- Sales Trends

## 🛠️ Technologies & Tools

- SQL Server 2025
- T-SQL
- SQL Server Management Studio (SSMS)
- Visual Studio Code
- Draw.io
- CSV

## 📂 Repository Structure

data-warehouse-project/
│
├── datasets/
│   ├── source_crm/
│   └── source_erp/
│
├── docs/
│   ├── data_architecture.drawio
│   ├── data_flow.drawio
│   ├── data_models.drawio
│   ├── etl.drawio
│   ├── data_catalog.md
│   └── naming-conventions.md
│
├── scripts/
│   ├── bronze/
│   ├── silver/
│   └── gold/
│
├── tests/
│
├── README.md
└── LICENSE

## 🎯 Key Objectives

- Build a modern Data Warehouse using SQL Server
- Integrate ERP and CRM data
- Implement ETL processes
- Ensure data quality
- Design a Star Schema
- Deliver analytics-ready data

## 👨‍💻 Author

Nader Mostafa

Computer Science Student | Aspiring Data Engineer

SQL | SQL Server | Data Warehousing | ETL | Data Modeling | Data Engineering
