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
	ID_CTDTHI char(10) not null primary key(ID_CTDTHI) constraint PK_CTDTHI default dbo.AUTO_IDDThi(),
	ID_DTHI char(10) not null,
	CAUHOI nvarchar(500),
	A nvarchar(200),
	B nvarchar(200),
	C nvarchar (200),
	D nvarchar (200),
	TGBDau datetime,
	TGKT datetime,
	

);
--Table Chức Vụ
 create table CHUCVU(
	ID_CVU char(10) not null primary key(ID_CVU) constraint PK_CVU default DBO.AUTO_IDCVU(),
	TENCVU nvarchar(50), 
 );
 --Table Đề Thi
 create table DETHI(
	ID_DETHI char(10) not null primary key(ID_DETHI) constraint PK_DTHI default DBO.AUTO_IDDETHI(),
	TENDETHI nvarchar(50),
	SLCAU int,
	TGLamBai int,
 );
 --Table Điểm Thi
 Create table DIEMTHI(
	ID_DIEMTHI char(10) not null,
	DIEMTHI float,
	constraint PK_DIEMTHI primary key(ID_DIEMTHI)
 );
 --Table Danh sách câu hỏi
 create table DSCAUHOI(
	ID_CAUHOI char(10) not null,
	TENCAUHOI nvarchar(500),
	DAPAN nvarchar(200),
	A nvarchar(200),
	B nvarchar(200),
	C nvarchar(200),
	D nvarchar(200),
	MUCDO nvarchar(10),
	ID_MONHOC char(10) not null,
	ID_GVIEN char(10) not null,
 );
 --Table Giảng Viên
 Create table GIANGVIEN(
	ID_GVIEN char(10) not null primary key(ID_GVIEN) constraint PK_GVIEN default DBO.AUTO_IDGVIEN(),
	PASSGV nvarchar(30),
	TENGV nvarchar(50),
	HINHGV nvarchar(100),
	NAMSINH date,
	GIOITINH nvarchar(5),
	SDT char(12),
	DIACHI nvarchar(100),
	ID_CVU char(10) not null,
	ID_KHOA char(10) not null,
	CMND nchar(11),
	QUEQUAN nvarchar(100)
)
--Table Khoa
create table KHOA(
	ID_KHOA char(10) not null ,
	TENKHOA nvarchar(50),
	SOPHONG nvarchar(10),
	constraint PK_KHOA primary key(ID_KHOA)
);
--Table Lịch thi
create table LICHTHI(
	ID_LICHTHI char(10)not null primary key(ID_LICHTHI) constraint PK_LICHTHI default DBO.AUTO_IDLICHTHI(),
	ID_NVIEN char(10)not null,
	TENLICHTHI nvarchar(50),
	NGAYTAO datetime,
	NGAYTHI date,
	Tiet nvarchar(10)
);
--Table Lớp
create table LOP(
	ID_LOP char(10) not null primary key(ID_LOP) constraint PK_LOP default DBO.AUTO_IDLOP(),
	TENLOP nvarchar(50),
	SISO int ,
	ID_KHOA char(10) not null,
);
--Table Môn học
create table MONHOC(
	ID_MONHOC char(10) not null primary key(ID_MONHOC) constraint PK_MONHOC default DBO.AUTO_IDMONHOC(),
	TENMONHOC nvarchar(50),
	TChi int
);
--Table Nhân viên
create table NHANVIEN(
	ID_NVIEN char(10) not null primary key(ID_NVIEN) constraint PK_NHANVIEN default DBO.AUTO_IDNV(),
	PASSNVIEN nvarchar(30),
	TENNV nvarchar(50),
	HINHNV nvarchar(100),
	NAMSINH date,
	GIOITINH nvarchar(5),
	SDT char(12),
	DIACHI nvarchar(100),
	ID_CVU char(10) not null,
	CMND nchar(11),
	QUEQUAN nvarchar(100)
);
--Table Ngân hàng câu hỏi
create table NHCH(
	ID_NHCH char(10) not null primary key(ID_NHCH) constraint PK_NHCH default DBO.AUTO_IDNHCH(),
	TENCH nvarchar(500),
	DAPAN nvarchar(200),
	A nvarchar(200),
	B nvarchar(200),
	C nvarchar(200),
	D nvarchar(200),
	MUCDO nvarchar(10),
	ID_MONHOC char(10),
	ID_NVIEN char(10)
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
	ID_LOP char(10)not null,
	ID_KHOA char(10) not null,
);
--Table Tham gia thi
create table TGTHI(
	ID_TGTHI char(10) not null primary key(ID_TGTHI) constraint PK_TGTHI default DBO.AUTO_IDTGTHI(),
	TTRANG int,
	ID_LICHTHI char(10)not null,
	ID_SVIEN char(10) not null,

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
--Foreign danh sách câu hỏi với môn học
alter table DSCAUHOI
add constraint FK_DSCHoi_MONHOC foreign key(ID_MONHOC) references MONHOC(ID_MONHOC)
--Foreign Danh sách câu hỏi với giảng viên
alter table DSCAUHOI
add Constraint FK_DSCHOI_GIANGVIEN foreign key(ID_GVIEN) references GIANGVIEN(ID_GVIEN)
--foreign Giảng viên với chức vụ
alter table GIANGVIEN
add Constraint FK_GVIEN_CV foreign key(ID_CVU) references CHUCVU(ID_CVU)
--foreign giảng viên với khoa
alter table GIANGVIEN
add Constraint FK_GVIEN_KHOA foreign key(ID_KHOA) references KHOA(ID_KHOA)
--foreign Lịch Thi với Nhân viên
alter table LICHTHI
add constraint FK_LichThi_NVIEN foreign key(ID_NVIEN) references NHANVIEN(ID_NVIEN)
--foreign lớp với khoa
alter table LOP
add constraint FK_LOP_KHOA foreign key(ID_KHOA) references KHOA(ID_KHOA)
--Foreign Nhân viên với chức vụ
alter table NHANVIEN
add constraint FK_NV_CVU foreign key(ID_CVU) references CHUCVU(ID_CVU)
--Foreign ngân hàng câu hỏi với môn học
alter table NHCH
add constraint FK_NHCH_MONHOC foreign key(ID_MONHOC) references MONHOC(ID_MONHOC)
--Foreign ngân hàng câu hỏi với nhân viên
alter table NHCH
add constraint FK_NHCH_NVIEN foreign key(ID_NVIEN) references NHANVIEN(ID_NVIEN)
--Foreign Sinh viên với lớp
alter table SINHVIEN
add constraint FK_SVIEN_LOP foreign key(ID_LOP) references LOP(ID_LOP)
--Foreing Sinh viên với khoa
alter table SINHVIEN
add constraitn FK_SVIEN_KHOA foreign key(ID_KHOA) references KHOA(ID_KHOA)
--foreign Tham gia thi với lịch thi
alter table TGTHI
add constraint FK_TGTHI_LICHTHI foreign key(ID_LICHTHI) references LICHTHI(ID_LICHTHI)
--foreign tham gia thi với sinh viên
alter table TGTHI
add constraint FK_TGTHI_SVIEN foreign key(ID_SVIEN) references SINHVIEN(ID_SVIEN)
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
--Function Khoa(Không cho khoa tạo tự động)
/*create function AUTO_IDKHOA()
returns varchar(10)
as
begin
	declare @ID varchar(10)
	if(select count(ID_KHOA) from KHOA)= 0
		set @ID='0'
	else
		select @ID = MAX(Right(ID_KHOA,3)) from KHOA
		SElect @ID = CASE
			When @ID >= 0 and @ID <9 then 'KHOA00' +CONVERT(char,Convert(INT,@ID)+1)
			When @ID > 9 then 'KHOA0'+ CONVERT(Char,convert(int,@ID)+1)
		end
	return @ID
end*/

