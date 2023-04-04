use QLBanHang
--LAB2--
create view View1 as
select*from Sanpham
go
select*from View1

create view View2 as
select top 100 percent Sanpham.masp, Sanpham.tensp, Hangsx.tenhang, Sanpham.soluong, Sanpham.mausac, Sanpham.giaban, Sanpham.donvitinh, Sanpham.mota
from Sanpham inner join Hangsx on Sanpham.mahangsx=Hangsx.mahangsx
order by Sanpham.giaban DESC;
go
select*from View2

create view View3 as
select Sanpham.masp, Sanpham.tensp, Hangsx.tenhang, Sanpham.soluong, Sanpham.mausac, Sanpham.giaban, Sanpham.donvitinh, Sanpham.mota
from Sanpham inner join Hangsx on Sanpham.mahangsx=Hangsx.mahangsx
where Hangsx.tenhang='samsung'
go
select*from View3

create view View4 as
select*from Nhanvien 
where gioitinh='Nữ' and phong='Kế toán';
go
select*from View4

create view View5 as
select top 100 percent sohdn, Sanpham.masp, tensp, tenhang, soluongN, dongiaN, tiennhap=soluongN*dongiaN, mausac, donvitinh, ngaynhap, tennv, phong
from Nhap
join Sanpham ON Nhap.masp = Sanpham.masp
join Hangsx ON Sanpham.Mahangsx = Hangsx.Mahangsx
join Nhanvien ON Nhap.Manv = Nhanvien.Manv
order by sohdn ASC
go
select*from View5

create view View6 as
select distinct top 100 percent sohdx, xuat.masp, tensp, tenhang, soluongx, giaban, tienxuat=soluongx*giaban, mausac, donvitinh, ngayxuat, tennv, phong
from xuat
join sanpham ON xuat.masp = sanpham.masp
join hangsx ON sanpham.mahangsx = hangsx.mahangsx
join nhanvien ON xuat.Manv = nhanvien.manv
where YEAR(ngayxuat) = 2018 AND MONTH(ngayxuat) = 10 ORDER BY sohdx ASC
go
select*from View6

create view View8 as
select top 10 *FROM xuat 
where YEAR(soluongx) = 2018 
order by soluongx ASC
go
select*from View8

create view View9 as
select top 10 * from sanpham 
order by giaban DESC
go
select*from View9

create view View10 as
select top 100 percent *from sanpham join hangsx on sanpham.mahangsx = hangsx.mahangsx
where giaban between 100000 AND 500000 AND hangsx.tenhang = 'Samsung'
go
select*from View10

--LAB3--
create view View11 as
select top 100 percent mahangsx,COUNT(*) as N'Tong loai san pham'
from sanpham
group by mahangsx
go
select*from View11

create view View12 as
select Nhap.Masp, tensp,tongtiennhap = Nhap.dongiaN*Nhap.soluongN
from Nhap INNER JOIN Sanpham ON Nhap.Masp=Sanpham.masp 
where YEAR(ngaynhap)=2019
group by Nhap.dongiaN, Nhap.soluongN, Sanpham.tensp, Nhap.Masp
go
select*from View12

create view View13 as
select Xuat.Masp, Sanpham.mahangsx, soluongx, tensp, Ngayxuat
from Xuat
JOIN Sanpham ON Xuat.Masp = Sanpham.masp
JOIN Hangsx ON Sanpham.mahangsx = Hangsx.Mahangsx
where YEAR(Ngayxuat) = 2019 AND soluongX>10000 AND Tenhang = 'Samsung'
go
select*from View13

create view View14 as
select COUNT(Manv) as N'so luong', Tennv, Phong
from Nhanvien where Gioitinh = 'Nam' GROUP BY Tennv, Phong
go
select*from View14

create view View15 as
select Tenhang, tensp, soluongN
from Nhap
JOIN Sanpham ON Nhap.Masp = Sanpham.masp
JOIN Hangsx ON Sanpham.mahangsx = Hangsx.Mahangsx
where YEAR(Ngaynhap) = 2019
group by Tenhang, tensp, soluongN
go
select*from View15

create view View16 as
select soluongX, Sohdx, giaban, tongtienxuat=soluongX*giaban
from Xuat, Sanpham
JOIN Nhanvien ON Xuat.manv = Nhanvien.manv
where YEAR(Ngayxuat) = 2020
group by Sohdx, Nhanvien.Manv, soluongX
go
select*from View16

create view View17 as
select Sohdn, Nhanvien.Manv, soluongN, dongiaN, Ngaynhap, tiennhap=soluongN*dongiaN
from Nhap INNER JOIN Nhanvien ON Nhap.Manv = Nhanvien.Manv
where YEAR(Ngaynhap) = 2019 AND MONTH(Ngaynhap) = 8 AND dongiaN>100000
group by Sohdn, Nhanvien.Manv, soluongN, dongiaN, Ngaynhap
go
select*from View17