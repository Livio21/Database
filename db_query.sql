-- krijimi i tabeles kursi
create table kursi(
    id SERIAL primary key ,
    emri_kursit VARCHAR(100),
    kohezgjatja INT,
    create_date DATE,
    update_date DATE
);

-- Insert queries per 10 kurse
insert into kursi (emri_kursit, create_date, update_date, kohezgjatja) values ('Java','10-10-2023','10-10-2023',3);

insert into kursi (emri_kursit, create_date, update_date, kohezgjatja) values ('Python','01-02-2023','05-02-2023',4);

insert into kursi (emri_kursit, create_date, update_date, kohezgjatja) values ('JavaScript','12-06-2023','12-06-2023',2);

insert into kursi (emri_kursit, create_date, update_date, kohezgjatja) values ('C++','11-11-2023','12-11-2023',5);

insert into kursi (emri_kursit, create_date, update_date, kohezgjatja) values ('React','05-03-2024','10-03-2024',3);

insert into kursi (emri_kursit, create_date, update_date, kohezgjatja) values ('Angular','01-07-2024','01-07-2024',4);

insert into kursi (emri_kursit, create_date, update_date, kohezgjatja) values ('Node.js','10-09-2024','12-09-2024',3);

insert into kursi (emri_kursit, create_date, update_date, kohezgjatja) values ('Flutter','01-02-2025','05-02-2025',5);

insert into kursi (emri_kursit, create_date, update_date, kohezgjatja) values ('Flutter','01-02-2025','05-02-2025',5);

insert into kursi (emri_kursit, create_date, update_date, kohezgjatja) values ('Machine Learning','01-10-2025','05-10-2025',8);

-- Shtimi i kolones programming_language ne tabelen kursi
alter table kursi add column programming_language VARCHAR(100);

-- Update queries per ndryshimin programming_language bazuar ne emri_kursit
update kursi set programming_language='Java' where emri_kursit like 'Java%';

update kursi set programming_language='Python' where emri_kursit like 'Python%';

update kursi set programming_language='JavaScript' where emri_kursit like 'JavaScript%';

update kursi set programming_language='C++' where emri_kursit like 'C++%';

update kursi set programming_language='TypeScript' where emri_kursit like 'Angular%';

update kursi set programming_language='Java' where emri_kursit like 'Spring%';

update kursi set programming_language='JavaScript' where emri_kursit like 'Node%';

update kursi set programming_language='Dart' where emri_kursit like 'Flutter%';

update kursi set programming_language='R' where emri_kursit like 'Data%';

update kursi set programming_language='Python' where emri_kursit like 'Machine%';

update kursi set programming_language='Java' where emri_kursit like 'Java%';

-- krijimi i tabeles student me foreign key kursi_id qe referon id e tabeles kursi
create table student (
    id serial primary key ,
    emri varchar(100),
    email varchar(100),
    birth_date date,
    phone_number varchar(15),
    pike int,
    kursi_id int references kursi(id)
);

--insert studentet
insert into student (emri, email, birth_date, phone_number, pike, kursi_id) VALUES ('Student Student','student@email.com','01-01-2001','0681231234',60, 1);

insert into student (emri, email, birth_date, phone_number, pike, kursi_id) VALUES ('A A','student@email.com','01-01-2001','0681231234',50, 1);

insert into student (emri, email, birth_date, phone_number, points, kursi_id) VALUES ('Filan Fisteku','student@email.com','01-01-2001','0681231234',50, 3);
insert into student (emri, email, birth_date, phone_number, points, kursi_id) VALUES ('Filan Fisteku','student@email.com','01-01-2001','0681231234',50, 1);
insert into student (emri, email, birth_date, phone_number, points, kursi_id) VALUES ('Filan Fisteku','student@email.com','01-01-2001','0681231234',50, 4);
insert into student (emri, email, birth_date, phone_number, points, kursi_id) VALUES ('Filan Fisteku','student@email.com','01-01-2001','0681231234',50, 4);
insert into student (emri, email, birth_date, phone_number, points, kursi_id) VALUES ('Filan Fisteku','student@email.com','01-01-2001','0681231234',50, 4);
insert into student (emri, email, birth_date, phone_number, points, kursi_id) VALUES ('Filan Fisteku','student@email.com','01-01-2001','0681231234',50, 4);
insert into student (emri, email, birth_date, phone_number, points, kursi_id) VALUES ('Filan Fisteku','student@email.com','01-01-2001','0681231234',50, 10);
insert into student (emri, email, birth_date, phone_number, points, kursi_id) VALUES ('Filan Fisteku','student@email.com','01-01-2001','0681231234',50, 10);

--ndryshimi i kolones pike ne points
alter table student rename column pike to points;

--listimi i te gjithe kurseve
select * from kursi;

-- per te treguar te gjithe studentet qe ju fillon emri me shkronjen A
select * from student where emri like 'A%';

-- per te treguar te gjithe kurset qe jane krijuar ne vitin 2023-2025
select * from kursi where create_date between  '2023-01-01' and   '2025-12-31';

-- per te treguar te gjithe studentet qe jane mbi 25 vjec
select * from  student where ( date_part('year',current_date) - date_part('year', birth_date) >= 25);

----------------------------------------------------------------------------------
-- Sa kurse permbajne shkronjen "J"
select count(*) from kursi where emri_kursit like '%J%';

-- Studenti qe ka max e pikeve
select * from student where points = (select max(points) from student);
-- Duke perdorur order ne zbritje dhe rezultatin e pare
select * from student order by points desc limit 1;

-- Kurset qe kane me shume se 3 studenta
-- Ngaqe jan disa repeated courses me emra te njejte
--select kursi_id, count(student.kursi_id) from student join kursi k on student.kursi_id = k.id group by kursi_id having count(kursi_id) > 3;
-- ndryshimi i constraint tek kursi qe te mos krijohen dublicates me emer te njejte
-- alter table kursi add constraint u_emri_kursi unique (emri_kursit);
-- inner join ku id e kursit qe eshte rregjstruar studenti eshte e njejte me id e kursit tek tabela kursi, grupuar nga emri kur jam ne shume se 3 raste qe eshte i njejti kursi_id tek student
select  emri_kursit as kurset_mbi_3_student, count(student.kursi_id) from student join kursi k on student.kursi_id = k.kursi_id group by emri_kursit having count(student.kursi_id) > 3;


-- Marrdhenie Many-to-Many mes tabelave

-- heq foreign key nga student table qe te mos jete one-to-many kurs-student
alter table student drop column kursi_id;

-- Krijimi i junction table per te lidhur dy tabelat kursi dhe student
create table regjistri(
    student_id int references student(student_id) on delete cascade ,
    kursi_id int references kursi(kursi_id) on delete cascade ,
     primary key (student_id,kursi_id)
);

-- "regjistrimi" i studentave ne kurse
insert into regjistri(student_id, kursi_id) values (1, 5);
insert into regjistri(student_id, kursi_id) values (2, 5);
insert into regjistri(student_id, kursi_id) values (4, 5);
insert into regjistri(student_id, kursi_id) values (7, 5);

insert into regjistri(student_id, kursi_id) values (3, 6);
insert into regjistri(student_id, kursi_id) values (10, 6);
insert into regjistri(student_id, kursi_id) values (5, 6);
insert into regjistri(student_id, kursi_id) values (6, 6);
insert into regjistri(student_id, kursi_id) values (8, 4);


-- Emer studenti dhe emer kursi per cdo student
select  student.emri, kursi.emri_kursit from student join regjistri r on student.student_id = r.student_id join kursi on kursi.kursi_id = r.kursi_id;

-- Update i query per kurset mbi 3 student  pasi u shtua junction table per n-m mes student-kursi
select emri_kursit as kurset_mbi_3_student, count(regjistri.kursi_id) from regjistri join kursi k on k.kursi_id = regjistri.kursi_id group by emri_kursit having count(regjistri.kursi_id) > 3;





