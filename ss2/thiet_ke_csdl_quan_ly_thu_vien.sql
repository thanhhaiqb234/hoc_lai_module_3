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
author_id int not null,
category_id int not null,
foreign key (author_id) references authors(id),
foreign key (category_id) references category(id)
);


create table borrows (
id int auto_increment,
student_id int,
book_id int,
borrow_data date,
return_data date,
primary key (id,student_id,book_id) ,
foreign key (student_id) references students(id),
foreign key (book_id) references books(id)
);


