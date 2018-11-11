DROP TABLE IF EXISTS sales;
DROP TABLE IF EXISTS records;
DROP TABLE IF EXISTS labels;


CREATE TABLE labels (
  id SERIAL8 PRIMARY KEY,
  name TEXT,
  location TEXT
);

CREATE TABLE records (
  id SERIAL8 PRIMARY KEY,
  title TEXT,
  artist TEXT,
  genre TEXT,
  description TEXT,
  stock_quantity INT8,
  buying_cost INT8,
  selling_price INT8,
  label_id INT8 REFERENCES labels(id) ON DELETE CASCADE,
  file TEXT
);

CREATE TABLE sales (
  id SERIAL8 PRIMARY KEY,
  record_id INT8 REFERENCES records(id) ON DELETE CASCADE,
  sale_quantity INT8
);
