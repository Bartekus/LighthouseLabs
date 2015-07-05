------------------
--- Exercise 1 ---
sqlite3 ex1.db < ex1.sql


------------------
--- Exercise 2 ---
sqlite3 ex2.db < ex2.sql


------------------
--- Exercise 3 ---
sqlite3 ex3.db < ex2.sql
sqlite3 -echo ex3.db < ex3.sql

--- INSERT INTO person (id, first_name, last_name, age)
---    VALUES (0, "Zed", "Shaw", 37);
--- INSERT INTO pet (id, name, breed, age, dead)
---    VALUES (0, "Fluffy", "Unicorn", 1000, 0);
--- INSERT INTO pet VALUES (1, "Gigantor", "Robot", 1, 1);


------------------
--- Exercise 4 ---
sqlite3 -echo ex3.db < ex4.sql

--- INSERT INTO person_pet (person_id, pet_id) VALUES (0, 0);
--- INSERT INTO person_pet VALUES (0, 1);


------------------
--- Exercise 5 ---
sqlite3 -echo ex3.db < ex5.sql

--- SELECT * FROM person;
--- 0|Zed|Shaw|37
--- SELECT name, age FROM pet;
--- Fluffy|1000
--- Gigantor|1
--- SELECT name, age FROM pet WHERE dead = 0;
--- Fluffy|1000
--- SELECT * FROM person WHERE first_name != "Zed";


------------------
--- Exercise 6 ---
sqlite3 -column -header ex3.db < ex6.sql

--- id          name        age         dead
--- ----------  ----------  ----------  ----------
--- 0           Fluffy      1000        0
--- 1           Gigantor    1           1


------------------
--- Exercise 7 ---
rm ex3.db
sqlite3 ex3.db < ex2.sql
sqlite3 ex3.db < ex3.sql
sqlite3 ex3.db < ex4.sql
sqlite3 ex3.db < ex5.sql

--- 0|Zed|Shaw|37
--- Fluffy|1000
--- Gigantor|1
--- Fluffy|1000

sqlite3 ex3.db < ex6.sql

--- 0|Fluffy|1000|0
--- 1|Gigantor|1|1

sqlite3 -echo ex3.db < ex7.sql

--- SELECT name, age FROM pet WHERE dead = 1;
--- Gigantor|1
--- DELETE FROM pet WHERE dead = 1;
--- SELECT * FROM pet;
--- 0|Fluffy|Unicorn|1000|0
--- INSERT INTO pet VALUES (1, "Gigantor", "Robot", 1, 0);
--- SELECT * FROM pet;
--- 0|Fluffy|Unicorn|1000|0
--- 1|Gigantor|Robot|1|0


------------------
--- Exercise 8 ---
sqlite3 mydata.db < ex2to7.sql
--- output ommitted ---
sqlite3 -header -column -echo mydata.db < ex8.sql

--- DELETE FROM pet WHERE id IN (
---     SELECT pet.id
---     FROM pet, person_pet, person
---     WHERE
---     person.id = person_pet.person_id AND
---     pet.id = person_pet.pet_id AND
---     person.first_name = "Zed"
--- );
--- SELECT * FROM pet;
--- SELECT * FROM person_pet;
--- person_id   pet_id
--- ----------  ----------
--- 0           0
--- 0           1
--- DELETE FROM person_pet
---     WHERE pet_id NOT IN (
---         SELECT id FROM pet
---     );
--- SELECT * FROM person_pet;


------------------
--- Exercise 9 ---
sqlite3 mydata.db < ex2to7.sql
--- output ommited ---
sqlite3 -header -column -echo mydata.db < ex9.sql

--- UPDATE person SET first_name = "Hilarious Guy"
---     WHERE first_name = "Zed";
--- UPDATE pet SET name = "Fancy Pants"
---     WHERE id=0;
--- SELECT * FROM person;
--- id          first_name     last_name   age
--- ----------  -------------  ----------  ----------
--- 0           Hilarious Guy  Shaw        37
--- SELECT * FROM pet;
--- id          name         breed       age         dead
--- ----------  -----------  ----------  ----------  ----------
--- 0           Fancy Pants  Unicorn     1000        0
--- 1           Gigantor     Robot       1           0
