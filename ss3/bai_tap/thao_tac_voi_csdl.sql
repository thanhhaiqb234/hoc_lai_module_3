use library;


insert into category value
(1,'Tự Nhiên'),
(2,'Xã Hội'),
(3,'Truyện'),
(4,'Tiểu Thuyết'),
(5,'Khác');


insert into authors value
(1,'Nguyễn Thái Học'),
(2,'Trần Mình Hoàng'),
(3,'Dương Trung Quốc'),
(4,'Lê Văn Hiến'),
(5,'Hà Văn Minh');
insert into authors value
(6,'Trương Tấn Hải');


insert into students value 
(1,'Nguyễn Văn A','1999-12-12','C0822G1'),
(2,'Nguyễn Văn B','1999-12-13','C0822G1'),
(3,'Nguyễn Văn C','1999-12-14','C0822G1'),
(4,'Nguyễn Văn D','1999-12-15','C0922G1'),
(5,'Nguyễn Văn E','1999-12-16','C1022G1');

	
insert into books value 
(1,'Toán',45,1,1),
(2,'Văn',34,2,2),
(3,'Sử',56,3,2),
(4,'Địa',76,4,2),
(5,'Hóa',32,5,1);
insert into books value
(6,'Anh',50,6,2);

insert into borrows value
(1,1,1,'2022-12-12','2022-12-13'),
(2,2,2,'2022-12-12','2022-12-15'),
(3,3,3,'2022-12-12','2022-12-15'),
(4,4,4,'2022-12-13','2022-12-12'),
(5,1,5,'2022-12-13','2022-12-15'),
(6,1,5,'2022-12-14','2022-12-14'),
(7,3,4,'2022-12-15','2022-12-29'),
(8,3,3,'2022-12-8','2022-12-14'),
(9,1,2,'2022-12-6','2022-12-30');


--  Lấy ra toàn bộ sách có trong thư viện, cùng với tên thể loại và tác giả					
select books.title ,category.name, authors.name
from authors 
join books
on authors.id = books.author_id
join category
on books.author_id = category.id;


--  Lấy ra danh sách các học viên đã từng mượn sách và sắp xếp danh sách theo theo tên từ a->z						
select students.name
from students
join borrows
on borrows.student_id = students.id
order by students.name;


-- Lấy ra  2 quyển sách được mượn nhiều nhất			
select books.title , count(*) as so_luong
from borrows
join books
on books.id = borrows.book_id
group by books.id
order by so_luong desc
limit 2

