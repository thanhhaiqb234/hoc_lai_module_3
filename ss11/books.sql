create database books;
use books;

create table book(
id int primary key auto_increment,
title varchar(100) ,
pagesize int , 
author varchar(50),
id_category int,
status int default 0 ,
foreign key (id_category) references category(id)
);

create table category(
id int auto_increment primary key,
name varchar(50)
);
insert into book (title,pagesize,author,id_category) value
("Đắc Nhân Tâm",291,"Dale Carnegie",1),
("Nhà Giải Kim",225,"Paulo Coelho",2),
("Cách nghĩ để thành công",400,"Napoleon Hill",3),
("Hạt giống tâm hồn",285,"ack Canfield và Mark Victor Hansen",4),
("Đọc vị bất kỳ ai",223,"David.j lieberman",5);


insert into category(name) value 
("Khoa Học"),
("Tự Nhiên"),
("Xã Hội"),
("Truyện"),
("Tiểu Thuyết"),
("Khác");



delimiter //
create procedure edit_book (id_book int ,
title varchar(100) ,
pagesize int , 
author varchar(50),
id_category int
)
begin 
update book set book.title = title , book.pagesize = pagesize , book.author = author , book.id_category = id_category 
where id = id_book ;
end //
delimiter ;

call books.edit_book(?,?,?,?,?);


delimiter //
create procedure delete_book (
id_book int 
)
begin
update book set book.status = 1 
where id = id_book ;
end //
delimiter ;

call books.delete_book(?);
