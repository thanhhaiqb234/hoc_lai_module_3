create database book_management;
use book_management;

create table books(
id int auto_increment primary key,
name varchar(100),
page_size int not null,
author varchar(100)
);


insert into books value 
(1,'Toán',45,'Nguyến Thái Học'),
(2,'Văn',34,'Trần Mình Hoàng'),
(3,'Sử',56,'Dương Trung Quốc'),
(4,'Địa',76,'Lê Văn Hiến'),
(5,'Hóa',32,'Hà Văn Minh');


select id, name as title , page_size, author from books ;



-- - Cập nhật số trang page_size=50 với sách có title = "Sử"	
SET SQL_SAFE_UPDATES = 0;
update books set page_size = 50 
where name like 'Sử';
SET SQL_SAFE_UPDATES = 1;

-- - Xoá sách có id =5	
delete books  from books 
where books.id = 5;

-- - Xoá bảng books	
drop table books;

-- - Xoá cơ sở dữ liệu book_management			
drop database book_management;