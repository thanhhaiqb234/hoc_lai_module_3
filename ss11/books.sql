create database books;
use books;

create table book(
id int primary key auto_increment,
title varchar(100) ,
pagesize int , 
author varchar(50),
category varchar(50),
status int
);

insert into book (title,pagesize,author,category,status) value
("Đắc Nhân Tâm",291,"Dale Carnegie","Tự giúp bản thân",0),
("Nhà Giải Kim",225,"Paulo Coelho","Phiêu lưu, tưởng tượng, thần bí",0),
("Cách nghĩ để thành công",400,"Napoleon Hill","Sách kinh doanh",0),
("Hạt giống tâm hồn",285,"ack Canfield và Mark Victor Hansen","Tự giúp bản thân",0),
("Đọc vị bất kỳ ai",223,"	David.j lieberman","Tự giúp bản thân",0);


select * from book;