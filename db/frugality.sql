DROP TABLE transactions;
DROP TABLE categories;
DROP TABLE merchants;


CREATE TABLE merchants(
  id SERIAL4 PRIMARY KEY,
  name VARCHAR(255)
);


CREATE TABLE categories(
  id SERIAL4 PRIMARY KEY,
  description VARCHAR(255)
);

CREATE TABLE transactions(
  id SERIAL4  PRIMARY KEY,
  merchant_id int4 references merchants(id) ON DELETE CASCADE,
  category_id int4 references categories(id) ON DELETE CASCADE,
  currency numeric(6,2)
);

