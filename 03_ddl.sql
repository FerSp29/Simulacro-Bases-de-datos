-- 03_dql.sql - RiwiMarket S.A.S.
-- Consultas SQL para reportes

-- 1. Inventario por producto
SELECT p.product_name, SUM(m.stock_after_movement) as total_stock
FROM rm_movements m JOIN rm_products p ON m.product_id = p.product_id GROUP BY p.product_name;

-- 2. Productos por bodega
SELECT w.warehouse_name, p.product_name, SUM(m.quantity) as qty
FROM rm_movements m JOIN rm_warehouses w ON m.warehouse_id = w.warehouse_id 
JOIN rm_products p ON m.product_id = p.product_id GROUP BY w.warehouse_name, p.product_name;

-- 3. Total comprado por proveedor
SELECT s.supplier_name, SUM(p.unit_price * m.quantity) as total_invested
FROM rm_purchases pur JOIN rm_suppliers s ON pur.supplier_id = s.supplier_id
JOIN rm_movements m ON pur.purchase_id = m.purchase_id JOIN rm_products p ON m.product_id = p.product_id
GROUP BY s.supplier_name;

-- 4. Productos con menor existencia
SELECT p.product_name, SUM(m.stock_after_movement) as stock
FROM rm_movements m JOIN rm_products p ON m.product_id = p.product_id 
GROUP BY p.product_name HAVING SUM(m.stock_after_movement) < 10;

-- 5. Cinco productos mas comprados
SELECT p.product_name, SUM(m.quantity) as total_purchased
FROM rm_movements m JOIN rm_products p ON m.product_id = p.product_id 
WHERE m.movement_type = 'IN' GROUP BY p.product_name ORDER BY total_purchased DESC LIMIT 5;

-- 6. Valor economico del inventario por ciudad
SELECT c.city_name, SUM(p.unit_price * m.stock_after_movement) as total_value
FROM rm_movements m JOIN rm_warehouses w ON m.warehouse_id = w.warehouse_id
JOIN rm_cities c ON w.city_id = c.city_id JOIN rm_products p ON m.product_id = p.product_id 
GROUP BY c.city_name;
