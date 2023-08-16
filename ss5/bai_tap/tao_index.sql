use library;

-- - Tao index cho cột  title của bảng books	
create index index_title on books(title);
explain 
select * 
from books
where books.title = 'Sử';
drop index index_title on books;

-- - Tạo 1 view để lấy ra danh sách các quyển sách đã được mượn, có hiển thị thêm cột số lần đã được mượn					
create view view_borrows as
select borrows.id , 
borrows.student_id ,
borrows.book_id ,
borrows.borrow_data ,
borrows.return_data 
from borrows ; 

SET GLOBAL sql_mode=(SELECT REPLACE(@@sql_mode,'ONLY_FULL_GROUP_BY',''));
select  view_borrows.id , 
books.title,
view_borrows.student_id ,
view_borrows.book_id ,
view_borrows.borrow_data ,
view_borrows.return_data ,
count(view_borrows.book_id ) as so_lan_da_duoc_muon
from view_borrows
join books
on books.id = view_borrows.book_id
group by book_id;


-- - Viết 1 stored procedure thêm mới book trong database với tham số kiểu IN					
delimiter //
create procedure add_book (
title varchar(45),
page_size int,
author_id int,
category_id int 
)
begin 
insert into books(title,page_size,author_id,category_id) values
(title,page_size,author_id,category_id);
end //
delimiter ;
call library.add_book('Công Nghệ',40,4,2);