create table kursi(
    id SERIAL primary key ,
    emri_kursit VARCHAR(100),
    kohezgjatja DATE,
    create_date DATE,
    update_date DATE
);

insert into kursi (emri_kursit, create_date, update_date, kohezgjatja) VALUES ('Java','10/10/2023','10/10/2023',3);

alter table kursi add column programming_language VARCHAR(100);

update kursi set programming_language='Java' where emri_kursit like 'Java%';

create table student (
    id serial primary key ,
    emri varchar(100),
    email varchar(100),
    birth_date date,
    phone_number varchar(15),
    pike int,
    kursi_id serial references kursi(id)

);

insert into student (emri, email, birth_date, phone_number, pike, kursi_id) VALUES ('Student Student','student@email.com','01/01/2001','0681231234',50, 1);

alter table student rename column pike to points;

select * from student where emri like 'A%';

select * from student where emri like 'S%';

select * from  student where ( date_part('year',current_date) - date_part('year', birth_date) >= 25);