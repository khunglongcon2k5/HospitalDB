CREATE DATABASE QuanLyBenhVien
GO
USE QuanLyBenhVien
GO
-- Tạo bảng khoa
CREATE TABLE khoa(
	ma_khoa VARCHAR(10) NOT NULL PRIMARY KEY ,
	ten_khoa NVARCHAR(50)
);
GO
-- Tạo bảng phòng
CREATE TABLE phong(
	ma_phong VARCHAR(10) NOT NULL PRIMARY KEY,
	ten_phong NVARCHAR(50),
	ma_khoa VARCHAR(10),
	FOREIGN KEY (ma_khoa) REFERENCES khoa(ma_khoa)
);
GO
-- Tạo bảng bác sĩ
CREATE TABLE bac_si(
	ma_bac_si VARCHAR(10) NOT NULL PRIMARY KEY,
	ten_bac_si NVARCHAR(50),
	gioi_tinh BIT,
	chuyen_mon NVARCHAR(50),
	nam_sinh DATE,
	cmnd VARCHAR(12),
	ma_khoa VARCHAR(10),
	FOREIGN KEY (ma_khoa) REFERENCES khoa(ma_khoa)
);
GO
-- Tạo bảng bệnh nhân
CREATE TABLE benh_nhan(
	ma_benh_nhan VARCHAR(10) NOT NULL PRIMARY KEY,
	ho_ten NVARCHAR(50),
	gioi_tinh BIT,
	dia_chi NVARCHAR(50),
	nam_sinh DATE,
	cmnd VARCHAR(12)
);
GO
-- Tạo bảng giường bệnh
CREATE TABLE giuong_benh(
	ma_giuong VARCHAR(10) NOT NULL,
	trang_thai NVARCHAR(50),
	ma_phong VARCHAR(10) NOT NULL,
	ma_benh_nhan VARCHAR(10) NOT NULL, 
	FOREIGN KEY (ma_benh_nhan) REFERENCES benh_nhan(ma_benh_nhan), 
	FOREIGN KEY (ma_phong) REFERENCES phong(ma_phong),
	PRIMARY KEY(ma_giuong, ma_phong, ma_benh_nhan)
);
GO
-- Đổ dữ liệu vào bảng Khoa
INSERT INTO khoa(ma_khoa, ten_khoa) VALUES
    ('KH01', N'Hồi sức cấp cứu'),
    ('KH02', N'Cấp cứu'),
    ('KH03', N'Răng Hàm Mặt'),
    ('KH04', N'Phẫu thuật'),
    ('KH05', N'Ngoại'),
    ('KH06', N'Nội'),
    ('KH07', N'Thần kinh'),
    ('KH08', N'Ung bướu'),
    ('KH09', N'Sản'),
    ('KH10', N'Nhi'),
    ('KH11', N'Tim mạch'),
    ('KH12', N'Tai mũi họng'),
    ('KH13', N'Mắt'),
    ('KH14', N'Nội tiết'),
    ('KH15', N'Chấn thương chỉnh hình'),
    ('KH16', N'Lão khoa'),
    ('KH17', N'Da liễu'),
    ('KH18', N'Huyết học'),
    ('KH19', N'Nhiễm'),
    ('KH20', N'Y học cổ truyền');
GO
-- Đổ dữ liệu vào bảng Phòng
INSERT INTO phong(ma_phong, ten_phong, ma_khoa) VALUES
    ('P001', N'Phòng cấp cứu 1', 'KH01'),
    ('P002', N'Phòng cấp cứu 2', 'KH01'),
    ('P003', N'Phẫu thuật 1', 'KH04'),
    ('P004', N'Phẫu thuật 2', 'KH04'),
    ('P005', N'Khoa Nội 1', 'KH06'),
    ('P006', N'Khoa Nội 2', 'KH06'),
    ('P007', N'Khoa Nhi 1', 'KH10'),
    ('P008', N'Khoa Nhi 2', 'KH10'),
    ('P009', N'Khoa sản 1', 'KH09'),
    ('P010', N'Khoa sản 2', 'KH09'),
    ('P011', N'Răng hàm mặt', 'KH03'),
    ('P012', N'Tai mũi họng', 'KH12'),
    ('P013', N'Mắt', 'KH13'),
    ('P014', N'Tim mạch', 'KH11'),
    ('P015', N'Chấn thương chỉnh hình', 'KH15'),
    ('P016', N'Huyết học', 'KH18'),
    ('P017', N'Nhiễm', 'KH19'),
    ('P018', N'Y học cổ truyền', 'KH20'),
    ('P019', N'Lão khoa', 'KH16'),
    ('P020', N'Da liễu', 'KH17');
GO
-- Đổ dữ liệu vào bảng Bác sĩ
INSERT INTO bac_si(ma_bac_si, ten_bac_si, gioi_tinh, chuyen_mon, nam_sinh, cmnd, ma_khoa) VALUES
    ('BS001', N'Nguyễn Văn A', 1, N'Hồi sức', '1980-05-14', '123456789012', 'KH01'),
    ('BS002', N'Trần Thị B', 0, N'Cấp cứu', '1985-07-21', '234567890123', 'KH02'),
    ('BS003', N'Phạm Văn C', 1, N'Răng hàm mặt', '1975-11-02', '345678901234', 'KH03'),
    ('BS004', N'Hoàng Thị D', 0, N'Phẫu thuật', '1990-03-11', '456789012345', 'KH04'),
    ('BS005', N'Lê Văn E', 1, N'Ngoại tổng quát', '1982-09-25', '567890123456', 'KH05'),
    ('BS006', N'Đinh Thị F', 0, N'Nội tiết', '1978-12-30', '678901234567', 'KH06'),
    ('BS007', N'Bùi Văn G', 1, N'Tim mạch', '1986-06-15', '789012345678', 'KH11'),
    ('BS008', N'Ngô Thị H', 0, N'Nhi khoa', '1991-04-09', '890123456789', 'KH10'),
    ('BS009', N'Vũ Văn I', 1, N'Ung bướu', '1983-08-17', '901234567890', 'KH08'),
    ('BS010', N'Đoàn Thị K', 0, N'Thần kinh', '1987-10-22', '012345678901', 'KH07');
GO
-- Đỗ dữ liệu vào bảng Bệnh nhân
INSERT INTO benh_nhan(ma_benh_nhan, ho_ten, gioi_tinh, dia_chi, nam_sinh, cmnd) VALUES
    ('BN001', N'Nguyễn An', 1, N'Hà Nội', '1995-01-01', '123456789012'),
    ('BN002', N'Trần Bình', 0, N'Hải Phòng', '1990-02-15', '234567890123'),
    ('BN003', N'Lê Cường', 1, N'Nam Định', '1985-03-20', '345678901234'),
    ('BN004', N'Phạm Dũng', 1, N'TP Hồ Chí Minh', '1980-04-10', '456789012345'),
    ('BN005', N'Hoàng Diễm', 0, N'Đà Nẵng', '1992-05-05', '567890123456'),
    ('BN006', N'Vũ Thanh', 1, N'Cần Thơ', '1988-06-25', '678901234567'),
    ('BN007', N'Bùi Hạnh', 0, N'Huế', '1996-07-18', '789012345678'),
    ('BN008', N'Ngô Tùng', 1, N'Bắc Giang', '1987-08-14', '890123456789'),
    ('BN009', N'Văn Quý', 1, N'Quảng Nam', '1983-09-29', '901234567890'),
    ('BN010', N'Thảo Trang', 0, N'Vĩnh Long', '1991-10-12', '012345678901');

-- Đỗ dữ liệu vào bảng Giường bệnh
INSERT INTO giuong_benh(ma_giuong, trang_thai, ma_phong, ma_benh_nhan) VALUES
    ('G001', N'Trống', 'P001', 'BN001'),
    ('G002', N'Đã có bệnh nhân', 'P002', 'BN002'),
    ('G003', N'Trống', 'P003', 'BN003'),
    ('G004', N'Đã có bệnh nhân', 'P004', 'BN004'),
    ('G005', N'Trống', 'P005', 'BN005'),
    ('G006', N'Đã có bệnh nhân', 'P006', 'BN006'),
    ('G007', N'Trống', 'P007', 'BN007'),
    ('G008', N'Đã có bệnh nhân', 'P008', 'BN008'),
    ('G009', N'Trống', 'P009', 'BN009'),
    ('G010', N'Đã có bệnh nhân', 'P010', 'BN010');
--1. Thống kê số lượng bệnh nhân của mỗi phòng
SELECT ma_phong, COUNT(ma_benh_nhan) AS N'Số lượng bệnh nhân'
FROM giuong_benh
GROUP BY ma_phong;

--2. Hiển thị danh sách bệnh nhân ở phòng số P001, P002, P015
SELECT DISTINCT b.*
FROM benh_nhan b 
JOIN giuong_benh g ON b.ma_benh_nhan = g.ma_benh_nhan
WHERE g.ma_phong IN ('P001', 'P002', 'P015');

--3. Hiển thị danh sách bệnh nhân ở phòng Khoa sản 2
SELECT DISTINCT b.ma_benh_nhan, p.ma_phong, p.ten_phong, b.ho_ten
FROM benh_nhan b 
JOIN giuong_benh g ON b.ma_benh_nhan = g.ma_benh_nhan
JOIN phong p ON g.ma_phong = p.ma_phong
WHERE p.ten_phong LIKE N'%Khoa sản 2%'
ORDER BY b.ma_benh_nhan ASC;

--4. Cập nhật giường bệnh nhân 'BN001' sang giường mã số 'G007'
UPDATE giuong_benh
SET ma_giuong = 'G007'
WHERE ma_benh_nhan = 'BN001';

--5. Xem danh sách phòng không có bệnh nhân nào điều trị
SELECT *
FROM phong
WHERE ma_phong NOT IN (SELECT ma_phong 
                      FROM giuong_benh);

--6. Tạo bảng benh_nhan_db dữ liệu lấy từ bảng benh_nhan gồm những bệnh nhân ở khoa 'Hồi sức cấp cứu'
SELECT b.* INTO benh_nhan_db
FROM benh_nhan b
JOIN giuong_benh g ON b.ma_benh_nhan = g.ma_benh_nhan
JOIN phong p ON g.ma_phong = p.ma_phong
JOIN khoa k ON p.ma_khoa = k.ma_khoa
WHERE k.ten_khoa = N'Hồi sức cấp cứu';

--7. Hiển thị danh sách bệnh nhân chưa có số CMND
SELECT *
FROM benh_nhan
WHERE cmnd IS NULL;

--8. Thống kê số lượng bác sĩ của mỗi khoa
SELECT k.ma_khoa, COUNT(b.ma_bac_si) AS N'Số lượng bác sĩ'
FROM bac_si b 
JOIN khoa k ON b.ma_khoa = k.ma_khoa
GROUP BY k.ma_khoa;

--9. Hiển thị danh sách bác sĩ ở khoa Phẫu thuật
SELECT *
FROM bac_si b
JOIN khoa k ON b.ma_khoa = k.ma_khoa
WHERE k.ten_khoa = N'Phẫu thuật';

--10. Cho biết các khoa nào chưa có bác sĩ
SELECT *
FROM khoa
WHERE ma_khoa NOT IN (SELECT ma_khoa   
                     FROM bac_si);

--11. Xem thông tin các phòng bệnh của khoa Răng Hàm Mặt
SELECT *
FROM phong p
JOIN khoa k ON p.ma_khoa = k.ma_khoa
WHERE k.ten_khoa = N'Răng Hàm Mặt';

--12. Xem thông tin bác sĩ nữ, chuyên môn Cấp cứu
SELECT ma_bac_si, ten_bac_si,
       CASE 
           WHEN gioi_tinh = 0 THEN N'Nữ'
           ELSE N'Nam'
       END AS N'Giới tính',
       chuyen_mon, nam_sinh, cmnd, ma_khoa
FROM bac_si
WHERE gioi_tinh = 0 AND chuyen_mon = N'Cấp cứu';

--13. Chuyển bác sĩ có mã 'BS001' sang khoa Ngoại
UPDATE bac_si
SET ma_khoa = (SELECT ma_khoa 
               FROM khoa 
               WHERE ten_khoa = N'Ngoại') 
WHERE ma_bac_si = 'BS001';

--14. Xóa thông tin các phòng không thuộc khoa nào
DELETE FROM phong
WHERE ma_khoa NOT IN (SELECT ma_khoa FROM khoa);

--15. Thống kê số lượng phòng của mỗi khoa
SELECT ma_khoa, COUNT(ma_phong) AS N'Số lượng phòng'
FROM phong
GROUP BY ma_khoa;

--16. Hiển thị danh sách bác sĩ ở khoa Nhi
SELECT *
FROM bac_si b 
JOIN khoa k ON b.ma_khoa = k.ma_khoa
WHERE k.ten_khoa = N'Nhi';

--17. Xem thông tin các phòng bệnh của khoa Sản
SELECT * 
FROM phong p 
JOIN khoa k ON p.ma_khoa = k.ma_khoa
WHERE k.ten_khoa = N'Sản';

--18. Cho biết khoa chưa có phòng bệnh
SELECT *
FROM khoa
WHERE ma_khoa NOT IN (SELECT ma_khoa 
                     FROM phong);

--19. Cập nhật chuyên môn của bác sĩ mã 'BS001' thành Nội soi
UPDATE bac_si
SET chuyen_mon = N'Nội soi'
WHERE ma_bac_si = 'BS001';

--20. Xem thông tin bác sĩ trên 40 tuổi, chuyên môn Phẫu thuật
SELECT ma_bac_si, ten_bac_si, DATEDIFF(YEAR, nam_sinh, GETDATE()) AS N'Tuổi', chuyen_mon
FROM bac_si
WHERE DATEDIFF(YEAR, nam_sinh, GETDATE()) > 40 
AND chuyen_mon = N'Phẫu thuật';

--21. Chọn ra 2 bác sĩ trẻ tuổi nhất
SELECT TOP 2 ma_bac_si, ten_bac_si, DATEDIFF(YEAR, nam_sinh, GETDATE()) AS N'Tuổi'
FROM bac_si
ORDER BY nam_sinh DESC;

--22. Thống kê trạng thái của giường bệnh
SELECT trang_thai, COUNT(ma_giuong) AS N'Số giường'
FROM giuong_benh
GROUP BY trang_thai;

--23. Hiển thị danh sách bệnh nhân nữ ở phòng số P002
SELECT b.ma_benh_nhan, b.ho_ten, 
       CASE  
           WHEN gioi_tinh = 0 THEN N'Nữ'
           ELSE N'Nam'
       END AS N'Giới tính',
       p.ma_phong, p.ten_phong
FROM benh_nhan b
JOIN giuong_benh g ON b.ma_benh_nhan = g.ma_benh_nhan
JOIN phong p ON g.ma_phong = p.ma_phong
WHERE gioi_tinh = 0 AND p.ma_phong = 'P002';

--24. Hiển thị danh sách bệnh nhân ở phòng Khoa Nhi 1, Khoa Nhi 2
SELECT b.ma_benh_nhan, b.ho_ten, p.ten_phong 
FROM benh_nhan b
JOIN giuong_benh g ON b.ma_benh_nhan = g.ma_benh_nhan
JOIN phong p ON g.ma_phong = p.ma_phong
WHERE p.ten_phong IN (N'Khoa Nhi 1', N'Khoa Nhi 2')
ORDER BY b.ma_benh_nhan ASC;

--25. Xem thông tin những khoa chỉ có 1 phòng bệnh
SELECT k.ma_khoa, COUNT(p.ma_phong) AS N'Số lượng phòng bệnh'
FROM khoa k 
JOIN phong p ON k.ma_khoa = p.ma_khoa
GROUP BY k.ma_khoa
HAVING COUNT(p.ma_phong) = 1;

--26. Xem danh sách phòng không có bệnh nhân nào điều trị
SELECT *
FROM phong 
WHERE ma_phong NOT IN (SELECT ma_phong 
                      FROM giuong_benh);
GO

--27. Tạo View benh_nhan_cao_tuoi gồm những bệnh nhân trên 40 tuổi
CREATE VIEW benh_nhan_cao_tuoi 
AS
	SELECT ma_benh_nhan, ho_ten, gioi_tinh, 
		   DATEDIFF(YEAR, nam_sinh, GETDATE()) AS N'Tuổi'
	FROM benh_nhan
	WHERE DATEDIFF(YEAR, nam_sinh, GETDATE()) > 40;
GO
-- TEST VIEW
SELECT * FROM benh_nhan_cao_tuoi
GO

--28. In ra những bệnh nhân lớn tuổi nhất
SELECT *
FROM benh_nhan
WHERE nam_sinh = (SELECT MIN(nam_sinh) 
                 FROM benh_nhan);
GO

--Phần 2: Stored Procedure và Function
/*1. Viết thủ tục tham số truyền vào là mabn (mã bệnh nhân), thủ tục sẽ in ra thông
tin về bệnh nhân đó (tên bệnh nhân, ở phòng điều trị nào, giường số mấy).*/
CREATE PROC sp_xem_thong_tin_benh_nhan
(
    @ma_benh_nhan VARCHAR(10)
)
AS
BEGIN
    SELECT DISTINCT b.ho_ten AS N'Tên bệnh nhân', 
                    p.ten_phong AS N'Phòng điều trị', 
                    g.ma_giuong AS N'Số giường'
    FROM benh_nhan b
    JOIN giuong_benh g ON b.ma_benh_nhan = g.ma_benh_nhan
    JOIN phong p ON g.ma_phong = p.ma_phong
    WHERE b.ma_benh_nhan = @ma_benh_nhan;
END;
-- TEST PROCEDURE
EXEC sp_xem_thong_tin_benh_nhan @ma_benh_nhan = 'BN005'
GO

/*2. Viết thủ tục nhập vào mã bác sĩ bất kỳ (mabs là tham số), thủ tục sẽ in ra
thông tin của bác sĩ đó.*/
CREATE PROC sp_xem_thong_tin_bac_si
(
    @ma_bac_si VARCHAR(10)
)
AS
BEGIN
    SELECT *
    FROM bac_si
    WHERE ma_bac_si = @ma_bac_si;
END;
-- TEST PROCEDURE
EXEC sp_xem_thong_tin_bac_si @ma_bac_si = 'BS001';
GO

/*3. Viết thủ tục nhập vào mã phòng bất kỳ (maphong là tham số), thủ tục sẽ in ra
thông tin của phòng đó (thông tin gồm: tên phòng, tên khoa, tên bác sĩ)*/
CREATE PROC sp_xem_thong_tin_phong
(
    @ma_phong VARCHAR(10)
)
AS
BEGIN
    SELECT p.ten_phong AS N'Tên phòng', 
           k.ten_khoa AS N'Tên khoa', 
           b.ten_bac_si AS N'Tên bác sĩ'
    FROM phong p 
    JOIN khoa k ON p.ma_khoa = k.ma_khoa
    JOIN bac_si b ON k.ma_khoa = b.ma_khoa
    WHERE p.ma_phong = @ma_phong;
END;
-- TEST PROCEDURE 
EXEC sp_xem_thong_tin_phong @ma_phong = 'P002'    
GO

--4. Hàm đếm số giường trong phòng
CREATE FUNCTION f_dem_so_giuong
(
    @ma_phong VARCHAR(10)
)
RETURNS INT
AS
BEGIN
    DECLARE @so_giuong INT;
    SET @so_giuong = (
        SELECT COUNT(ma_giuong)
        FROM giuong_benh
        WHERE ma_phong = @ma_phong
    );
    RETURN @so_giuong;
END;
GO
-- TEST FUNCTION
SELECT DBO.f_dem_so_giuong('P002') AS N'Số giường'
GO
--Phần 3: Trigger
--1. Viết trigger không cho phép một giường có quá 2 bệnh nhân.
CREATE TRIGGER trg_kiem_tra_giuong_benh
ON giuong_benh
AFTER INSERT
AS
BEGIN
    IF EXISTS (
        SELECT i.ma_giuong
        FROM inserted i
        JOIN giuong_benh g ON i.ma_giuong = g.ma_giuong
        GROUP BY i.ma_giuong
        HAVING COUNT(g.ma_benh_nhan) > 2
    )
    BEGIN 
        RAISERROR(N'Không cho phép một giường có quá 2 bệnh nhân!', 16, 1);
        ROLLBACK TRANSACTION;
    END;
END;
-- TEST TRIGGER
INSERT INTO giuong_benh(ma_giuong, trang_thai, ma_phong, ma_benh_nhan)
VALUES ('G001', N'Đã có bệnh nhân', 'P001', 'BN003');
GO
--2. Trigger kiểm tra số lượng bác sĩ trong khoa
CREATE TRIGGER trg_kiem_tra_bac_si_khoa
ON bac_si
AFTER INSERT
AS
BEGIN
    IF EXISTS (
        SELECT i.ma_khoa
        FROM inserted i
        JOIN bac_si b ON i.ma_khoa = b.ma_khoa
        GROUP BY i.ma_khoa
        HAVING COUNT(b.ma_bac_si) > 3
    )
    BEGIN
        RAISERROR(N'Một khoa không được có quá 3 bác sĩ', 16, 1);
        ROLLBACK TRANSACTION;
    END;
END;
-- TEST TRIGGER
INSERT INTO bac_si(ma_bac_si, ten_bac_si, gioi_tinh, chuyen_mon, nam_sinh, cmnd, ma_khoa)
VALUES ('BS012', N'Nguyễn Văn K', 1, N'Nội khoa', '1990-01-01', '123456789012', 'KH01');
GO
--3. Viết trigger ràng buộc không cho phép xóa bác sĩ khoa Cấp cứu
CREATE TRIGGER trg_chan_xoa_bac_si_cap_cuu
ON bac_si
AFTER DELETE
AS
BEGIN
    IF EXISTS (
        SELECT * 
        FROM khoa k
        JOIN deleted d ON k.ma_khoa = d.ma_khoa
        WHERE k.ten_khoa = N'Cấp cứu'
    )
    BEGIN
        RAISERROR(N'Không cho phép xóa bác sĩ khoa cấp cứu', 16, 1);
        ROLLBACK TRANSACTION;
    END;
END;
-- TEST TRIGGER
DELETE FROM bac_si 
WHERE ma_bac_si = 'BS002'; 
GO
--4. Trigger cập nhật trạng thái giường khi xóa bệnh nhân
CREATE TRIGGER trg_cap_nhat_trang_thai_giuong
ON benh_nhan
AFTER DELETE
AS
BEGIN
    UPDATE giuong_benh
    SET trang_thai = N'Trống'
    WHERE ma_benh_nhan IN (
        SELECT ma_benh_nhan 
        FROM deleted
    );
END;
