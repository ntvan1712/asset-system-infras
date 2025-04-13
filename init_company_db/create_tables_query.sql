-- Create table for Department
CREATE TABLE departments (
    id SERIAL PRIMARY KEY,
    code VARCHAR(50) UNIQUE,
    name VARCHAR(100),
    description TEXT
);

-- Create table for Position
CREATE TABLE positions (
    id SERIAL PRIMARY KEY,
    code VARCHAR(50) UNIQUE,
    name VARCHAR(100),
    description TEXT
);

-- Create table for Employee
CREATE TABLE employees (
    id SERIAL PRIMARY KEY,
    name VARCHAR(100),
    code VARCHAR(50) UNIQUE,
    department_id INT NOT NULL REFERENCES departments(id),
    position_id INT NOT NULL REFERENCES positions(id),
    email VARCHAR(100),
    phone_number VARCHAR(20),
    avatar_path VARCHAR(255),
    hire_date DATE,
    birthday DATE,
    created_at TIMESTAMPTZ DEFAULT NOW()
);

-- Create table for Account
CREATE TABLE accounts (
    id SERIAL PRIMARY KEY,
    employee_id INT NOT NULL REFERENCES employees(id),
    username VARCHAR(50) UNIQUE,
    password_hash VARCHAR(255),
    CONSTRAINT uq_username UNIQUE (username) 
);
CREATE INDEX idx_username ON accounts(username);

-- for search by name
CREATE EXTENSION IF NOT EXISTS unaccent;
