CREATE TABLE departments (
    id SERIAL PRIMARY KEY,
    code VARCHAR(50) UNIQUE,
    name VARCHAR(100),
    description TEXT
);

CREATE TABLE permissions (
    id SERIAL PRIMARY KEY,
    code VARCHAR(50) UNIQUE,
    name VARCHAR(100),
    description TEXT
);

CREATE TABLE positions (
    id SERIAL PRIMARY KEY,
    code VARCHAR(50) UNIQUE,
    name VARCHAR(100),
    description TEXT
);

CREATE TABLE roles (
    id SERIAL PRIMARY KEY,
    code VARCHAR(50) UNIQUE,
    name VARCHAR(100),
    description TEXT
);

CREATE TABLE users (
    id INT PRIMARY KEY,
    name VARCHAR(100) NOT NULL,
    code VARCHAR(50) UNIQUE,
    department_id INT,
    position_id INT,
    email VARCHAR(100),
    phone_number VARCHAR(20),
    avatar_path TEXT,
    birthday DATE,
    created_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
    role_id INT,
    
    CONSTRAINT fk_department
        FOREIGN KEY(department_id) 
        REFERENCES departments(id)
        ON DELETE SET NULL,
        
    CONSTRAINT fk_position
        FOREIGN KEY(position_id) 
        REFERENCES positions(id)
        ON DELETE SET NULL,
        
    CONSTRAINT fk_role
        FOREIGN KEY(role_id) 
        REFERENCES roles(id)
);

CREATE TABLE user_permissions (
    user_id INT,
    permission_id INT,
    
    CONSTRAINT fk_user
        FOREIGN KEY(user_id) 
        REFERENCES users(id)
        ON DELETE CASCADE,
        
    CONSTRAINT fk_permission
        FOREIGN KEY(permission_id) 
        REFERENCES permissions(id)
        ON DELETE CASCADE,
        
    PRIMARY KEY (user_id, permission_id)
);

CREATE TABLE user_activities (
    id SERIAL PRIMARY KEY,
    activity_type VARCHAR(50),
    display_name VARCHAR(255),
    priority_point INT,
    user_id INT REFERENCES Users(id) ON DELETE CASCADE,
    created_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
    description TEXT
);

CREATE TABLE asset_types (
    id SERIAL PRIMARY KEY,
    code VARCHAR(50) UNIQUE,
    name VARCHAR(100),
    description TEXT
);

CREATE TABLE asset_qualities (
    id SERIAL PRIMARY KEY,
    code VARCHAR(50) UNIQUE,
    name VARCHAR(100),
    description TEXT
);

CREATE TABLE currencies (
    id SERIAL PRIMARY KEY,
    code VARCHAR(50) UNIQUE,
    name VARCHAR(100),
    symbol VARCHAR(10)
);
CREATE TABLE locations (
    id SERIAL PRIMARY KEY,
    name VARCHAR(100),
    description TEXT
);

CREATE TABLE assets (
    id SERIAL PRIMARY KEY,
    serial_number VARCHAR(100) NOT NULL UNIQUE,
    model_number VARCHAR(100),
    manufacturer VARCHAR(100),
    made_in VARCHAR(100),
    purchase_price FLOAT,
    purchase_date TIMESTAMP,
    warranty_expiry_date TIMESTAMP,
    supplier VARCHAR(100),
    description TEXT,
    added_at TIMESTAMP,
    status VARCHAR(50) NOT NULL,
    label_image_path VARCHAR(100);
    
    price_unit_id INT,
    location_id INT NOT NULL,
    asset_quality_id INT NOT NULL,
    asset_type_id INT NOT NULL,

    FOREIGN KEY (price_unit_id) REFERENCES currencies(id) ON DELETE RESTRICT,
    FOREIGN KEY (location_id) REFERENCES locations(id) ON DELETE RESTRICT,
    FOREIGN KEY (asset_quality_id) REFERENCES asset_qualities(id) ON DELETE RESTRICT,
    FOREIGN KEY (asset_type_id) REFERENCES asset_types(id) ON DELETE RESTRICT,
);

CREATE TABLE asset_files (
    id SERIAL PRIMARY KEY,
    path VARCHAR(100) NOT NULL,
    file_type VARCHAR(20) NOT NULL,
    created_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
    asset_id INT NOT NULL,
    FOREIGN KEY (asset_id) REFERENCES assets(id) ON DELETE CASCADE
);

CREATE TABLE asset_label_tasks (
    id SERIAL PRIMARY KEY,
    path VARCHAR(100)  NOT NULL,
    serial_number VARCHAR(50),
    model_number VARCHAR(50),
    manufacturer VARCHAR(30),
    made_in VARCHAR(30),
    created_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
    completed_at TIMESTAMP,
    error_code VARCHAR(50),
    task_type VARCHAR(30),
    keep_alive BOOLEAN,
    creator_id INT,
    all_words TEXT[]
    FOREIGN KEY (creator_id) REFERENCES users(id)
);
-- Trigger cho completed task
CREATE OR REPLACE FUNCTION notify_task_completed()
RETURNS TRIGGER AS $$
BEGIN
  IF NEW.completed_at IS DISTINCT FROM OLD.completed_at THEN
    PERFORM pg_notify(
      'task_completed_channel',
      json_build_object('id', NEW.id)::text
    );
  END IF;
  RETURN NEW;
END;
$$ LANGUAGE plpgsql;

CREATE TRIGGER asset_label_tasks_completed_trigger
AFTER UPDATE ON asset_label_tasks
FOR EACH ROW
WHEN (OLD.completed_at IS DISTINCT FROM NEW.completed_at)
EXECUTE FUNCTION notify_task_completed();
