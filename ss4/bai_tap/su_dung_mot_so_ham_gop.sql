use library;


-- - Thông kê các đầu sách được mượn nhiều nhất	:			
select books.title,
count(borrows.book_id) as so_luong_cac_dau_sach_da_duoc_muon
from books 
join borrows
on borrows.book_id = books.id
group by books.title
order by count(borrows.book_id) desc;

-- - Thông kê các đầu sách chưa được mượn :	


-- - Lấy ra danh sách các học viên đã từng mượn sách và sắp xếp  theo số lượng mượn sách từ lớn đến nhỏ	:
select 
students.name ,
count(students.id)as so_lan_muon_sach_cua
from students
join borrows
on borrows.student_id = students.id
group by borrows.student_id
order by count(borrows.student_id) desc;

-- - Lấy ra các học viên mượn sách nhiều nhất của thư viện	:
select 
students.name ,
count(students.id)as so_lan_muon_sach_cua
from students
join borrows
on borrows.student_id = students.id
group by borrows.student_id
order by count(borrows.student_id) desc 
Limit 2;			
