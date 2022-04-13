-- Created by Vertabelo (http://vertabelo.com)
-- Last modification date: 2022-04-13 03:59:52.327

-- tables
-- Table: brand
CREATE TABLE brand (
    brand_name varchar(100)  NOT NULL,
    release_date date  NOT NULL,
    price int  NOT NULL,
    CONSTRAINT brand_pk PRIMARY KEY  (brand_name)
);

-- Table: shoe_details
CREATE TABLE shoe_details (
    shoe_type varchar(100)  NOT NULL,
    size varchar(100)  NOT NULL,
    price int  NOT NULL,
    brand_name varchar(100)  NOT NULL,
    CONSTRAINT shoe_details_pk PRIMARY KEY  (shoe_type)
);

-- Table: shop_details
CREATE TABLE shop_details (
    shop_id varchar(100)  NOT NULL,
    shop_name varchar(100)  NOT NULL,
    location varchar(100)  NOT NULL,
    stock_id varchar(100)  NOT NULL,
    CONSTRAINT shop_details_pk PRIMARY KEY  (shop_id)
);

-- Table: stock
CREATE TABLE stock (
    stock_id varchar(100)  NOT NULL,
    total int  NOT NULL,
    sold_item int  NOT NULL,
    availabe_item int  NOT NULL,
    CONSTRAINT stock_pk PRIMARY KEY  (stock_id)
);

-- Table: stuff_details
CREATE TABLE stuff_details (
    stuff_id varchar(100)  NOT NULL,
    stuff_name varchar(100)  NOT NULL,
    location varchar(100)  NOT NULL,
    role varchar(100)  NOT NULL,
    shop_id varchar(100)  NOT NULL,
    CONSTRAINT stuff_details_pk PRIMARY KEY  (stuff_id)
);

-- foreign keys
-- Reference: shoe_details_brand (table: shoe_details)
ALTER TABLE shoe_details ADD CONSTRAINT shoe_details_brand
    FOREIGN KEY (brand_name)
    REFERENCES brand (brand_name);

-- Reference: shop_details_stock (table: shop_details)
ALTER TABLE shop_details ADD CONSTRAINT shop_details_stock
    FOREIGN KEY (stock_id)
    REFERENCES stock (stock_id);

-- Reference: stuff_details_shop_details (table: stuff_details)
ALTER TABLE stuff_details ADD CONSTRAINT stuff_details_shop_details
    FOREIGN KEY (shop_id)
    REFERENCES shop_details (shop_id);

-- End of file.

