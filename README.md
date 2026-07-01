# RiwiMarket Database System

## Project Description
This project implements a relational database solution for RiwiMarket S.A.S. a company dedicated to distributing consumer products. The goal was to centralize information that was previously fragmented in a single Excel file solving issues related to data redundancy, inconsistency and integrity. This system manages suppliers, products, inventories and movements providing a reliable foundation for business reporting.

## Technologies Used
-**Database Engine:** PostgreSQL or MySQL
-**Modeling Tool:** dbdiagram.io
-**Language:** SQL (DDL, DML, DQL)
-**Version Control:** Git & GitHub

## Normalization Process
To ensure high data quality and eliminate anomalies, the dataset was normalized through the first three normal forms (3NF):
1. **1FN (First Normal Form):** Ensured atomicity by separating attributes and removing repeating groups.
2. **2FN (Second Normal Form):** Eliminated partial dependencies by creating specific tables for entities like `rm_suppliers` and `rm_products`.
3. **3FN (Third Normal Form):** Removed transitive dependencies ensuring non-key attributes depend only on the primary key (e.g., separating `rm_cities` from `rm_suppliers` and `rm_warehouses`).

## Database Structure
The database consists of the following main entities:
-`rm_cities`: Stores city names to standardize location data.
-`rm_suppliers`: Manages supplier information and contact details.
-`rm_categories`: Organizes products into functional categories.
-`rm_products`: Contains core product data linked to categories.
-`rm_warehouses`: Lists storage locations across different cities.
-`rm_purchases`: Records purchase headers and supplier relations.
-`rm_movements`: Tracks inventory flow (IN, OUT, ADJUSTMENT) for auditability.

## Installation Instructions
1. Clone this repository to your local machine.
2. Open your preferred database management tool (PostgreSQL or MySQL).
3. Create a new database named `bd_yourname_yourlastname_clan`.
4. Run the `01_ddl.sql` script to create the table schema with all constraints.

## Data Loading Process
The original Excel file was converted into independent CSV files for each table. Data was loaded using the `COPY` command for PostgreSQL or `LOAD DATA` for MySQL to ensure proper data ingestion while maintaining foreign key integrity.

## SQL Queries Explanation
The system includes pre-defined queries to support business decision-making such as:
-**Inventory Tracking:** Real-time stock levels per product.
-**Financial Reporting:** Total investment per supplier.
-**Logistics Management:** Products distributed by warehouse and city.
-**Performance Analytics:** Identifying top-selling products and stock replenishment needs.

## Developer Information
-**Full Name:** [Fernando Santos]
-**Clan:** [Clan 8 - Cortizzos]
