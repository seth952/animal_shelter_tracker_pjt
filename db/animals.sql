DROP TABLE adoptions;
DROP TABLE animals;
DROP TABLE owners;


CREATE TABLE animals
(
  id SERIAL8 primary key,
  name VARCHAR(255) not null,
  adopt_status VARCHAR(255),
  type VARCHAR(255),
  breed VARCHAR(255),
  admis_date VARCHAR(255),
  good_with_kids VARCHAR(255),
  good_with_other_pets VARCHAR(255),
  need_attention VARCHAR(255)
);

CREATE TABLE owners
(
  id SERIAL8 primary key,
  name VARCHAR(255) not null,
  address VARCHAR(255),
  suitablity VARCHAR(255),
  has_kids VARCHAR(255),
  has_other_pets VARCHAR(255),
  give_attention VARCHAR(255)


);

CREATE TABLE adoptions
(
  id SERIAL8 primary key,
  animal_id INT8 references animals(id),
  owner_id INT8 references owners(id),
  adoption_date VARCHAR(255)

);
