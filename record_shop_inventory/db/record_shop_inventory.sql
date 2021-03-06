DROP TABLE IF EXISTS genre_categorizations;
DROP TABLE IF EXISTS sales;
DROP TABLE IF EXISTS records;
DROP TABLE IF EXISTS labels;
DROP TABLE IF EXISTS genres;
DROP TABLE IF EXISTS artists;

CREATE TABLE labels (
  id SERIAL8 PRIMARY KEY,
  name TEXT,
  location TEXT
);

CREATE TABLE artists (
  id SERIAL8 PRIMARY KEY,
  artist_name TEXT
);

CREATE TABLE genres (
  id SERIAL8 PRIMARY KEY,
  genre_name TEXT
);

CREATE TABLE records (
  id SERIAL8 PRIMARY KEY,
  title TEXT,
  artist_id INT8 REFERENCES artists(id) ON DELETE CASCADE,
  release_date DATE,
  running_stock_total INT8,
  stock_quantity INT8,
  total_sold INT8,
  buying_cost FLOAT(2),
  selling_price FLOAT(2),
  label_id INT8 REFERENCES labels(id) ON DELETE CASCADE,
  file TEXT
);

CREATE TABLE genre_categorizations (
  id SERIAL8 PRIMARY KEY,
  record_id INT8 REFERENCES records(id) ON DELETE CASCADE,
  genre_id INT8 REFERENCES genres(id) ON DELETE CASCADE
);

CREATE TABLE sales (
  id SERIAL8 PRIMARY KEY,
  record_id INT8 REFERENCES records(id) ON DELETE CASCADE,
  sale_quantity INT8,
  single_buying_cost FLOAT(2),
  single_selling_price FLOAT(2),
  single_markup FLOAT(2),
  single_profit FLOAT(2),
  total_buying_cost FLOAT(2),
  total_selling_price FLOAT(2),
  total_markup FLOAT(2),
  total_profit FLOAT(2),
  overhead FLOAT(2)
);
