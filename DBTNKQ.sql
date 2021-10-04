create database [TNKQ]

Use [TNKQ]

/*Tables*/
--Table BaiThi
create table BAITHI
(	
	ID_BAITHI char(10) not null primary key(ID_BAITHI) constraint PK_BAITHI default dbo.AUTO_IDBThi() ,
	ID_DIEMTHI char(10) not null,
	ID_DETHI char(10)not null,
	ID_TGTHI char(10) not null,
	CAUTL nvarchar(500) not null,
	TINHTRANG int,
);
--Table Chi tiet de thi
Create table CTDTHI
(
	ID_CTDTHI char(10) not null ,--primary key(ID_CTDTHI) constraint PK_CTDTHI default dbo.AUTO_IDDThi(),
	ID_DTHI char(10) not null,
	CAUHOI nvarchar(500),
	A nvarchar(200),
	B nvarchar(200),
	C nvarchar (200),
	D nvarchar (200),
	TGBDau datetime,
	TGKT datetime,
	constraint PK_CTDTHI primary key(ID_CTDTHI)
);
--Table Chức Vụ
 create table CHUCVU(
	ID_CVU char(10) not null,--primary key(ID_CVU) constraint PK_CVU default DBO.AUTO_IDCVU(),
	TENCVU nvarchar(50), 
	constraint PK_CVU primary key(ID_CVU)
 );
 --Table Đề Thi
 create table DETHI(
	ID_DETHI char(10) not null,-- primary key(ID_DETHI) constraint PK_DTHI default DBO.AUTO_IDDETHI(),
	TENDETHI nvarchar(50),
	SLCAU int,
	TGLamBai int,
	constraint PK_DETHI primary key(ID_DETHI)
 );
 --Table Điểm Thi
 Create table DIEMTHI(
	ID_DIEMTHI char(10) not null,
	DIEMTHI float,
	constraint PK_DIEMTHI primary key(ID_DIEMTHI)
 );
 --Table Giảng Viên
 Create table GIANGVIEN(
	ID_GVIEN char(10) not null primary key(ID_GVIEN) constraint PK_GIANGVIEN default DBO.AUTO_IDGVIEN(),
	PASSGV nvarchar(30),
	TENGV nvarchar(50),
	HINHGV nvarchar(100),
	NAMSINH date,
	GIOITINH nvarchar(5),
	CHUYENMON nvarchar(50),
	TDHOCVAN nvarchar(50),
	ID_CVU char(10) not null,
	ID_KHOA char(10) not null,
	--constraint PK_GIANGVIEN primary key(ID_GVIEN)
)
--Table Khoa
create table KHOA(
	ID_KHOA char(10) not null primary key(ID_KHOA) constraint PK_KHOA default DBO.AUTO_IDKHOA(),
	TENKHOA nvarchar(50),
	DIADIEM nvarchar(10),
	--constraint PK_KHOA primary key(ID_KHOA)
);
--Table Lịch thi
create table LICHTHI(
	ID_LICHTHI char(10)not null ,--primary key(ID_LICHTHI) constraint PK_LICHTHI default DBO.AUTO_IDLICHTHI(),
	TENLICHTHI nvarchar(50),
	NGAYTAO datetime,
	NGAYTHI date,
	Tiet nvarchar(10),
	ID_GVIEN char(10) not null,
	ID_MONHOC char(10) not null,
	constraint PK_LICHTHI primary key(ID_LICHTHI)
);
--Table Lớp
create table LOPHOCPHAN(
	ID_LOPHP char(10) not null ,--primary key(ID_LOP) constraint PK_LOP default DBO.AUTO_IDLOP(),
	TENLOP nvarchar(50),
	SISO int ,
	ID_MONHOC char(10) not null,
	ID_GVIEN char(10) not null,
	constraint PK_LOP primary key(ID_LOPHP)
);
--Table Môn học
create table MONHOC(
	ID_MONHOC char(10) not null,-- primary key(ID_MONHOC) constraint PK_MONHOC default DBO.AUTO_IDMONHOC(),
	TENMONHOC nvarchar(50),
	TChi int,
	constraint PK_MONHOC primary key(ID_MONHOC)
);
--Table Ngân hàng câu hỏi
create table NHCH(
	ID_NHCH char(10) not null,-- primary key(ID_NHCH) constraint PK_NHCH default DBO.AUTO_IDNHCH(),
	NOIDUNGCH nvarchar(500),
	DAPANDUNG nvarchar(200),
	A nvarchar(200),
	B nvarchar(200),
	C nvarchar(200),
	D nvarchar(200),
	MUCDO nvarchar(10),
	TGIANCAPNHAT datetime,
	ID_MONHOC char(10),
	ID_GVIEN char(10)
	constraint PK_NHCH primary key(ID_NHCH)
);
--Table Sinh viên
create table SINHVIEN(
	ID_SVIEN char(11) not null primary key(ID_SVIEN) constraint PK_SINHVIEN default DBO.AUTO_IDSVien(),
	PASSSVIEN nvarchar(30),
	TENSV nvarchar(50),
	HINHSV Nvarchar(100),
	NAMSINH date,
	GIOITINH nvarchar(5),
	SDT char(12),
	DIACHI nvarchar(100),
	CMND nchar(11),
	QUEQUAN nvarchar(100),
	TTrang int,
	ID_LOPHP char(10)not null,
	ID_KHOA char(10) not null,
);
--Table Tham gia thi
create table TGTHI(
	ID_TGTHI char(10) not null,-- primary key(ID_TGTHI) constraint PK_TGTHI default DBO.AUTO_IDTGTHI(),
	TTRANG int,
	ID_LICHTHI char(10)not null,
	ID_SVIEN char(10) not null,
	ID_BAITHI char(10) not null,
	constraint PK_TGTHI primary key(ID_TGTHI)
);
/*Foreign*/
--Foreign Bài thi với Điểm thi
alter table BAITHI
add constraint FK_BT_DIEMTHI foreign key(ID_DIEMTHI) references DIEMTHI(ID_DIEMTHI)
--Foreign Bài thi với Đề Thi
alter table BAITHI
Add constraint FK_BT_DETHI foreign key(ID_DETHI) references DETHI(ID_DETHI)
--Foreign Bài thi với Tham gia thi
alter table BAITHI
add constraint FK_BT_TGTHI foreign key(ID_TGTHI) references TGTHI(ID_TGTHI)
--Foreign Chi tiết đề thi với đề thi
alter table CTDTHI
add constraint FK_CTDTHI_DETHI foreign key(ID_DETHI) references DETHI(ID_DETHI)
--foreign Giảng viên với chức vụ
alter table GIANGVIEN
add Constraint FK_GVIEN_CV foreign key(ID_CVU) references CHUCVU(ID_CVU)
--foreign giảng viên với khoa
alter table GIANGVIEN
add Constraint FK_GVIEN_KHOA foreign key(ID_KHOA) references KHOA(ID_KHOA)
--foreign Lịch Thi với Nhân viên
alter table LICHTHI
add constraint FK_LichThi_GVIEN foreign key(ID_GVIEN) references NHANVIEN(ID_GVIEN)
--foreign Lịch thi với Môn Học
alter table LICHITHI
add constraint FK_LICHTHI_MONHOC foreign key(ID_MONHOC) references MONHOC(ID_MONHOC)
--foreign lớp với Giảng viên
alter table LOPHP
add constraint FK_LOP_GVIEN foreign key(ID_GVIEN) references KHOA(ID_GVIEN)
--Foreign ngân hàng câu hỏi với môn học
alter table NHCH
add constraint FK_NHCH_MONHOC foreign key(ID_MONHOC) references MONHOC(ID_MONHOC)
--Foreign ngân hàng câu hỏi với nhân viên
alter table NHCH
add constraint FK_NHCH_GVIEN foreign key(ID_GVIEN) references NHANVIEN(ID_GVIEN)
--Foreign Sinh viên với lớp
alter table SINHVIEN
add constraint FK_SVIEN_LOP foreign key(ID_LOPHP) references LOP(ID_LOPHP)
--Foreing Sinh viên với khoa
alter table SINHVIEN
add constraitn FK_SVIEN_KHOA foreign key(ID_KHOA) references KHOA(ID_KHOA)
--foreign Tham gia thi với lịch thi
alter table TGTHI
add constraint FK_TGTHI_LICHTHI foreign key(ID_LICHTHI) references LICHTHI(ID_LICHTHI)
--foreign tham gia thi với sinh viên
alter table TGTHI
add constraint FK_TGTHI_SVIEN foreign key(ID_SVIEN) references SINHVIEN(ID_SVIEN)
--foreign Tham gia thi với Bài thi
alter table TGTHI
add constraint FK_TGTHI_BAITHI foreign key(ID_BAITHI) references BAITHI(ID_BAITHI)


/*Values*/




/*Functions*/
--Function Bài thi
create function AUTO_IDBThi()
returns varchar(10)
as 
begin
	Declare @ID Varchar(10)
	if(select count(ID_BAITHI) from BAITHI)=0
		Set @ID='0'
	else
		Select @ID = MAX(RIGHT(ID_BAITHI,3)) from BAITHI
		Select @ID = CASE
				When @ID >= 0 and @ID < 9 then 'BT00' + CONVERT(char,CONVERT(INT,@ID)+1)
				When @ID >=9 then 'BT0'+CONVERT(Char,Convert(INT,@ID)+1)
		end
	return @ID
end
--Function Khoa
create function AUTO_IDKHOA()
returns varchar(10)
as 
begin
	Declare @ID Varchar(10)
	if(select count(ID_BAITHI) from BAITHI)=0
		Set @ID='0'
	else
		Select @ID = MAX(RIGHT(ID_BAITHI,3)) from BAITHI
		Select @ID = CASE
				When @ID >= 0 and @ID < 9 then 'BT00' + CONVERT(char,CONVERT(INT,@ID)+1)
				When @ID >=9 then 'BT0'+CONVERT(Char,Convert(INT,@ID)+1)
		end
	return @ID
end
--Function NV
create function AUTO_IDNV()
returns varchar(10)
as 
begin
	Declare @ID Varchar(10)
	if(select count(ID_BAITHI) from BAITHI)=0
		Set @ID='0'
	else
		Select @ID = MAX(RIGHT(ID_BAITHI,3)) from BAITHI
		Select @ID = CASE
				When @ID >= 0 and @ID < 9 then 'BT00' + CONVERT(char,CONVERT(INT,@ID)+1)
				When @ID >=9 then 'BT0'+CONVERT(Char,Convert(INT,@ID)+1)
		end
	return @ID
end
--Function GV
create function AUTO_IDGVIEN()
returns varchar(10)
as 
begin
	Declare @ID Varchar(10)
	if(select count(ID_BAITHI) from BAITHI)=0
		Set @ID='0'
	else
		Select @ID = MAX(RIGHT(ID_BAITHI,3)) from BAITHI
		Select @ID = CASE
				When @ID >= 0 and @ID < 9 then 'BT00' + CONVERT(char,CONVERT(INT,@ID)+1)
				When @ID >=9 then 'BT0'+CONVERT(Char,Convert(INT,@ID)+1)
		end
	return @ID
end
--Function SV
create function AUTO_IDSVien()
returns varchar(10)
as 
begin
	Declare @ID Varchar(10)
	if(select count(ID_BAITHI) from BAITHI)=0
		Set @ID='0'
	else
		Select @ID = MAX(RIGHT(ID_BAITHI,3)) from BAITHI
		Select @ID = CASE
				When @ID >= 0 and @ID < 9 then 'BT00' + CONVERT(char,CONVERT(INT,@ID)+1)
				When @ID >=9 then 'BT0'+CONVERT(Char,Convert(INT,@ID)+1)
		end
	return @ID
end