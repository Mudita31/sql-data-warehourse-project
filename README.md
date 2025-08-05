# SQL Data Warehouse Project
Guided by: Baraa Khatib Salkini (Data With Baraa)
Author / Repository: Mudita31

🚀 Project Overview
This project, guided by Baraa Khatib Salkini, demonstrates a comprehensive end‑to‑end modern data warehouse built using SQL Server and the Medallion Architecture (Bronze, Silver, Gold layers). You'll learn how to build ETL pipelines, perform data modeling, and generate actionable analytics using industry‑standard best practices 

📌 Objectives
Data Architecture
Implement a layered architecture:

Bronze: Raw source data ingestion

Silver: Data cleansing, standardization, normalization

Gold: Business-ready star-schema model for analytics

ETL Pipelines
Build automated SQL scripts to extract, transform, and load ERP and CRM CSV source files into the warehouse.

Data Modeling
Design fact and dimension tables optimized for analytical querying and reporting.

Analytics & Reporting
Write SQL-based queries to explore:

Customer behavior

Sales trends

Product performance metrics

📁 Repository Structure
graphql
Copy
Edit
sql-data-warehouse-project/  
├── datasets/                   # Source CSV files from ERP and CRM  
├── docs/                       # Architecture, data catalogs, flow diagrams  
│   ├── etl.drawio
│   ├── data_architecture.drawio
│   ├── data_catalog.md
│   ├── data_flow.drawio
│   ├── data_models.drawio
│   └── naming-conventions.md
├── scripts/
│   ├── bronze/                 # Scripts to ingest raw data
│   ├── silver/                 # Cleaning and transformation scripts
│   └── gold/                   # SQL to build star schema and fact tables
├── analytics_queries/          # SQL for EDA and reporting insights
│   ├── 01_database_exploration.sql
│   ├── …                       # Ranking, segmentation, cumulative analyses
│   └── 13_report_products.sql
├── tests/                      # SQL or other tests for quality assurance
├── README.md                   # Project documentation (this file)
├── LICENSE                     # MIT license
├── .gitignore
└── requirements.txt            # Software dependencies (e.g., SQL Server Express)
🛠 Technologies & Tools
Database Engine: SQL Server (Express or Developer edition)

SQL IDE: SQL Server Management Studio (SSMS) or Azure Data Studio

Diagramming: Draw.io files for models, flows, and architecture

Version Control: Git / GitHub

Documentation: Markdown files and project notebooks/notion templates

⚙️ Setup Instructions
Prerequisites
Install SQL Server Express or Developer Edition

Use SSMS or Azure Data Studio for script execution

Clone this repository:

bash
Copy
Edit
git clone <repository-url>
Ensure the datasets folder contains ERP and CRM CSV files

Execution Steps
Initialize the database (e.g., CREATE DATABASE DataWarehouse;)

Run Bronze scripts to ingest raw data into staging schemas

Run Silver scripts for data cleansing and normalization

Run Gold scripts to build fact and dimension tables

Explore analytics_queries/ to generate insights and sample reports

🧾 Data Architecture & Modeling
This project implements Medallion Architecture to separate concerns and ensure modularity:

Bronze Layer: Ingest raw data

Silver Layer: Clean and transform

Gold Layer: Present data in a star schema model ready for business consumption

The star schema organizes data into fact tables (e.g., sales) linked to dimension tables (e.g., products, customers, time) to enable fast and efficient analytical querying 


📈 Analytics & Reporting
In analytics_queries/, you'll find SQL scripts for:

Exploring key dimensions and fact tables

Performing trend, ranking, part-to-whole, and segmentation analyses

Generating actionable reports on customers, products, and sales performance

These queries are designed to support business intelligence use cases and decision-making.

✅ Project Highlights
End‑to‑end data pipeline built from CSV ingestion to analytics-ready star schema

Clean architecture with separation of raw, cleaned, and business-ready layers

Sample SQL analytics queries to derive key insights

Clean naming conventions and clear documentation for maintainability

Accredited to and guided by Baraa Khatib Salkini, showcasing real world data engineering best practices

📝 Contributing
Contributions are welcome! Feel free to fork this repository, raise issues, or submit pull requests to propose improvements or add new metrics.

👤 About the Mentor
This guided project is designed and overseen by Baraa Khatib Salkini (Data With Baraa), an experienced data engineering professional focused on modern warehouse architecture, ETL, and SQL-based analytics 


📄 License
This work is presented under the MIT License, allowing for free use, modification, and distribution with attribution.

📞 Stay Connected
YouTube Channel: https://www.youtube.com/@DataWithBaraa
