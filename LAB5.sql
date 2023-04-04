--1)--
create function TenHang (@masp nchar(10))
returns nvarchar(20) as
begin
declare @Tenhang nvarchar(20) 
set @Tenhang = (select Tenhang from Hangsx INNER JOIN Sanpham on Hangsx.mahangsx = Sanpham.mahangsx where Sanpham.masp = @masp)
return @Tenhang
end
go
select dbo.TenHang('SP01')

--2)--
create function GiaTriNhap (@x int, @y int)
returns int as
begin
declare @GiaTriNhap int
select @GiaTriNhap = SUM(soluongN*dongiaN) from Nhap where YEAR(NGAYNHAP) BETWEEN @x and @y
return @GiaTriNhap
end
go
select dbo.GiaTriNhap(2019,2021)

--4)--
create function TongGiaTriNhapNgay(@x int, @y int)
returns int as
begin
declare @TongGiaTriNhapNgay int
select @TongGiaTriNhapNgay = SUM(soluongN*dongiaN) from Nhap 
where DAY(Ngaynhap) BETWEEN @x and @y
return @TongGiaTriNhapNgay
end
go
select dbo.TongGiaTriNhapNgay(1,20)

--5)--
create function TongGiaTriXuat(@tenhang nvarchar(20), @y int)
returns int as
begin
declare @TongGiaTriXuat int
select @TongGiaTriXuat = SUM(soluongX*giaban) from Xuat INNER JOIN Sanpham on Xuat.masp = Sanpham.masp INNER JOIN Hangsx on Sanpham.mahangsx = Hangsx.mahangsx
where Hangsx.Tenhang = @tenhang AND YEAR(Ngayxuat) = @y
return @TongGiaTriXuat
end
go
select dbo.TongGiaTriXuat('Samsung', 2020)

--6)--
create function ThongKeNhanVien(@tenphong nvarchar(30))
returns int as
begin
declare @ThongKeNhanVien int
select @ThongKeNhanVien = Count(Phong) from Nhanvien 
where Nhanvien.Phong = @tenphong
return @ThongKeNhanVien
end
go
select dbo.ThongKeNhanVien('Ke Toan')

--7)--
create function Soluongxuattheongay(@tensp nvarchar(20),@y int)
returns int as
begin
declare @Soluongxuattheongay int
select @Soluongxuattheongay = Sum(soluongX) from Xuat INNER JOIN Sanpham on Xuat.masp = Sanpham.masp
where Sanpham.tensp = @tensp AND DAY(Ngayxuat) = @y
return @Soluongxuattheongay
end
go
select dbo.Soluongxuattheongay('GalaxyV21', 18)

--10)--
create function Tongsoluongsanpham(@tenhang nvarchar(20))
returns int as
begin
declare @Tongsoluongsanpham int
select @Tongsoluongsanpham = Count(tensp) from Sanpham INNER JOIN Hangsx on Sanpham.mahangsx = Hangsx.mahangsx 
where Hangsx.Tenhang = @tenhang
return @Tongsoluongsanpham
end
go
select dbo.Tongsoluongsanpham('Samsung')
