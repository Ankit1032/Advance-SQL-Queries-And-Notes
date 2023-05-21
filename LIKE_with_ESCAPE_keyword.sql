--whole table
select * from users_1;

--values which contain '%'
SELECT favorite_brand
FROM users_1
WHERE INSTR(favorite_brand, '%') > 0;
--INSTR function in Oracle SQL returns the position of a substring within a string.

--names which contain '%v'
SELECT favorite_brand
FROM users_1
WHERE INSTR(favorite_brand, '%v') > 0;

--names starting with '%v'
SELECT favorite_brand
FROM users_1
WHERE favorite_brand LIKE '%\%v%' ESCAPE '\';
--The ESCAPE clause is used when the search pattern contains a character that needs to be 
--interpreted as a literal character instead of a wildcard.

--names starting with '%S'
select * from users_1
where favorite_brand like '\%S%' escape '\';

SELECT favorite_brand
FROM users_1
WHERE favorite_brand LIKE '%\%v%' ;
