use world;
drop table users;
CREATE TABLE users (
    user_id INT AUTO_INCREMENT  PRIMARY KEY,

    email VARCHAR(255) NOT NULL UNIQUE,

    age INT CHECK (age BETWEEN 18 AND 65),
    status VARCHAR(20)
        DEFAULT 'ACTIVE'
        CHECK (status IN ('ACTIVE', 'INACTIVE', 'SUSPENDED')),

    created_at TIMESTAMP
        DEFAULT CURRENT_TIMESTAMP
);
CREATE TABLE employee (
    emp_id INT PRIMARY KEY,
    salary DECIMAL(10,2),
    department VARCHAR(50) NOT NULL,
    phone_number CHAR(10) UNIQUE,
    join_date DATE,

    CHECK (salary BETWEEN 15000 AND 300000),
    CHECK (phone_number REGEXP '^[0-9]{10}$')
);
SELECT VERSION();
CREATE TABLE orders (
    order_id INT PRIMARY KEY,

    user_id INT NOT NULL,

    order_amount DECIMAL(8,2)
        CHECK (order_amount > 0),

    order_status VARCHAR(20)
        DEFAULT 'PENDING'
        CHECK (order_status IN ('PENDING', 'COMPLETED', 'CANCELLED')),

    order_time TIMESTAMP
        DEFAULT CURRENT_TIMESTAMP,

    UNIQUE (user_id, order_time)
);
#################Testing Constraint Violations (Intentional)###########
-- ❌ Age below allowed range
INSERT INTO users (email, age)
VALUES ('test1@example.com', 15);

-- ❌ Duplicate email (UNIQUE violation)
INSERT INTO users (email, age)
VALUES ('test2@example.com', 25);

INSERT INTO users (email, age)
VALUES ('test2@example.com', 30);

-- ❌ Salary out of range
INSERT INTO employee (emp_id, salary, department)
VALUES (101, 5000, 'IT');

-- ❌ Invalid order amount
INSERT INTO orders (order_id, user_id, order_amount)
VALUES (1, 10, -200);

#############Multiple Constraints on a Single Column###########
ALTER TABLE employee
ADD phone_number VARCHAR(15) UNIQUE,
ADD CHECK (CHAR_LENGTH(phone_number) = 10);


select * from employee;
