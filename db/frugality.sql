DROP TABLE transactions;
DROP TABLE items;
DROP TABLE merchants;


CREATE TABLE merchants(
  id SERIAL4 PRIMARY KEY,
  name VARCHAR(255)
);


CREATE TABLE items(
  id SERIAL4 PRIMARY KEY,
  description VARCHAR(255)
);

CREATE TABLE transactions(
  id SERIAL4  PRIMARY KEY,
  merchant_id int4 references merchants(id),
  item_id int4 references items(id),
  cost money
);

