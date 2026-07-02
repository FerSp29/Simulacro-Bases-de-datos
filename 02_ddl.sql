-- 02_dml.sql - RiwiMarket S.A.S.
-- Carga inicial y operaciones DML

-- Ejemplo de insercion manual (para carga masiva usarias COPY)
INSERT INTO rm_categories (category_name) VALUES ('Beverages'), ('Snacks');

-- Insertar nuevo proveedor, marca y producto
INSERT INTO rm_suppliers (supplier_name, supplier_tax_id, city_id) VALUES ('Proveedor X', '123456789', 1);
INSERT INTO rm_products (product_sku, product_name, unit_price, category_id) VALUES ('SKU001', 'Coffee Mug', 25000, 1);

-- Actualizar telefono de proveedor (requiere columna previa)
-- UPDATE rm_suppliers SET phone = '3001234567' WHERE supplier_id = 1;

-- Actualizar precio de producto
UPDATE rm_products SET unit_price = 28000 WHERE product_sku = 'SKU001';

-- Eliminacion condicional (se borrara solo si no hay relaciones)
DELETE FROM rm_products WHERE product_id = 1 
AND NOT EXISTS (SELECT 1 FROM rm_movements WHERE product_id = 1);
