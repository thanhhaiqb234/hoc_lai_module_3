create database library;
use library;



create table students (
id int auto_increment primary key,
name varchar(100),
birthday date,
class_nam varchar(50)
);


create table authors (
id int not null primary key,
name varchar(100)
);

create table category (
id int not null primary key,
name varchar(100)
);

create table books (
id int auto_increment primary key,
title varchar(100),
page_size int,
foreign key (id) references authors(id),
foreign key (id) references category(id)
);


create table borrows (
borrow_data date,
return_data date,
id_student int,
id_book int,
primary key (id_student,id_book) ,
foreign key (id_student) references students(id),
foreign key (id_book) references books(id)
);