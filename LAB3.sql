use QLBanHang

--1) Thống kê mỗi hãng sản xuất có bao nhiêu loại sản phẩm--
select mahangsx,COUNT(*) as N'Tong loai san pham'
from sanpham
group by mahangsx

--2) Thống kê tổng tiền nhập của mỗi sản phẩm trong năm 2019--
select Nhap.Masp, tensp,tongtiennhap = Nhap.dongiaN*Nhap.soluongN
from Nhap INNER JOIN Sanpham ON Nhap.Masp=Sanpham.masp 
where YEAR(ngaynhap)=2019
group by Nhap.dongiaN, Nhap.soluongN, Sanpham.tensp, Nhap.Masp

--3) Thống kê các sản phẩm có tổng số lượng xuất năm 2018 là lớn hơn 10.000 sản phẩm hãng Samsung--
select Xuat.Masp, Sanpham.mahangsx, soluongx, tensp, Ngayxuat
from Xuat
JOIN Sanpham ON Xuat.Masp = Sanpham.masp
JOIN Hangsx ON Sanpham.mahangsx = Hangsx.Mahangsx
where YEAR(Ngayxuat) = 2019 AND soluongX>10000 AND Tenhang = 'Samsung'

--4) Thống kê số lượng nhân viên Nam của mỗi phòng ban--
select COUNT(Manv) as N'so luong', Tennv, Phong
from Nhanvien where Gioitinh = 'Nam' GROUP BY Tennv, Phong

--5) Thống kê tổng số lượng nhập của mỗi hãng sản xuất trong năm 2019--
select Tenhang, tensp, soluongN
from Nhap
JOIN Sanpham ON Nhap.Masp = Sanpham.masp
JOIN Hangsx ON Sanpham.mahangsx = Hangsx.Mahangsx
where YEAR(Ngaynhap) = 2019
group by Tenhang, tensp, soluongN

--6) Thống kê tổng số lượng tiền xuất của mỗi nhân viên trong năm 2020--
select soluongX, Sohdx, giaban, tongtienxuat=soluongX*giaban
from Xuat, Sanpham
JOIN Nhanvien ON Xuat.Manv = Nhanvien.Manv
where YEAR(Ngayxuat) = 2020
group by Sohdx, Nhanvien.Manv, soluongX

--7) Đưa ra tổng tiền nhập của mỗi nhân viên trong tháng 8 năm 2019 có tổng giá trị lớn hơn 100.000--
select Sohdn, Nhanvien.Manv, soluongN, dongiaN, Ngaynhap, tiennhap=soluongN*dongiaN
from Nhap INNER JOIN Nhanvien ON Nhap.Manv = Nhanvien.Manv
where YEAR(Ngaynhap) = 2019 AND MONTH(Ngaynhap) = 8 AND dongiaN>100000
group by Sohdn, Nhanvien.Manv, soluongN, dongiaN, Ngaynhap

--8) Đưa ra danh sách các sản phẩm đã nhập nhưng chưa xuất bao giờ--
