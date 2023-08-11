create database furama;
use furama;


create table vi_tri(
ma_vi_tri int  primary key ,
ten_vi_tri varchar(45)
);

create table trinh_do(
ma_trinh_do int  primary key,
ten_trinh_do varchar(45)
);

create table bo_phan(
ma_bo_phan int  primary key,
ten_bo_phan varchar(45)
);


create table nhan_vien(
ma_nhan_vien int auto_increment primary key,
ho_ten varchar(100) ,
ngay_sinh date ,
so_cmnd varchar(12),
luong double ,
so_dien_thoai varchar(10),
email varchar(100),
dia_chi varchar(100),
ma_vi_tri int ,
ma_trinh_do int ,
ma_bo_phan int ,
foreign key (ma_vi_tri) references vi_tri(ma_vi_tri),
foreign key (ma_trinh_do) references trinh_do(ma_trinh_do),
foreign key (ma_bo_phan) references bo_phan(ma_bo_phan)
);

create table loai_khach(
ma_loai_khach int primary key,
ten_loai_khach varchar(45)
);


create table khach_hang(
ma_khach_hang int auto_increment primary key,
ma_loai_khach int,
ho_ten varchar(100),
ngay_sinh date,
gioi_tinh bit(1),
so_cmnd varchar(12),
so_dien_thoai varchar(10),
email varchar(100),
dia_chi varchar(100),
foreign key (ma_loai_khach) references loai_khach(ma_loai_khach)
);


create table loai_dich_vu(
ma_dich_vu int primary key,
ten_loai_dich_vu varchar(45)
);

create table kieu_thue(
ma_kieu_thue int primary key,
ten_kieu_thue varchar(45)
);

create table dich_vu(
ma_dich_vu int primary key auto_increment,
ten_dich_vu varchar(45),
dien_tich int,
chi_phi double,
so_nguoi_toi_da int ,
ma_kieu_thue int,
ma_loai_dich_vu int,
foreign key (ma_kieu_thue)  references kieu_thue(ma_kieu_thue),
foreign key (ma_loai_dich_vu) references loai_dich_vu(ma_dich_vu),
tieu_chuan_phong varchar(45),
mo_ta_tien_nghi_khac varchar(45),
dien_tich_ho_boi double,
so_tang int,
dich_vu_mien_phi_di_kem text
);

create table hop_dong(
ma_hop_dong int auto_increment primary key,
ngay_lam_hop_dong datetime ,
ngay_ket_thuc datetime,
tien_dat_coc double,
ma_nhan_vien int,
ma_khach_hang int,
ma_dich_vu int,
foreign key (ma_nhan_vien) references nhan_vien(ma_nhan_vien),
foreign key (ma_khach_hang) references khach_hang(ma_khach_hang),
foreign key (ma_dich_vu) references dich_vu(ma_dich_vu	)
);


create table dich_vu_di_kem(
ma_dich_vu_di_kem int auto_increment primary key,
ten_dich_vu_di_kem varchar(45),
gia double,
don_vi varchar(10),
trang_thai varchar(45)
);

create table hop_dong_chi_tiet(
ma_hop_dong_chi_tiet int primary key,
ma_hop_dong int ,
ma_dich_vu_di_kem int ,
foreign key (ma_hop_dong) references hop_dong(ma_hop_dong),
foreign key (ma_dich_vu_di_kem) references dich_vu_di_kem(ma_dich_vu_di_kem)
);


insert into vi_tri value
(1,'Quản Lý'),
(2,'Nhân Viên') ;

insert into trinh_do value
(1,'Trung Cấp'),
(2,'Cao Đẳng'),
(3,'Đại Học'),
(4,'Sau Đại Học');

insert into bo_phan value
(1,'Sale-Marketing'),
(2,'Hành chính'),
(3,'Phục vụ'),
(4,'Quản lý');

insert into nhan_vien(ho_ten,ngay_sinh ,so_cmnd,luong,so_dien_thoai,email,dia_chi,ma_vi_tri,ma_trinh_do,ma_bo_phan) value 
('Nguyễn Văn An','1970-11-07','456231786',10000000,'0901234121','annguyen@gmail.com','295 Nguyễn Tất Thành, Đà Nẵng',1,3,1),
('Lê Văn Bình','1997-04-09','654231234',7000000,'0934212314','binhlv@gmail.com','22 Yên Bái, Đà Nẵng',1,2,2),
('Hồ Thị Yến','1995-12-12','999231723',14000000,'0412352315','thiyen@gmail.com','K234/11 Điện Biên Phủ, Gia Lai',1,3,2),
('Võ Công Toản','1980-04-04','123231365',17000000,'0374443232','toan0404@gmail.com','77 Hoàng Diệu, Quảng Trị',1,4,4),
('Nguyễn Bỉnh Phát','1999-12-09','454363232',6000000,'0902341231','phatphat@gmail.com','43 Yên Bái, Đà Nẵng',2,1,1),
('Khúc Nguyễn An Nghi','2000-11-08','964542311',7000000,'0978653213','annghi20@gmail.com','294 Nguyễn Tất Thành, Đà Nẵng',2,2,3),
('Nguyễn Hữu Hà','1993-01-01','534323231',8000000,'0941234553','nhh0101@gmail.com','4 Nguyễn Chí Thanh, Huế',2,3,2),
('Nguyễn Hà Đông','1989-09-03','234414123',9000000,'0642123111','donghanguyen@gmail.com','111 Hùng Vương, Hà Nội',2,4,4),
('Tòng Hoang','1982-09-03','256781231',6000000,'0245144444','hoangtong@gmail.com','213 Hàm Nghi, Đà Nẵng',2,4,4),
('Nguyễn Công Đạo','1994-01-08','755434343',8000000,'0988767111','nguyencongdao12@gmail.com','6 Hoà Khánh, Đồng Nai',2,3,2);

insert into loai_khach value 
(1,'Diamond'),
(2,'Platinium');