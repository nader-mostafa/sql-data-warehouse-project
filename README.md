# 📊 SQL Data Warehouse & Analytics

<p align="center">
  <strong>A Practical End-to-End Data Engineering & Analytics Project</strong>
</p>

<p align="center">
  <img src="https://img.shields.io/badge/SQL-Server-red?style=for-the-badge&logo=microsoftsqlserver&logoColor=white"/>
  <img src="https://img.shields.io/badge/T--SQL-Advanced-blue?style=for-the-badge"/>
  <img src="https://img.shields.io/badge/Data%20Engineering-ETL-orange?style=for-the-badge"/>
  <img src="https://img.shields.io/badge/Data%20Modeling-Star%20Schema-purple?style=for-the-badge"/>
  <img src="https://img.shields.io/badge/Git-GitHub-black?style=for-the-badge&logo=github"/>
</p>

---

## 📌 Overview

This project presents the development of a **modern SQL-based data warehouse** designed to transform raw operational data into a structured and analysis-ready environment.

The solution follows an **end-to-end data engineering workflow**, covering data ingestion, transformation, quality handling, dimensional modeling, and analytical querying.

The main objective is to build a reliable foundation where raw data can be converted into **clean, integrated, and business-ready information** for analytical use.

---

## 🏗️ Solution Architecture

The warehouse is organized using a **Medallion Architecture**:

<img width="2479" height="1516" alt="Data Architecture" src="https://github.com/user-attachments/assets/7a279026-ebf6-4740-830e-d336ff25b256" />


### Bronze Layer — Raw

The Bronze layer preserves the source data in its original form.

**Purpose:**

* Load raw CSV files
* Preserve source information
* Provide a reliable landing layer
* Separate ingestion from transformation

### Silver Layer — Refined

The Silver layer prepares the data for analytical modeling.

**Main activities:**

* Data cleansing
* Standardization
* Transformation
* Data quality handling
* Integration of source systems

### Gold Layer — Analytical

The Gold layer contains the final business-ready structures used for analysis.

**Focus:**

* Fact tables
* Dimension tables
* Analytical relationships
* Reporting-ready data

---

## 🔄 Data Engineering Pipeline

The complete workflow can be summarized as:

```text
Extract
  ↓
Load Raw Data
  ↓
Validate & Clean
  ↓
Transform & Standardize
  ↓
Integrate Sources
  ↓
Model Data
  ↓
Create Analytical Layer
  ↓
Generate Insights
```

This separation provides a clear distinction between **raw ingestion, data preparation, and analytical consumption**.

---

## 🎯 Project Objectives

The project was designed to demonstrate the practical implementation of:

* Modern data warehouse architecture
* ETL development using SQL
* Data quality and transformation
* Integration of multiple data sources
* Dimensional data modeling
* Fact and dimension design
* Analytical SQL development
* Business-oriented data analysis

The warehouse integrates data originating from **ERP and CRM CSV sources** into a unified analytical environment.

---

## 🧹 Data Quality & Transformation

Before analytical use, the source data goes through a transformation process intended to improve its quality and consistency.

Key areas include:

| Area            | Purpose                                     |
| --------------- | ------------------------------------------- |
| Data Cleaning   | Resolve data quality issues                 |
| Standardization | Maintain consistent formats and values      |
| Validation      | Ensure data reliability                     |
| Integration     | Combine multiple source systems             |
| Transformation  | Convert raw data into analytical structures |
| Data Types      | Apply appropriate types for analysis        |

The objective is to ensure that the Gold layer provides **consistent and reliable data for downstream analytics**.

---

## ⭐ Data Modeling

The analytical layer follows a **dimensional modeling approach** based on a **Star Schema**.

<img width="2402" height="1316" alt="data_model" src="https://github.com/user-attachments/assets/fe368962-315d-49dc-b985-91b23f4c9f44" />


### Fact Tables

Fact tables contain measurable business events used for analytical calculations.

### Dimension Tables

Dimension tables provide descriptive context around those business events.

This structure allows analytical queries to efficiently explore sales across different business dimensions.

---

## 📈 Analytics & Business Questions

The final analytical layer supports analysis across three primary areas:

### 👥 Customer Behavior

Analyze how customers interact with the business and contribute to overall sales performance.

### 📦 Product Performance

Evaluate products and identify differences in their sales performance.

### 📊 Sales Trends

Explore sales activity and identify meaningful trends within the available data.

These analytical areas are aligned with the project's stated reporting objectives.

---

## 🛠️ Technology Stack

| Technology             | Role                         |
| ---------------------- | ---------------------------- |
| **SQL Server**         | Database & Data Warehouse    |
| **T-SQL**              | ETL & Analytics              |
| **Docker**             | Database Environment         |
| **Visual Studio Code** | Development Environment      |
| **Draw.io**            | Architecture & Data Modeling |
| **Git / GitHub**       | Version Control              |

---

## 🚀 Key Skills Demonstrated

Through this project, I practiced and demonstrated:

**SQL Development**

* Complex SQL queries
* Data transformation
* Analytical functions
* Data validation

**Data Engineering**

* ETL workflows
* Layered warehouse architecture
* Source integration
* Data quality handling

**Data Modeling**

* Dimensional modeling
* Fact tables
* Dimension tables
* Star schema design

**Analytics**

* Customer analysis
* Product analysis
* Sales analysis
* Business-oriented reporting

---

## 📚 Project Learning Outcomes

This project provided practical experience with the full lifecycle of a data warehouse:

```text
Raw Data
   ↓
Data Ingestion
   ↓
Data Cleaning
   ↓
Transformation
   ↓
Data Integration
   ↓
Data Modeling
   ↓
Analytical Queries
   ↓
Business Insights
```

Rather than working with isolated SQL queries, the project focuses on understanding how the individual components of a data platform work together as a complete pipeline.

---

## 👨‍💻 About Me

### Nader Mostafa

**Student | Data Engineering & Data Analytics**

I'm a student building practical projects to strengthen my skills in **SQL, Data Engineering, Data Analytics, and Data Modeling**.

This project represents hands-on practice in designing and implementing a complete data warehouse workflow — from raw source data to an analytical layer.

### Connect With Me

<p>
  <a href="http://www.linkedin.com/in/nader-mostafa-eg">
    <img src="https://img.shields.io/badge/LinkedIn-Nader%20Mostafa-0A66C2?style=for-the-badge&logo=linkedin&logoColor=white"/>
  </a>
</p>

---

## ⭐ Project Focus

> **Turning raw data into structured, reliable, and analysis-ready information through SQL-based data engineering.**

---

<p align="center">
  <strong>Built with SQL • Designed for Analytics • Developed by Nader Mostafa</strong>
</p>
