-- 01_ddl.sql - RiwiMarket S.A.S.
-- Creacion de la estructura de la base de datos

CREATE TABLE rm_cities (
  city_id SERIAL PRIMARY KEY,
  city_name VARCHAR(100) NOT NULL
  );

CREATE TABLE rm_categories (
  category_id SERIAL PRIMARY KEY,
  category_name VARCHAR(100) NOT NULL UNIQUE
  );

CREATE TABLE rm_suppliers (
  supplier_id SERIAL PRIMARY KEY,
  supplier_name VARCHAR(100) NOT NULL,
  supplier_tax_id VARCHAR(50) UNIQUE NOT NULL,
  city_id INT REFERENCES rm_cities(city_id)
  );

CREATE TABLE rm_products (
  product_id SERIAL PRIMARY KEY,
  product_sku VARCHAR(50) UNIQUE NOT NULL,
  product_name VARCHAR(100) NOT NULL,
  unit_price DECIMAL(10,2) NOT NULL,
  category_id INT REFERENCES rm_categories(category_id)
  );

CREATE TABLE rm_warehouses (
  warehouse_id SERIAL PRIMARY KEY,
  warehouse_name VARCHAR(100) NOT NULL,
  city_id INT REFERENCES rm_cities(city_id),
  address VARCHAR(255)
  );

CREATE TABLE rm_purchases (
  purchase_id SERIAL PRIMARY KEY,
  purchase_code VARCHAR(50) NOT NULL,
  purchase_date DATE NOT NULL,
  supplier_id INT REFERENCES rm_suppliers(supplier_id)
  );

CREATE TABLE rm_movements (
  movement_id SERIAL PRIMARY KEY,
  purchase_id INT REFERENCES rm_purchases(purchase_id),
  product_id INT REFERENCES rm_products(product_id),
  warehouse_id INT REFERENCES rm_warehouses(warehouse_id),
  movement_type VARCHAR(20) CHECK (movement_type IN ('IN', 'OUT', 'ADJUSTMENT')),
  movement_date DATE DEFAULT CURRENT_DATE,
  quantity INT NOT NULL,
  stock_after_movement INT NOT NULL
  );
