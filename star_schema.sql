-- DIMENSION TABLES
-- =========================

CREATE TABLE dim_date (
    date_id INT PRIMARY KEY,
    full_date DATE NOT NULL,
    day INT,
    month INT,
    year INT,
    quarter INT
);

CREATE TABLE dim_store (
    store_id INT PRIMARY KEY,
    store_name VARCHAR(100),
    city VARCHAR(50),
    state VARCHAR(50)
);

CREATE TABLE dim_product (
    product_id INT PRIMARY KEY,
    product_name VARCHAR(100),
    category VARCHAR(50)
);

-- FACT TABLE
-- =========================

CREATE TABLE fact_sales (
    sales_id INT PRIMARY KEY,
    date_id INT,
    store_id INT,
    product_id INT,
    quantity INT,
    unit_price DECIMAL(10,2),
    total_amount DECIMAL(12,2),

    FOREIGN KEY (date_id) REFERENCES dim_date(date_id),
    FOREIGN KEY (store_id) REFERENCES dim_store(store_id),
    FOREIGN KEY (product_id) REFERENCES dim_product(product_id)
);

-- CLEANED DIMENSION DATA
-- =========================

-- Dates (standardized to YYYY-MM-DD)
INSERT INTO dim_date VALUES
(1, '2023-01-01', 1, 1, 2023, 1),
(2, '2023-01-02', 2, 1, 2023, 1),
(3, '2023-01-03', 3, 1, 2023, 1),
(4, '2023-01-04', 4, 1, 2023, 1),
(5, '2023-01-05', 5, 1, 2023, 1);

-- Stores (NULLs replaced, consistent naming)
INSERT INTO dim_store VALUES
(101, 'Store A', 'Delhi', 'Delhi'),
(102, 'Store B', 'Mumbai', 'Maharashtra'),
(103, 'Store C', 'Bangalore', 'Karnataka');

-- Products (category casing standardized)
INSERT INTO dim_product VALUES
(201, 'Laptop', 'Electronics'),
(202, 'Phone', 'Electronics'),
(203, 'Shirt', 'Apparel'),
(204, 'Shoes', 'Footwear');

-- FACT DATA (CLEANED)
-- =========================

-- Notes:
-- - Dates mapped to date_id
-- - NULL quantities replaced with 1
-- - Prices standardized
-- - total_amount = quantity * unit_price

INSERT INTO fact_sales VALUES
(1, 1, 101, 201, 1, 50000.00, 50000.00),
(2, 1, 101, 202, 2, 20000.00, 40000.00),
(3, 2, 102, 203, 3, 1500.00, 4500.00),
(4, 2, 103, 204, 1, 3000.00, 3000.00),
(5, 3, 101, 201, 1, 52000.00, 52000.00),
(6, 3, 102, 202, 2, 21000.00, 42000.00),
(7, 4, 103, 203, 4, 1400.00, 5600.00),
(8, 4, 101, 204, 2, 3200.00, 6400.00),
(9, 5, 102, 201, 1, 51000.00, 51000.00),
(10, 5, 103, 202, 3, 19500.00, 58500.00);
