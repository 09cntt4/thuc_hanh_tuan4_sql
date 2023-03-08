use QLDA1
Create	table NHANVIEN
(
	HOVN	nvarchar(15),
	TENLOT	nvarchar(15),
	TENNV	nvarchar(15) not null,
	MANV	char	(9) not null,
	NGSINH	Datetime,
	DCHI	nvarchar(30),
	PHAI	nvarchar(3),
	LUONG	float,
	MA_NQL	char(9),
	PHG	int,
	constraint PK_NHANVIEN primary key(MANV),
	
)

Create	table PHONGBAN
(
	TENPHG	nvarchar(15),
	MAPHG	int not null,
	TRPHG	char(9),
	NG_NHANCHUC Datetime
	constraint PK_PHONGBAN primary key(MAPHG)
)


Create table DIADIEM_PHG
(
	MAPHG	int,
	DIADIEM nvarchar(50)
	constraint PK_DIADIEM_PHG primary key (MAPHG, DIADIEM)
)

Create table DEAN
(
	TENDA	nvarchar(15),
	MADA	int,
	DDIEM_DA nvarchar(50),
	PHONG	int,
	constraint PK_DEAN primary key(MADA)
)

Create table CONGVIEC
(
	MADA int,
	STT  int,
	TEN_CONG_VIEC nvarchar(50),
	constraint PK_CONGVIEC primary key (MADA, STT)
	
)

Create table PHANCONG
(
	MA_NVIEN char(9),
	MADA	 int,
	THOIGIAN float,
	constraint PK_PHANCONG primary key (MA_NVIEN, MADA)
)

Create	table THANNHAN
(
	MA_NVIEN char(9),
	TENTN	 nvarchar(15),
	PHAI	 nvarchar(3),
	NGSINH	Datetime,
	QUANHE 	nvarchar(15),
	constraint PK_THANNHAN primary key (MA_NVIEN, TENTN) 
)

set dateformat myd sp_help nhanvien

----------------------------------*tao khoa ngoai*---------------------------
--tao khoa ngoai cho bang NHANVIEN
alter table NHANVIEN
add 
constraint FK_NHANVIEN_NHANVIEN foreign key(MA_NQL) references NHANVIEN(MANV),
constraint FK_NHANVIEN_PHONGBAN foreign key(PHG) references PHONGBAN(MAPHG)
--tao khoa ngoai cho bang PHONGBAN
alter table PHONGBAN
add
constraint FK_PHONGBAN_NHANVIEN foreign key(TRPHG) references NHANVIEN(MANV)
--tao khoa ngoai cho bang DIADIEM_PHG
alter table DIADIEM_PHG
add
constraint FK_DIADIEMPHG_PHONGBAN foreign key(MAPHG) references PHONGBAN(MAPHG)
--tao khoa ngoai cho bang DEAN
alter table DEAN
add
constraint FK_DEAN_PHONGBAN foreign key(PHONG) references PHONGBAN(MAPHG)
--tao khoa ngoai cho CONGVIEC
alter table CONGVIEC
add
constraint FK_CONGVIEC_DEAN foreign key(MADA) references DEAN(MADA)
--tao khoa ngoai cho PHANCONG
alter table PHANCONG
add
constraint FK_PHANCONG_CONGVIEC foreign key(MADA, STT) references CONGVIEC(MADA, STT)

alter table PHANCONG
add
constraint FK_PHANCONG_DEAN foreign key(MADA) references DEAN(MADA),
constraint FK_PHANCONG_NHANVIEN foreign key(MA_NVIEN) references NHANVIEN(MANV)
alter table THANNHAN
add constraint FK_THANNHAN_NHANVIEN foreign key(MA_NVIEN) references NHANVIEN(MANV)
--------------------------Chen du lieu -------------------------------------------
set dateformat dmy
select * from nhanvien
delete  nhanvien
insert into NHANVIEN values(N'Vương', N'Ngọc', N'Quyền', 
'006', '01/01/1965', N'45 Trưng Vương Hà Nội', N'Nữ', 55000, null, null)

insert into NHANVIEN values(N'Nguyễn', N'Thanh', N'Tùng', 
'005', '20/08/1962', N'222 Nguyễn Văn Cừ TPHCM', N'Nam', 40000, NULL, null) /*006*/

insert into NHANVIEN values(N'Lê', N'Thị', N'Nhàn', 
'001', '01/02/1967', N'291 Hồ Văn Huê TPHCM', N'Nữ', 43000, NULL, null)/*006*/

insert into NHANVIEN values(N'Nguyễn', N'Mạnh', N'Hùng', 
'004', '04/03/1967', N'95 Bà Rịa Vũng Tàu', N'Nam', 38000, NULL, null)/*005*/

insert into NHANVIEN values(N'Trần', N'Thanh', N'Tâm', 
'003', '04/05/1957', N'34 Mai Thị Lựu TPHCM', N'Nam', 25000, NULL, null) /*005*/

insert into NHANVIEN values(N'Bùi', N'Thúy', N'Bư', 
'007', '11/03/1954', N'332 Nguyễn Thái Học TPHCM', N'Nam', 25000, NULL, null)/*001*/

insert into NHANVIEN values(N'Trần', N'Hồng', N'Quang', 
'008', '01/09/1967', N'80 Lê Hồng Phong TPHCM', N'Nam', 25000, NULL, null) /*001*/

insert into NHANVIEN values(N'Đinh', N'Bá', N'Tiến', 
'009', '12/01/1960', N'119 Cống Quỳnh TPHCM', N'Nam', 30000, NULL, null)

select *from NHANVIEN

-- nhap du lieu cho PHONGBAN

insert into PHONGBAN values(N'Nghiên Cứu', 5, '005', '22/05/1987')
insert into PHONGBAN values(N'Diều Hành', 4, '008', '01/01/1985')
insert into PHONGBAN values(N'Quản Lý', 1, '006', '19/06/1971')
SELECT * FROM PHONGBAN
--cap nhat lai du lieu PHONG cho nhan vien

update NHANVIEN
set    PHG = 5
where  MANV = '009'

update NHANVIEN
set    PHG = 5
where  MANV = '005'

update NHANVIEN
set    PHG = 4
where  MANV = '007'

update NHANVIEN
set    PHG = 4
where  MANV = '001'

update NHANVIEN
set    PHG = 5
where  MANV = '003'

update NHANVIEN
set    PHG = 5
where  MANV = '004'

update NHANVIEN
set    PHG = 4
where  MANV = '008'

update NHANVIEN
set    PHG = 1
where  MANV = '006'

update NHANVIEN
set    PHG = 5
where  MANV = '009'

select *from NHANVIEN

--cap nhat du lieu cho bang DIADIEM_PHG

insert into DIADIEM_PHG values(1, 'TP HCM')
insert into DIADIEM_PHG values(4, 'HA NOI')
insert into DIADIEM_PHG values(5, 'VUNG TAU')

select *from DIADIEM_PHG

--cap nhat du lieu cho bang DEAN
insert into DEAN values(N'Sản phẩm X', 1, 'VUNG TAU', 5)
insert into DEAN values(N'Sản phẩm Y', 2, 'NHA TRANG', 5)
insert into DEAN values(N'Sản phẩm Z', 3, 'TP HCM', 5)
insert into DEAN values(N'Tin học hóa', 10, 'HA NOI', 4)
insert into DEAN values(N'Cap Quang', 20, 'TP HCM', 1)
insert into DEAN values(N'Đào Tạo', 30, 'HA NOI', 4)

select *from DEAN

--cap nhat du lieu cho bang CONGVIEC

insert into CONGVIEC values(1, 1, N'Thiết kế sản phẩm X')
insert into CONGVIEC values(1, 2, N'Thử nghiệm sản phẩm X')
insert into CONGVIEC values(2, 1, N'Sản xuất sản phẩm Y')
insert into CONGVIEC values(2, 2, N'Quảng cáo sản phẩm Y')
insert into CONGVIEC values(3, 1, N'Khuyến mãi sản phẩm Z')
insert into CONGVIEC values(10, 1, N'Tin học hóa nhân sự tiền lương')
insert into CONGVIEC values(10, 2, N'Tin học hóa phòng kinh doanh')
insert into CONGVIEC values(20, 1, N'lắp đặt cáp quang')
insert into CONGVIEC values(30, 1, N'Đào tạo nhân viên maketing')
insert into CONGVIEC values(30, 2, N'Đào tạo chuyên viên thiết kế')

select *from CONGVIEC

--cap nhat du lieu cho bang THANNHAN
insert into THANNHAN values('005', N'Quang', N'Nữ', '05/04/1976', N'Con gái')
insert into THANNHAN values('005', N'Khang', N'Nam', '25/10/1973', N'Con trai')
insert into THANNHAN values('005', N'Dương', N'Nữ', '03/05/1948', N'Vợ chồng')
insert into THANNHAN values('001', N'Đăng', N'Nam', '19/02/1932', N'Vợ chồng')
insert into THANNHAN values('009', N'Duy', N'Nam', '01/01/1978', N'Con trai')
insert into THANNHAN values('009', N'Châu', N'Nữ', '30/12/1978', N'Con gái')
insert into THANNHAN values('009', N'Phương', N'Nữ', '05/05/1957', N'Vợ chồng')

select *from THANNHAN

--chen du lieu cho bang PHANCONG
insert into PHANCONG values('009', 1, 32)
insert into PHANCONG values('009', 2, 8)
insert into PHANCONG values('004', 3, 40)
insert into PHANCONG values('003', 1, 20)
insert into PHANCONG values('003', 2, 20)
insert into PHANCONG values('008', 10,35)
insert into PHANCONG values('008', 30,5)
insert into PHANCONG values('001', 30,20)
insert into PHANCONG values('001', 20,15)
insert into PHANCONG values('006', 20,30)
insert into PHANCONG values('005', 3, 10)
insert into PHANCONG values('005', 10,10)
insert into PHANCONG values('005', 20,10)
insert into PHANCONG values('007', 30,30)
insert into PHANCONG values('007', 10,10)

select *from PHANCONG

--1 
select (HOVN+ ' ' +TENLOT+ ' ' +TENNV) as 'danh sách các nhân viên có ít nhất 1 thân nhân'
from NHANVIEN,THANNHAN
where THANNHAN.MA_NVIEN>1

--2 
select (HOVN+ ' ' +TENLOT+ ' ' +TENNV) as ' danh sách các nhân viên không có thân nhân nào'
from NHANVIEN,THANNHAN
where THANNHAN.MA_NVIEN<1
group by hovn,TENLOT,TENNV

--3
select (HOVN+ ' ' +TENLOT+ ' ' +TENNV) as 'danh sách các nhân viên có trên 2 thân nhân'
from NHANVIEN,THANNHAN
where THANNHAN.MA_NVIEN>=2

--4 Cho biết họ tên những trưởng phòng có ít nhất một thân nhân.
SELECT (NHANVIEN.HOVN + ' ' + NHANVIEN.TENLOT + ' '+ NHANVIEN.TENNV) AS 'Họ tên trưởng phòng có ít nhất 1 thân nhân'
FROM NHANVIEN, PHONGBAN
WHERE NHANVIEN.MANV = PHONGBAN.TRPHG AND PHONGBAN.TRPHG IN (SELECT THANNHAN.MA_NVIEN
																FROM NHANVIEN, THANNHAN
																 WHERE NHANVIEN.MANV = THANNHAN.MA_NVIEN)
							 
--6 Cho biết họ tên các nhân viên phòng Quản lý có mức lương trên mức lương trung bình của phòng Quản lý.

select HOVN+ ' ' +TENLOT+ ' ' +TENNV as ' họ và tên nhân viên' ,TENPHG+' ' as 'tên phòng' ,avg(LUONG) as ' lương trung bình của phòng quản lý'
	from PHONGBAN,DEAN,NHANVIEN
	where   PHONG=MAPHG and TENPHG like N'QUản lý'
	group by hovn,TENLOT,TENNV,TENPHG

--7 Cho biết họ tên nhân viên có mức lương trên mức lương trung bình của phòng mà nhân viên đó đang làm việc

select HOVN+ ' ' +TENLOT+ ' ' +TENNV as ' họ và tên nhân viên' ,TENPHG+' ' as 'tên phòng' ,avg(LUONG) as ' lương trung bình của nhân viên'
from NHANVIEN,PHONGBAN,DEAN
where phong=MAPHG
group by HOVN,TENLOT,TENNV,TENPHG

--8 Cho biết tên phòng ban và họ tên trưởng phòng của phòng ban có đông nhân viên nhất.

select HOVN+ ' ' +TENLOT+ ' ' +TENNV as ' họ và tên nhân viên trưởng phòng' ,TENPHG+' ' as 'tên phòng', count(*) as'so luong nhan vien'
from NHANVIEN,PHONGBAN,DEAN
where phong=MAPHG and PHONGBAN.TRPHG=NHANVIEN.MANV 
group by HOVN,TENLOT,TENNV,TENPHG

--9 Cho biết danh sách các đề án mà nhân viên có mã là 456 chưa tham gia.

select DEAN.TENDA
from NHANVIEN,PHANCONG,DEAN
where NHANVIEN.MANV = PHANCONG.MA_NVIEN and PHANCONG.MADA= DEAN.MADA and MANV=N'456'

--10 Danh sách nhân viên gồm mã nhân viên, họ tên và địa chỉ của những nhân viên không sống tại TP Quảng Ngãi nhưng làm việc cho một đề án ở TP Quảng Ngãi.
select manv,DCHI,TENNV as 'họ và tên nhân viên'
from NHANVIEN,DEAN
where DCHI=N'TP QUãng Ngãi%'  and DDIEM_DA=N'Quãng ngãi'

--11 Tìm họ tên và địa chỉ của các nhân viên làm việc cho một đề án ở một địa điểm nhưng lại không sống tại địa điểm đó.
SELECT DISTINCT (NHANVIEN.HOVN + ' ' + NHANVIEN.TENLOT + ' ' + NHANVIEN.TENNV) AS 'Họ tên nhân viên', NHANVIEN.DCHI as ' Địa chỉ nhân viên làm viêc'
FROM NHANVIEN, DEAN, DIADIEM_PHG
WHERE NHANVIEN.PHG = DEAN.PHONG AND NHANVIEN.PHG = DIADIEM_PHG.MAPHG AND DEAN.DDIEM_DA IN (SELECT DEAN.DDIEM_DA	FROM DEAN) AND DIADIEM_PHG.DIADIEM NOT LIKE DEAN.DDIEM_DA

--12 Cho biết danh sách các mã đề án có: nhân công với họ là Lê hoặc có người trưởng phòng chủ trì đề án với họ là Lê.
SELECT DISTINCT DEAN.MADA
FROM DEAN , NHANVIEN , PHANCONG 
WHERE DEAN.MADA =PHANCONG.MADA 
AND (NHANVIEN.HOvn LIKE 'Lê%' OR NHANVIEN.MANV IN (SELECT MA_NVIEN FROM NhanVien WHERE HOvn LIKE 'Lê%')) 
AND PHANCONG.MA_NVIEN= NHANVIEN.MANV;

--13 Liệt kê danh sách các đề án mà cả hai nhân viên có mã số 123 và 789 cùng làm.
SELECT DISTINCT DEAN.MADA
FROM DEAN , PHANCONG 
WHERE DEAN.MADA = PHANCONG.MADA AND PHANCONG.MADA = PHANCONG.MADA 
AND PHANCONG.MA_NVIEN = 123 AND pHANCONG.MA_NVIEN = 789;

--14. 14. Liệt kê danh sách các đề án mà cả hai nhân viên Đinh Bá Tiến và Trần Thanh Tâm cùng làm

SELECT DISTINCT DEAN.MADA
FROM DEAN , PHANCONG, NHANVIEN 
WHERE DEAN.MADA = PHANCONG.MADA AND PHANCONG.MADA = pHANCONG.MADA AND PHANCONG.MA_NVIEN = NHANVIEN.MANV AND PHANCONG.MA_NVIEN = NHANVIEN.MANV
AND NHANVIEN.TENNV = 'Tiến' AND NHANVIEN.TENNV = 'Tâm';


--15. Danh sách những nhân viên (bao gồm mã nhân viên, họ tên, phái) làm việc trong mọiđề án của công ty

SELECT PHANCONG.MA_NVIEN, NHANVIEN.TENNV,NHANVIEN.PHAI
FROM PHANCONG, NHANVIEN
WHERE PHANCONG.MA_NVIEN = NHANVIEN.MANV 
AND NOT EXISTS(SELECT DEAN.MADA
               FROM DeAn 
               WHERE NOT EXISTS(SELECT PHANCONG.MADA
                                FROM PHANCONG pc 
                                WHERE PHANCONG.MADA = DEAN.MADA 
                                AND PHANCONG.MA_NVIEN = NHANVIEN.MANV));