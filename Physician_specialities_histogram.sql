--From the following 3 tables (event_category, physician_speciality, patient_treatment),
--write a SQL query to get the histogram of specialities of the unique physicians
--who have done the procedures but never did prescribe anything.

--Table Structure:

create table event_category
(
  event_name varchar(50),
  category varchar(100)
);

create table physician_speciality
(
  physician_id int,
  speciality varchar(50)
);

create table patient_treatment
(
  patient_id int,
  event_name varchar(50),
  physician_id int
);


insert into event_category values ('Chemotherapy','Procedure');
insert into event_category values ('Radiation','Procedure');
insert into event_category values ('Immunosuppressants','Prescription');
insert into event_category values ('BTKI','Prescription');
insert into event_category values ('Biopsy','Test');


insert into physician_speciality values (1000,'Radiologist');
insert into physician_speciality values (2000,'Oncologist');
insert into physician_speciality values (3000,'Hermatologist');
insert into physician_speciality values (4000,'Oncologist');
insert into physician_speciality values (5000,'Pathologist');
insert into physician_speciality values (6000,'Oncologist');


insert into patient_treatment values (1,'Radiation', 1000);
insert into patient_treatment values (2,'Chemotherapy', 2000);
insert into patient_treatment values (1,'Biopsy', 1000);
insert into patient_treatment values (3,'Immunosuppressants', 2000);
insert into patient_treatment values (4,'BTKI', 3000);
insert into patient_treatment values (5,'Radiation', 4000);
insert into patient_treatment values (4,'Chemotherapy', 2000);
insert into patient_treatment values (1,'Biopsy', 5000);
insert into patient_treatment values (6,'Chemotherapy', 6000);


select * from patient_treatment;
select * from event_category;
select * from physician_speciality;

--query 
select ps.SPECIALITY, count(1) as speciality_count from physician_speciality ps
inner join patient_treatment pt on ps.PHYSICIAN_ID = pt.PHYSICIAN_ID
inner join event_category ec on pt.event_name =ec.event_name
and ec.category = 'Procedure'
where ps.PHYSICIAN_ID not in (
    select PHYSICIAN_ID from patient_treatment pt
    inner join event_category ec
    on pt.event_name =ec.event_name
    where ec.category = 'Prescription'
)
group by ps.SPECIALITY
;



