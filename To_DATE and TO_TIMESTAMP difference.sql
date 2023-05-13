--In Oracle SQL, TO_TIMESTAMP and TO_DATE are both functions used to convert a string representation of a date or timestamp to an actual date or timestamp value.

--Let's say we have a string '2022-05-13 14:36:00' that we want to convert to a date and a timestamp datatype.

--To convert the string to a date datatype, we can use the TO_DATE function with the format model 'YYYY-MM-DD HH24:MI:SS':

---SQL Query----
SELECT TO_DATE('2022-05-13 14:36:00', 'YYYY-MM-DD HH24:MI:SS') AS my_date
FROM DUAL;

--OUTPUT------

--MY_DATE
---------
--13-MAY-22


To convert the same string to a timestamp datatype, we can use the TO_TIMESTAMP function with the same format model:

---SQL Query----
SELECT TO_TIMESTAMP('2022-05-13 14:36:00', 'YYYY-MM-DD HH24:MI:SS') AS my_timestamp
FROM DUAL;

--OUTPUT------

--MY_TIMESTAMP
-----------------------------
--13-MAY-22 02.36.00.000000 PM

--CONCLUSION : Note that the TO_DATE function returns a date datatype that represents only the 
--date, while the TO_TIMESTAMP function returns a timestamp datatype that represents 
--both the date and the time with sub-second precision.
