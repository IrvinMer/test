-- ** worstbuy_db schema (ONLY RUN ON EMPTY DATABASE)

-- ** tables that involve user accounts
-- Create 'users' table if it doesn't exist
CREATE TABLE IF NOT EXISTS users (
    id INT AUTO_INCREMENT PRIMARY KEY,         -- Unique ID for each user
    email VARCHAR(255) NOT NULL UNIQUE,        -- User's email (required and unique)
    password VARCHAR(255) NOT NULL,            -- User's password (required)
    is_admin BOOLEAN DEFAULT FALSE,            -- Admin flag (default is false)
    admin_code VARCHAR(255) DEFAULT NULL       -- Admin code (nullable)
);



-- Insert a sample admin user
INSERT INTO users (email, password, is_admin, admin_code) 
VALUES ('admin@example.com', 'adminpassword', TRUE, 'someAdminCode123');

-- Insert a sample non-admin user
INSERT INTO users (email, password, is_admin) 
VALUES ('client@example.com', 'clientpassword', FALSE);

-- Create the 'user_cart' table to hold each user's cart items
CREATE TABLE IF NOT EXISTS user_cart (
    user_id INT,                                -- User ID
    product_id INT,                             -- Product ID
    quantity INT DEFAULT 1,                     -- Quantity of the product in the cart (optional)
    PRIMARY KEY (user_id, product_id),         -- Composite primary key
    FOREIGN KEY (user_id) REFERENCES users(id) -- Foreign key relationship to the users table
);


-- Insert a sample cart item for the admin user (assuming product_id 1 exists)
INSERT INTO user_cart (user_id, product_id, quantity) 
VALUES (1, 1, 2);

-- Insert a sample cart item for the non-admin user (assuming product_id 1 exists)
INSERT INTO user_cart (user_id, product_id, quantity) 
VALUES (2, 1, 1);

-- ** tables that involve products

-- Create 'products' table if it doesn't exist
CREATE TABLE IF NOT EXISTS products (
    id INT AUTO_INCREMENT PRIMARY KEY, -- Unique ID for each product
    name VARCHAR(255) NOT NULL,        -- Product name
    description TEXT,                  -- Product description
    price DECIMAL(10, 2) NOT NULL,     -- Product price
    image_url VARCHAR(255),            -- URL to product image
    created_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP
);



-- Insert sample product
INSERT INTO products (name, description, price, image_url) 
VALUES ('Sample Product', 'This is a sample product', 9.99, 
'https://static.vecteezy.com/system/resources/thumbnails/036/025/219/small/ai-generated-happy-fat-man-in-a-blue-t-shirt-showing-thumb-up-photo.jpg');

-- ** display all tables

SELECT 'User account table:' AS message;
SELECT * FROM users;
SELECT 'User cart table:' AS message;
SELECT * FROM user_cart;
SELECT 'Products table:' AS message;
SELECT * FROM products;
