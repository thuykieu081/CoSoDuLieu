﻿
USE master;  
Go  
IF DB_ID (N'QLBanhang') IS NOT NULL  
DROP DATABASE QLBanhang;  
Go  
CREATE DATABASE QLBanhang;  
Go  
USE QLBanhang;  
Go

--Tạo bảng SanPham
Create Table SanPham 
(
	MaSP char (10) not null primary key,
	TenSP nvarchar (100) not null, 
	SoLuong int not null, 
	DVT nvarchar (20) not null
)
go
--Tạo bảng KhachHang
Create Table KhachHang
( 
	MaKH char (10) not null primary key, 
	TenKH nvarchar (50) not null, 
	SDTKH char (10) unique  not null, 
	DiaChiKH nvarchar (100) not null
)
go
-- Tạo bảng NhaCungCap
Create Table NhaCungCap
(
	MaNCC char (10) not null primary key, 
	TenNCC nvarchar (50) not null, 
	SDTNCC char (10) unique not null, 
	DiaChiNCC nvarchar(100) not null	 
)
go
-- Tạo bảng PhieuNhap
Create Table PhieuNhap
( 
	MaPN char (10) not null primary key, 
	NgayNhap date not null,
	TongTien numeric (20,0) not null,  
	MaNCC char (10) not null,
	foreign key (MaNCC) references NhaCungCap
)
go
-- Tạo bảng PhieuNhapChiTiet
Create Table PhieuNhapChiTiet
(
	MaPNCT char (10) not null primary key,
	SoLuongNhap int not null,
	DonGiaNhap numeric (10,2) not null, 
	MaSP char (10) not null, 
	MaPN char (10) not null,
	foreign key (MaSP) references SanPham,
	foreign key (MaPN) references PhieuNhap
)
go
-- Tạo bảng GiaSanPham
Create Table GiaSanPham
(
	MaGiaSanPham char(10) not null primary key,
	Gia numeric (10,0) not null, 
	NgayApDung date not null, 
	NgayKetThuc date not null, 
	MaSP char (10) not null, 
	MaPNCT char (10) not null,
	foreign key (MaSP) references SanPham,
	foreign key (MaPNCT) references PhieuNhapChiTiet
)
go
-- Tạo bảng DonBanHang
Create Table DonBanHang
(
	MaDH char (10) not null primary key, 
	Ngaylap date not null, 
	TongTien numeric (20,0) not null, 
	LoaiDH bit not null, 
	MaKH char (10) not null,
	KhoangCach NUMERIC(5, 2) not null,
    NgayShip DATE not null,
    PhiShip NUMERIC(10, 2) not null,
    TrangThaiDonHang NVARCHAR(50) not null,
    MaDV CHAR(10),
	foreign key (MaKH) references KhachHang
)
go
-- Tạo bảng DonBanHangChiTiet
Create Table DonBanHangChiTiet
(
	MaDHCT char (10) not null primary key, 
	SoLuong int not null, 
	DonGia numeric (10,2) not null, 
	DVT nvarchar (20) not null, 
	MaSP char (10) not null, 
	MaDH char (10) not null,
	foreign key (MaSP) references SanPham,
	foreign key (MaDH) references DonBanHang
)
go
-- Tạo bảng DonViGiaoHang
Create Table DonViGiaoHang
(
	MaDV char (10) not null primary key, 
	TenDV nvarchar (50) not null, 
	SDTDV char (10) unique not null, 
	DiaChiDV nvarchar (100) not null
)
go
-- Tạo bảng DonGiaoHang
Create Table DonGiaoHang
(
	 MaPhiShip char (10) not null primary key, 
	 KhoangCach numeric (5,2) not null, 
	 PhiShip numeric (10,2) not null, 
	 TrangThaiDonHang nvarchar (50) not null, 
	 MaDH char (10) not null, 
	 MaDV char(10) not null,
	 foreign key (MaDH) references DonBanHang,
	 foreign key (MaDV) references DonViGiaoHang
)
go

