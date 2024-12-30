CREATE DATABASE BTTH_HOMEWORK

-- Tạo bảng Chuyên gia
CREATE TABLE ChuyenGia (
    MaChuyenGia INT PRIMARY KEY,
    HoTen NVARCHAR(100),
    NgaySinh DATE,
    GioiTinh NVARCHAR(10),
    Email NVARCHAR(100),
    SoDienThoai NVARCHAR(20),
    ChuyenNganh NVARCHAR(50),
    NamKinhNghiem INT
);

-- Tạo bảng Công ty
CREATE TABLE CongTy (
    MaCongTy INT PRIMARY KEY,
    TenCongTy NVARCHAR(100),
    DiaChi NVARCHAR(200),
    LinhVuc NVARCHAR(50),
    SoNhanVien INT
);

-- Tạo bảng Dự án
CREATE TABLE DuAn (
    MaDuAn INT PRIMARY KEY,
    TenDuAn NVARCHAR(200),
    MaCongTy INT,
    NgayBatDau DATE,
    NgayKetThuc DATE,
    TrangThai NVARCHAR(50),
    FOREIGN KEY (MaCongTy) REFERENCES CongTy(MaCongTy)
);

-- Tạo bảng Kỹ năng
CREATE TABLE KyNang (
    MaKyNang INT PRIMARY KEY,
    TenKyNang NVARCHAR(100),
    LoaiKyNang NVARCHAR(50)
);

-- Tạo bảng Chuyên gia - Kỹ năng
CREATE TABLE ChuyenGia_KyNang (
    MaChuyenGia INT,
    MaKyNang INT,
    CapDo INT,
    PRIMARY KEY (MaChuyenGia, MaKyNang),
    FOREIGN KEY (MaChuyenGia) REFERENCES ChuyenGia(MaChuyenGia),
    FOREIGN KEY (MaKyNang) REFERENCES KyNang(MaKyNang)
);

-- Tạo bảng Chuyên gia - Dự án
CREATE TABLE ChuyenGia_DuAn (
    MaChuyenGia INT,
    MaDuAn INT,
    VaiTro NVARCHAR(50),
    NgayThamGia DATE,
    PRIMARY KEY (MaChuyenGia, MaDuAn),
    FOREIGN KEY (MaChuyenGia) REFERENCES ChuyenGia(MaChuyenGia),
    FOREIGN KEY (MaDuAn) REFERENCES DuAn(MaDuAn)
);

-- Chèn dữ liệu mẫu vào bảng Chuyên gia
INSERT INTO ChuyenGia (MaChuyenGia, HoTen, NgaySinh, GioiTinh, Email, SoDienThoai, ChuyenNganh, NamKinhNghiem)
VALUES 
(1, N'Nguyễn Văn An', '1985-05-10', N'Nam', 'nguyenvanan@email.com', '0901234567', N'Phát triển phần mềm', 10),
(2, N'Trần Thị Bình', '1990-08-15', N'Nữ', 'tranthiminh@email.com', '0912345678', N'An ninh mạng', 7),
(3, N'Lê Hoàng Cường', '1988-03-20', N'Nam', 'lehoangcuong@email.com', '0923456789', N'Trí tuệ nhân tạo', 9),
(4, N'Phạm Thị Dung', '1992-11-25', N'Nữ', 'phamthidung@email.com', '0934567890', N'Khoa học dữ liệu', 6),
(5, N'Hoàng Văn Em', '1987-07-30', N'Nam', 'hoangvanem@email.com', '0945678901', N'Điện toán đám mây', 8),
(6, N'Ngô Thị Phượng', '1993-02-14', N'Nữ', 'ngothiphuong@email.com', '0956789012', N'Phân tích dữ liệu', 5),
(7, N'Đặng Văn Giang', '1986-09-05', N'Nam', 'dangvangiang@email.com', '0967890123', N'IoT', 11),
(8, N'Vũ Thị Hương', '1991-12-20', N'Nữ', 'vuthihuong@email.com', '0978901234', N'UX/UI Design', 7),
(9, N'Bùi Văn Inh', '1989-04-15', N'Nam', 'buivaninch@email.com', '0989012345', N'DevOps', 8),
(10, N'Lý Thị Khánh', '1994-06-30', N'Nữ', 'lythikhanh@email.com', '0990123456', N'Blockchain', 4);

-- Chèn dữ liệu mẫu vào bảng Công ty
INSERT INTO CongTy (MaCongTy, TenCongTy, DiaChi, LinhVuc, SoNhanVien)
VALUES 
(1, N'TechViet Solutions', N'123 Đường Lê Lợi, TP.HCM', N'Phát triển phần mềm', 200),
(2, N'DataSmart Analytics', N'456 Đường Nguyễn Huệ, Hà Nội', N'Phân tích dữ liệu', 150),
(3, N'CloudNine Systems', N'789 Đường Trần Hưng Đạo, Đà Nẵng', N'Điện toán đám mây', 100),
(4, N'SecureNet Vietnam', N'101 Đường Võ Văn Tần, TP.HCM', N'An ninh mạng', 80),
(5, N'AI Innovate', N'202 Đường Lý Tự Trọng, Hà Nội', N'Trí tuệ nhân tạo', 120);

-- Chèn dữ liệu mẫu vào bảng Dự án
INSERT INTO DuAn (MaDuAn, TenDuAn, MaCongTy, NgayBatDau, NgayKetThuc, TrangThai)
VALUES 
(1, N'Phát triển ứng dụng di động cho ngân hàng', 1, '2023-01-01', '2023-06-30', N'Hoàn thành'),
(2, N'Xây dựng hệ thống phân tích dữ liệu khách hàng', 2, '2023-03-15', '2023-09-15', N'Đang thực hiện'),
(3, N'Triển khai giải pháp đám mây cho doanh nghiệp', 3, '2023-02-01', '2023-08-31', N'Đang thực hiện'),
(4, N'Nâng cấp hệ thống bảo mật cho tập đoàn viễn thông', 4, '2023-04-01', '2023-10-31', N'Đang thực hiện'),
(5, N'Phát triển chatbot AI cho dịch vụ khách hàng', 5, '2023-05-01', '2023-11-30', N'Đang thực hiện');

-- Chèn dữ liệu mẫu vào bảng Kỹ năng
INSERT INTO KyNang (MaKyNang, TenKyNang, LoaiKyNang)
VALUES 
(1, 'Java', N'Ngôn ngữ lập trình'),
(2, 'Python', N'Ngôn ngữ lập trình'),
(3, 'Machine Learning', N'Công nghệ'),
(4, 'AWS', N'Nền tảng đám mây'),
(5, 'Docker', N'Công cụ'),
(6, 'Kubernetes', N'Công cụ'),
(7, 'SQL', N'Cơ sở dữ liệu'),
(8, 'NoSQL', N'Cơ sở dữ liệu'),
(9, 'React', N'Framework'),
(10, 'Angular', N'Framework');

-- Chèn dữ liệu mẫu vào bảng Chuyên gia - Kỹ năng
INSERT INTO ChuyenGia_KyNang (MaChuyenGia, MaKyNang, CapDo)
VALUES 
(1, 1, 5), (1, 7, 4), (1, 9, 3),
(2, 2, 4), (2, 3, 3), (2, 8, 4),
(3, 2, 5), (3, 3, 5), (3, 4, 3),
(4, 2, 4), (4, 7, 5), (4, 8, 4),
(5, 4, 5), (5, 5, 4), (5, 6, 4),
(6, 2, 4), (6, 3, 3), (6, 7, 5),
(7, 1, 3), (7, 2, 4), (7, 5, 3),
(8, 9, 5), (8, 10, 4),
(9, 5, 5), (9, 6, 5), (9, 4, 4),
(10, 2, 3), (10, 3, 3), (10, 8, 4);

-- Chèn dữ liệu mẫu vào bảng Chuyên gia - Dự án
INSERT INTO ChuyenGia_DuAn (MaChuyenGia, MaDuAn, VaiTro, NgayThamGia)
VALUES 
(1, 1, N'Trưởng nhóm phát triển', '2023-01-01'),
(2, 4, N'Chuyên gia bảo mật', '2023-04-01'),
(3, 5, N'Kỹ sư AI', '2023-05-01'),
(4, 2, N'Chuyên gia phân tích dữ liệu', '2023-03-15'),
(5, 3, N'Kiến trúc sư đám mây', '2023-02-01'),
(6, 2, N'Chuyên gia phân tích dữ liệu', '2023-03-15'),
(7, 3, N'Kỹ sư IoT', '2023-02-01'),
(8, 1, N'Nhà thiết kế UX/UI', '2023-01-01'),
(9, 3, N'Kỹ sư DevOps', '2023-02-01'),
(10, 5, N'Kỹ sư Blockchain', '2023-05-01');

-- 51. Hiển thị tất cả thông tin của bảng ChuyenGia.

SELECT * FROM dbo.ChuyenGia 

-- 52. Liệt kê họ tên và email của tất cả chuyên gia.

SELECT HoTen, Email FROM dbo.ChuyenGia
 
-- 53. Hiển thị tên công ty và số nhân viên của tất cả các công ty.

SELECT TenCongTy, SoNhanVien FROM dbo.CongTy

-- 54. Liệt kê tên các dự án đang trong trạng thái 'Đang thực hiện'.

SELECT TenDuAn FROM dbo.DuAn 
WHERE TrangThai = N'Đang thực hiện'

-- 55. Hiển thị tên và loại của tất cả các kỹ năng.

SELECT TenKyNang, LoaiKyNang FROM dbo.KyNang

-- 56. Liệt kê họ tên và chuyên ngành của các chuyên gia nam.

SELECT HoTen, ChuyenNganh FROM dbo.ChuyenGia
WHERE GioiTinh = N'Nam'

-- 57. Hiển thị tên công ty và lĩnh vực của các công ty có trên 150 nhân viên.

SELECT TenCongTy, LinhVuc FROM dbo.CongTy
WHERE SoNhanVien > 150

-- 58. Liệt kê tên các dự án bắt đầu trong năm 2023.

SELECT TenDuAn FROM dbo.DuAn
WHERE YEAR(NgayBatDau) >= 2023

-- 59. Hiển thị tên kỹ năng thuộc loại 'Công cụ'.

SELECT TenKyNang FROM dbo.KyNang 
WHERE LoaiKyNang = N'Công cụ'

-- 60. Liệt kê họ tên và số năm kinh nghiệm của các chuyên gia có trên 5 năm kinh nghiệm.

SELECT HoTen, NamKinhNghiem FROM dbo.ChuyenGia
WHERE NamKinhNghiem > 5

-- 61. Hiển thị tên công ty và địa chỉ của các công ty trong lĩnh vực 'Phát triển phần mềm'.

SELECT TenCongTy, DiaChi FROM CongTy 
WHERE LinhVuc = N'Phát triển phần mềm'

-- 62. Liệt kê tên các dự án có ngày kết thúc trong năm 2023.
-- GETDATE() lấy ngày của hiện tại

SELECT TenDuAn FROM DuAn
WHERE YEAR(NgayKetThuc) = 2023

-- 63. Hiển thị tên và cấp độ của các kỹ năng trong bảng ChuyenGia_KyNang.

 SELECT K.TenKyNang, C.CapDo 
FROM ChuyenGia_KyNang AS C, KyNang AS K
WHERE C.MaKyNang = K.MaKyNang

-- 64. Liệt kê mã chuyên gia và vai trò trong các dự án từ bảng ChuyenGia_DuAn.

SELECT MaChuyenGia, VaiTro FROM ChuyenGia_DuAn 

-- 65. Hiển thị họ tên và ngày sinh của các chuyên gia sinh năm 1990 trở về sau.

SELECT HoTen, NgaySinh From ChuyenGia
WHERE YEAR(NgaySinh) >= 1990

-- 66. Liệt kê tên công ty và số nhân viên, sắp xếp theo số nhân viên giảm dần.

SELECT TenCongTy, SoNhanVien from CongTy
ORDER BY SoNhanVien DESC

-- 67. Hiển thị tên dự án và ngày bắt đầu, sắp xếp theo ngày bắt đầu tăng dần. 

SELECT TenDuAn, NgayBatDau from DuAn 
ORDER BY NgayBatDau ASC
 
-- 68. Liệt kê tên kỹ năng, chỉ hiển thị mỗi tên một lần (loại bỏ trùng lặp).

SELECT DISTINCT TenKyNang from KyNang

-- 69. Hiển thị họ tên và email của 5 chuyên gia đầu tiên trong danh sách.

SELECT TOP 5 HoTen, Email from ChuyenGia

-- 70. Liệt kê tên công ty có chứa từ 'Tech' trong tên.

SELECT TenCongTy from CongTy 
WHERE TenCongTy LIKE '%Tech%'

-- 71. Hiển thị tên dự án và trạng thái, không bao gồm các dự án đã hoàn thành.

SELECT TenDuAn, TrangThai from DuAn 
WHERE TrangThai != N'Hoàn thành'

-- 72. Liệt kê họ tên và chuyên ngành của các chuyên gia, sắp xếp theo chuyên ngành và họ tên.

SELECT HoTen, ChuyenNganh from ChuyenGia
ORDER BY ChuyenNganh ASC, HoTen ASC

-- 73. Hiển thị tên công ty và lĩnh vực, chỉ bao gồm các công ty có từ 100 đến 200 nhân viên.

SELECT TenCongTy, LinhVuc from CongTy
WHERE SoNhanVien >= 100 AND SoNhanVien <= 200

-- 74. Liệt kê tên kỹ năng và loại kỹ năng, sắp xếp theo loại kỹ năng giảm dần và tên kỹ năng tăng dần.

SELECT TenKyNang, LoaiKyNang from KyNang
ORDER BY LoaiKyNang DESC, TenKyNang ASC 

-- 75. Hiển thị họ tên và số điện thoại của các chuyên gia có email sử dụng tên miền 'email.com'.

SELECT HoTen, SoDienThoai FROM ChuyenGia
WHERE Email LIKE '%email.com%'




--1. Liệt kê tất cả các chuyên gia và sắp xếp theo họ tên.
SELECT MaChuyenGia, HoTen FROM ChuyenGia 
ORDER BY HoTen

--2. Hiển thị tên và số điện thoại của các chuyên gia có chuyên ngành 'Phát triển phần mềm'.
SELECT HoTen, SoDienThoai FROM ChuyenGia
WHERE ChuyenNganh = N'Phát triển phần mềm'

--3. Liệt kê tất cả các công ty có trên 100 nhân viên.
select MaCongTy, TenCongTy FROM CongTy
WHERE SoNhanVien > 100

--4. Hiển thị tên và ngày bắt đầu của các dự án bắt đầu trong năm 2023.
SELECT TenDuAn, NgayBatDau from DuAn
WHERE YEAR(NgayBatDau) = 2023

--5. Liệt kê tất cả các kỹ năng và sắp xếp theo tên kỹ năng.
SELECT MaKyNang, TenKyNang from KyNang
order by TenKyNang

--6. Hiển thị tên và email của các chuyên gia có tuổi dưới 35 (tính đến năm 2024).
select HoTen, Email from ChuyenGia
WHERE YEAR(GETDATE()) - YEAR(NgaySinh) < 35


--7. Hiển thị tên và chuyên ngành của các chuyên gia nữ.
Select HoTen, ChuyenNganh from ChuyenGia
WHERE GioiTinh = N'Nữ'

--8. Liệt kê tên các kỹ năng thuộc loại 'Công nghệ'.
SELECT TenKyNang FROM KyNang
WHERE TenKyNang = N'Công nghệ'

--9. Hiển thị tên và địa chỉ của các công ty trong lĩnh vực 'Phân tích dữ liệu'.
SELECT TenCongTy, DiaChi FROM CongTy
WHERE LinhVuc = N'Phân tích dữ liệu'

--10. Liệt kê tên các dự án có trạng thái 'Hoàn thành'.
SELECT TenDuAn FROM DuAn
WHERE TrangThai ='Hoàn thành'

--11. Hiển thị tên và số năm kinh nghiệm của các chuyên gia, sắp xếp theo số năm kinh nghiệm giảm dần.
SELECT HoTen, NamKinhNghiem FROM ChuyenGia
ORDER BY NamKinhNghiem DESC

--12. Liệt kê tên các công ty và số lượng nhân viên, chỉ hiển thị các công ty có từ 100 đến 200 nhân viên.
SELECT TenCongTy, SoNhanVien FROM CongTy
WHERE SoNhanVien >= 100 AND SoNhanVien <= 200

--13. Hiển thị tên dự án và ngày kết thúc của các dự án kết thúc trong năm 2023.
SELECT TenDuAn, NgayKetThuc FROM DuAn
WHERE YEAR(NgayKetThuc) = 2023

--14. Liệt kê tên và email của các chuyên gia có tên bắt đầu bằng chữ 'N'.
SELECT HoTen, Email FROM ChuyenGia
WHERE HoTen LIKE N'N%';

--15. Hiển thị tên kỹ năng và loại kỹ năng, không bao gồm các kỹ năng thuộc loại 'Ngôn ngữ lập trình'.
SELECT TenKyNang, LoaiKyNang FROM KyNang 
WHERE LoaiKyNang != N'Ngôn ngữ lập trình';

--16. Hiển thị tên công ty và lĩnh vực hoạt động, sắp xếp theo lĩnh vực.
SELECT TenCongTy, LinhVuc from CongTy
ORDER BY LinhVuc

--17. Hiển thị tên và chuyên ngành của các chuyên gia nam có trên 5 năm kinh nghiệm.
SELECT HoTen, ChuyenNganh from ChuyenGia
where GioiTinh = N'Nam' AND NamKinhNghiem > 5

--18. Liệt kê tất cả các chuyên gia trong cơ sở dữ liệu.
SELECT MaChuyenGia, HoTen FROM ChuyenGia

--19. Hiển thị tên và email của tất cả các chuyên gia nữ.
SELECT HoTen, Email from ChuyenGia
WHERE GioiTinh = N'Nữ'

--20.  Liệt kê tất cả các công ty và số nhân viên của họ, sắp xếp theo số nhân viên giảm dần.
SELECT MaCongTy, TenCongTy, SoNhanVien FROM CongTy
ORDER BY SoNhanVien DESC

--21. Hiển thị tất cả các dự án đang trong trạng thái "Đang thực hiện".
SELECT MaDuAn, TenDuAn FROM DuAn
WHERE TrangThai = N'Đang thực hiện'

--22. Liệt kê tất cả các kỹ năng thuộc loại "Ngôn ngữ lập trình".
Select MaKyNang, TenKyNang from KyNang
where LoaiKyNang = N'Ngôn ngữ lập trình'

--23. Hiển thị tên và chuyên ngành của các chuyên gia có trên 8 năm kinh nghiệm.
select HoTen, ChuyenNganh from ChuyenGia
WHERE NamKinhNghiem > 8

--24. Liệt kê tất cả các dự án của công ty có MaCongTy là 1.
SELECT MaCongTy, TenCongTy from CongTy
WHERE MaCongTy = '1'

--25. Đếm số lượng chuyên gia trong mỗi chuyên ngành.
SELECT ChuyenNganh, COUNT(MaChuyenGia) AS SOLUONGCHUYENGIA
from ChuyenGia
Group by ChuyenNganh

--26. Tìm chuyên gia có số năm kinh nghiệm cao nhất.
SELECT MaChuyenGia, HoTen FROM ChuyenGia
WHERE NamKinhNghiem = (SELECT MAX(NamKinhNghiem) FROM ChuyenGia)

--27. Liệt kê tổng số nhân viên cho mỗi công ty mà có số nhân viên lớn hơn 100. Sắp xếp kết quả theo số nhân viên tăng dần.
SELECT MaCongTy, TenCongTy, SoNhanVien from CongTy
WHERE SoNhanVien > 100
ORDER BY SoNhanVien DESC

--28. Xác định số lượng dự án mà mỗi công ty tham gia có trạng thái 'Đang thực hiện'. Chỉ bao gồm các công ty có hơn một dự án đang thực hiện. Sắp xếp kết quả theo số lượng dự án giảm dần.
SELECT CongTy.TenCongTy, COUNT(DuAn.MaDuAn) AS SoLuongDuAn
FROM CongTy
JOIN DuAn ON CongTy.MaCongTy = DuAn.MaCongTy
WHERE DuAn.TrangThai = N'Đang thực hiện' 
GROUP BY CongTy.TenCongTy
HAVING COUNT(DuAn.MaDuAn) > 1
ORDER BY SoLuongDuAn DESC;

--29. Tìm kiếm các kỹ năng mà chuyên gia có cấp độ từ 4 trở lên và tính tổng số chuyên gia cho mỗi kỹ năng đó. Chỉ bao gồm những kỹ năng có tổng số chuyên gia lớn hơn 2. Sắp xếp kết quả theo tên kỹ năng tăng dần.
select ChuyenGia_KyNang.MaKyNang, KyNang.TenKyNang, COUNT(MaChuyenGia) AS SOLUONGCG
from KyNang, ChuyenGia_KyNang
where KyNang.MaKyNang = ChuyenGia_KyNang.MaKyNang AND CapDo >= 4
Group By ChuyenGia_KyNang.MaKyNang, KyNang.TenKyNang
HAVING COUNT(MaChuyenGia) > 2
ORDER BY TenKyNang ASC

--30. Liệt kê tên các công ty có lĩnh vực 'Điện toán đám mây' và tính tổng số nhân viên của họ. Sắp xếp kết quả theo tổng số nhân viên tăng dần.
SELECT TenCongTy, SoNhanVien FROM CongTy 
WHERE LinhVuc = N'Điện toán đám mây'
ORDER BY SoNhanVien ASC 

--31. Liệt kê tên các công ty có số nhân viên từ 50 đến 150 và tính trung bình số nhân viên của họ. Sắp xếp kết quả theo tên công ty tăng dần.
SELECT TenCongTy, SoNhanVien
FROM CongTy
WHERE SoNhanVien BETWEEN 50 AND 150
ORDER BY TenCongTy ASC;

--32. Xác định số lượng kỹ năng cho mỗi chuyên gia có cấp độ tối đa là 5 và chỉ bao gồm những chuyên gia có ít nhất một kỹ năng đạt cấp độ tối đa này. Sắp xếp kết quả theo tên chuyên gia tăng dần.
SELECT MaChuyenGia, COUNT(MaKyNang) AS SOLUONGKYNANG
FROM ChuyenGia_KyNang
WHERE CapDo = 5
GROUP BY MaChuyenGia
HAVING COUNT(MaKyNang) > 0

--33. Liệt kê tên các kỹ năng mà chuyên gia có cấp độ từ 4 trở lên và tính tổng số chuyên gia cho mỗi kỹ năng đó. Chỉ bao gồm những kỹ năng có tổng số chuyên gia lớn hơn 2. Sắp xếp kết quả theo tên kỹ năng tăng dần.
SELECT KyNang.MaKyNang, KyNang.TenKyNang, COUNT(MaChuyenGia) AS SOLUONGCHUYENGIA_MOIKYNANG
FROM ChuyenGia_KyNang, KyNang
WHERE ChuyenGia_KyNang.CapDo >=4 AND ChuyenGia_KyNang.MaKyNang = KyNang.MaKyNang
GROUP BY KyNang.MaKyNang, KyNang.TenKyNang
HAVING COUNT(MaChuyenGia) > 2
ORDER BY KyNang.TenKyNang ASC 
 
--34. Tìm kiếm tên của các chuyên gia trong lĩnh vực 'Phát triển phần mềm' và tính trung bình cấp độ kỹ năng của họ. Chỉ bao gồm những chuyên gia có cấp độ trung bình lớn hơn 3. Sắp xếp kết quả theo cấp độ trung bình giảm dần.
SELECT HoTen, AVG(CapDo) AS TBCAPDO
FROM ChuyenGia, ChuyenGia_KyNang
WHERE ChuyenGia_KyNang.MaChuyenGia = ChuyenGia.MaChuyenGia AND ChuyenNganh = N'Phát triển phần mềm'
group by HoTen
HAVING AVG(CapDo) > 3
order by TBCAPDO desc



-- LAB 3

-- 8. Hiển thị tên và cấp độ của tất cả các kỹ năng của chuyên gia có MaChuyenGia là 1.
SELECT ChuyenGia_KyNang.MaChuyenGia, HoTen, ChuyenGia_KyNang.CapDo  FROM ChuyenGia, ChuyenGia_KyNang
WHERE ChuyenGia_KyNang.MaChuyenGia = '1' AND ChuyenGia_KyNang.MaChuyenGia = ChuyenGia.MaChuyenGia

-- 9. Liệt kê tên các chuyên gia tham gia dự án có MaDuAn là 2.
SELECT CG.HoTen FROM ChuyenGia_DuAn CGDA, ChuyenGia CG
WHERE CGDA.MaDuAn = 2 AND CGDA.MaChuyenGia = CG.MaChuyenGia

-- 10. Hiển thị tên công ty và tên dự án của tất cả các dự án.
SELECT TenCongTy, TenDuAn FROM CongTy, DuAn
WHERE CongTy.MaCongTy = DuAn.MaCongTy

-- 11. Đếm số lượng chuyên gia trong mỗi chuyên ngành.
SELECT ChuyenNganh, COUNT(MaChuyenGia) AS SoLuongChuyenGiaMoiChuyenNganh 
FROM ChuyenGia
Group By ChuyenNganh

-- 12. Tìm chuyên gia có số năm kinh nghiệm cao nhất.
SELECT HoTen, NamKinhNghiem 
from ChuyenGia
WHERE NamKinhNghiem = (SELECT MAX(NamKinhNghiem) FROM ChuyenGia)

-- 13. Liệt kê tên các chuyên gia và số lượng dự án họ tham gia.
SELECT ChuyenGia.HoTen, COUNT(MaDuAn) AS SOLUONGDUANTHAMGIA
FROM ChuyenGia_DuAn, ChuyenGia
WHERE ChuyenGia.MaChuyenGia = ChuyenGia_DuAn.MaChuyenGia
GROUP BY ChuyenGia.MaChuyenGia, ChuyenGia.HoTen

-- 14. Hiển thị tên công ty và số lượng dự án của mỗi công ty.
SELECT TenCongTy, COUNT(DuAn.MaDuAn) AS SOLUONGDA
FROM CongTy, DuAn
WHERE CongTy.MaCongTy = DuAn.MaCongTy
GROUP BY DuAn.MaCongTy, TenCongTy

-- 15. Tìm kỹ năng được sở hữu bởi nhiều chuyên gia nhất.
SELECT TOP 1 TenKyNang, COUNT(MaChuyenGia) AS SLCG
FROM ChuyenGia_KyNang, KyNang 
WHERE KyNang.MaKyNang = ChuyenGia_KyNang.MaKyNang
GROUP BY TenKyNang
ORDER BY SLCG DESC

-- 16. Liệt kê tên các chuyên gia có kỹ năng 'Python' với cấp độ từ 4 trở lên.
SELECT HoTen, TenKyNang FROM ChuyenGia, ChuyenGia_KyNang, KyNang
WHERE TenKyNang = 'Python' AND CapDo >= 4 AND ChuyenGia.MaChuyenGia = ChuyenGia_KyNang.MaChuyenGia AND KyNang.MaKyNang = ChuyenGia_KyNang.MaKyNang

-- 17. Tìm dự án có nhiều chuyên gia tham gia nhất.
SELECT TOP 1 DuAn.MaDuAn, TenDuAn, COUNT(ChuyenGia_DuAn.MaChuyenGia) AS SOLUONG
FROM DuAn, ChuyenGia_DuAn
WHERE DuAn.MaDuAn = ChuyenGia_DuAn.MaDuAn
GROUP BY DuAn.MaDuAn, TenDuAn
ORDER BY SOLUONG desc

-- 18. Hiển thị tên và số lượng kỹ năng của mỗi chuyên gia.
SELECT HoTen, COUNT(MaKyNang) AS SLKYNANG
FROM ChuyenGia, ChuyenGia_KyNang
WHERE ChuyenGia.MaChuyenGia = ChuyenGia_KyNang.MaChuyenGia
GROUP BY HoTen

-- 19. Tìm các cặp chuyên gia làm việc cùng dự án.
SELECT A.MaChuyenGia AS ChuyenGia1, B.MaChuyenGia AS ChuyenGia2, A.MaDuAn
FROM ChuyenGia_DuAn A, ChuyenGia_DuAn B 
WHERE A.MaDuAn = B.MaDuAn AND A.MaChuyenGia < B.MaChuyenGia
ORDER BY A.MaDuAn, A.MaChuyenGia, B.MaChuyenGia;

-- 20. Liệt kê tên các chuyên gia và số lượng kỹ năng cấp độ 5 của họ.
SELECT HoTen, COUNT(MaKyNang) AS SLKNCAP5
FROM ChuyenGia, ChuyenGia_KyNang
WHERE CapDo = 5 AND ChuyenGia.MaChuyenGia = ChuyenGia_KyNang.MaChuyenGia
GROUP BY HoTen

-- 21. Tìm các công ty không có dự án nào.
SELECT  CongTy.MaCongTy, CongTy.TenCongTy, COUNT(DuAn.MaDuAn) AS SOLUONGDA
FROM CongTy, DuAn
WHERE CongTy.MaCongTy = DuAn.MaCongTy
GROUP BY  CongTy.TenCongTy, CongTy.MaCongTy
HAVING COUNT(DuAn.MaDuAn) = 0 

-- 22. Hiển thị tên chuyên gia và tên dự án họ tham gia, bao gồm cả chuyên gia không tham gia dự án nào.
SELECT HoTen, TenDuAn, count(ChuyenGia_DuAn.MaDuAn)
FROM ChuyenGia
LEFT JOIN ChuyenGia_DuAn ON ChuyenGia.MaChuyenGia = ChuyenGia_DuAn.MaChuyenGia
LEFT JOIN DuAn ON ChuyenGia_DuAn.MaDuAn = DuAn.MaDuAn
GROUP BY HoTen, TenDuAn

-- 23. Tìm các chuyên gia có ít nhất 3 kỹ năng.
SELECT HoTen, COUNT(ChuyenGia_KyNang.MaKyNang)
FROM ChuyenGia,ChuyenGia_KyNang
WHERE ChuyenGia.MaChuyenGia = ChuyenGia_KyNang.MaChuyenGia
GROUP BY HoTen
HAVING COUNT (ChuyenGia_KyNang.MaKyNang) >= 3

-- 24. Hiển thị tên công ty và tổng số năm kinh nghiệm của tất cả chuyên gia trong các dự án của công ty đó.
select TenCongTy, SUM(NamKinhNghiem)
FROM CongTy, ChuyenGia, DuAn, ChuyenGia_DuAn
WHERE CongTy.MaCongTy = DuAn.MaCongTy and ChuyenGia.MaChuyenGia = ChuyenGia_DuAn.MaChuyenGia and DuAn.MaDuAn = ChuyenGia_DuAn.MaDuAn
Group By TenCongTy

-- 25. Tìm các chuyên gia có kỹ năng 'Java' nhưng không có kỹ năng 'Python'.
SELECT ChuyenGia.MaChuyenGia, ChuyenGia.HoTen
FROM ChuyenGia, ChuyenGia_KyNang, KyNang
where ChuyenGia.MaChuyenGia = ChuyenGia_KyNang.MaChuyenGia AND KyNang.MaKyNang = ChuyenGia_KyNang.MaKyNang AND TenKyNang = 'Java'
AND ChuyenGia.MaChuyenGia NOT IN (Select ChuyenGia.MaChuyenGia
FROM ChuyenGia, ChuyenGia_KyNang, KyNang
where ChuyenGia.MaChuyenGia = ChuyenGia_KyNang.MaChuyenGia AND KyNang.MaKyNang = ChuyenGia_KyNang.MaKyNang AND TenKyNang = 'Python')

-- 76. Tìm chuyên gia có số lượng kỹ năng nhiều nhất.
SELECT TOP 1 ChuyenGia.MaChuyenGia, ChuyenGia.HoTen, COUNT(ChuyenGia_KyNang.MaKyNang) AS SLKN
FROM ChuyenGia, ChuyenGia_KyNang
WHERE ChuyenGia.MaChuyenGia = ChuyenGia_KyNang.MaChuyenGia
GROUP BY ChuyenGia.MaChuyenGia, ChuyenGia.HoTen

-- 77. Liệt kê các cặp chuyên gia có cùng chuyên ngành.
SELECT A.HoTen, B.HoTen, A.ChuyenNganh
FROM ChuyenGia AS A, ChuyenGia AS B
WHERE A.ChuyenNganh = B.ChuyenNganh AND A.MaChuyenGia < B.MaChuyenGia

-- 78. Tìm công ty có tổng số năm kinh nghiệm của các chuyên gia trong dự án cao nhất.
SELECT TOP 1 TenCongTy, SUM(NamKinhNghiem)
FROM CongTy, ChuyenGia, ChuyenGia_DuAn, DuAn
WHERE CongTy.MaCongTy = DuAn.MaCongTy AND ChuyenGia.MaChuyenGia = ChuyenGia_DuAn.MaChuyenGia AND DuAn.MaDuAn = ChuyenGia_DuAn.MaDuAn
GROUP BY TenCongTy
ORDER BY SUM(NamKinhNghiem) DESC

-- 79. Tìm kỹ năng được sở hữu bởi tất cả các chuyên gia.
SELECT TenKyNang
FROM KyNang
WHERE MaKyNang IN (
    SELECT MaKyNang
    FROM ChuyenGia_KyNang
    GROUP BY MaKyNang
    HAVING COUNT(DISTINCT MaChuyenGia) = (SELECT COUNT(*) FROM ChuyenGia)
)

-- LAB 4

-- 76. Liệt kê top 3 chuyên gia có nhiều kỹ năng nhất và số lượng kỹ năng của họ.
SELECT TOP 3 ChuyenGia.MaChuyenGia, HoTen, COUNT(MaKyNang) AS SLKN
FROM ChuyenGia
JOIN ChuyenGia_KyNang ON ChuyenGia.MaChuyenGia = ChuyenGia_KyNang.MaChuyenGia
GROUP BY ChuyenGia.MaChuyenGia, HoTen
ORDER BY SLKN ASC

-- 77. Tìm các cặp chuyên gia có cùng chuyên ngành và số năm kinh nghiệm chênh lệch không quá 2 năm.


-- 78. Hiển thị tên công ty, số lượng dự án và tổng số năm kinh nghiệm của các chuyên gia tham gia dự án của công ty đó.
SELECT TenCongTy, COUNT(DuAn.MaDuAn) AS SLDA, SUM(NamKinhNghiem) AS TONGNKN
FROM CongTy
JOIN DuAn ON DuAn.MaCongTy = CongTy.MaCongTy
JOIN ChuyenGia_DuAn ON ChuyenGia_DuAn.MaDuAN = DuAn.MaDuAn
JOIN ChuyenGia ON ChuyenGia.MaChuyenGia = ChuyenGia_DuAn.MaChuyenGia
GROUP BY TenCongTy

-- 79. Tìm các chuyên gia có ít nhất một kỹ năng cấp độ 5 nhưng không có kỹ năng nào dưới cấp độ 3.
SELECT ChuyenGia.MaChuyenGia, HoTen
FROM ChuyenGia
JOIN ChuyenGia_KyNang AS CGKN ON CGKN.MaChuyenGia = ChuyenGia.MaChuyenGia
GROUP BY ChuyenGia.MaChuyenGia, HoTen
HAVING MAX(CapDo) = 5 AND MIN (CapDo) >= 3

-- 80. Liệt kê các chuyên gia và số lượng dự án họ tham gia, bao gồm cả những chuyên gia không tham gia dự án nào.
SELECT CG.MaChuyenGia, HoTen, COUNT(MaDuAn) AS SLDA
FROM ChuyenGia AS CG
LEFT JOIN ChuyenGia_DuAn AS CGDA ON CG.MaChuyenGia = CGDA.MaChuyenGia
GROUP BY CG.MaChuyenGia, HoTen

-- Câu hỏi và ví dụ về Triggers (101-110)


-- 101. Tạo một trigger để tự động cập nhật trường NgayCapNhat trong bảng ChuyenGia mỗi khi có sự thay đổi thông tin.

ALTER TABLE ChuyenGia
ADD NgayCapNhat SMALLDATETIME NULL
GO

CREATE TRIGGER trg_Update_NgayCapNhat
ON ChuyenGia
AFTER UPDATE
AS
BEGIN
    UPDATE ChuyenGia
    SET NgayCapNhat = GETDATE()
    FROM ChuyenGia
    INNER JOIN Inserted ON ChuyenGia.MaChuyenGia = Inserted.MaChuyenGia;
END;
GO
-- 102. Tạo một trigger để ghi log mỗi khi có sự thay đổi trong bảng DuAn.

CREATE TRIGGER trg_DuAn_Log
ON DuAn
AFTER INSERT, UPDATE, DELETE
AS
BEGIN
    SET NOCOUNT ON;

    -- Log cho thao tác INSERT
    IF EXISTS (SELECT * FROM inserted) AND NOT EXISTS (SELECT * FROM deleted)
    BEGIN
        INSERT INTO DuAn_Log (MaDuAn, TenDuAn, MaCongTy, NgayBatDau, NgayKetThuc, TrangThai, ThaoTac)
        SELECT MaDuAn, TenDuAn, MaCongTy, NgayBatDau, NgayKetThuc, TrangThai, 'INSERT'
        FROM inserted;
    END

    -- Log cho thao tác DELETE
    IF EXISTS (SELECT * FROM deleted) AND NOT EXISTS (SELECT * FROM inserted)
    BEGIN
        INSERT INTO DuAn_Log (MaDuAn, TenDuAn, MaCongTy, NgayBatDau, NgayKetThuc, TrangThai, ThaoTac)
        SELECT MaDuAn, TenDuAn, MaCongTy, NgayBatDau, NgayKetThuc, TrangThai, 'DELETE'
        FROM deleted;
    END

    -- Log cho thao tác UPDATE
    IF EXISTS (SELECT * FROM inserted) AND EXISTS (SELECT * FROM deleted)
    BEGIN
        INSERT INTO DuAn_Log (MaDuAn, TenDuAn, MaCongTy, NgayBatDau, NgayKetThuc, TrangThai, ThaoTac)
        SELECT MaDuAn, TenDuAn, MaCongTy, NgayBatDau, NgayKetThuc, TrangThai, 'UPDATE'
        FROM inserted;
    END
END;

-- 103. Tạo một trigger để đảm bảo rằng một chuyên gia không thể tham gia vào quá 5 dự án cùng một lúc.
CREATE TRIGGER trg_LimitProjectsPerExpert
ON ChuyenGia_DuAn
AFTER INSERT, UPDATE
AS
BEGIN
    SET NOCOUNT ON;

    -- Kiểm tra số lượng dự án của mỗi chuyên gia trong bảng inserted
    IF EXISTS (
        SELECT i.MaChuyenGia
        FROM inserted i
        GROUP BY i.MaChuyenGia
        HAVING (SELECT COUNT(*) 
                FROM ChuyenGia_DuAn 
                WHERE MaChuyenGia = i.MaChuyenGia) > 5
    )
    BEGIN
        -- Nếu chuyên gia vượt quá 5 dự án, rollback và báo lỗi
        RAISERROR (N'Một chuyên gia không thể tham gia vào hơn 5 dự án cùng một lúc.', 16, 1);
        ROLLBACK TRANSACTION;
    END
END;
   
-- 104. Tạo một trigger để tự động cập nhật số lượng nhân viên trong bảng CongTy mỗi khi có sự thay đổi trong bảng ChuyenGia.

CREATE TRIGGER trg_UpdateEmployeeCount
ON ChuyenGia
AFTER INSERT, DELETE, UPDATE
AS
BEGIN
    SET NOCOUNT ON;

    -- Cập nhật số lượng nhân viên cho các công ty liên quan khi có dữ liệu được thêm mới
    IF EXISTS (SELECT * FROM inserted)
    BEGIN
        UPDATE CongTy
        SET SoNhanVien = (
            SELECT COUNT(*)
            FROM ChuyenGia
            WHERE MaCongTy = inserted.MaCongTy
        )
        WHERE MaCongTy IN (SELECT DISTINCT MaCongTy FROM inserted);
    END

    -- Cập nhật số lượng nhân viên cho các công ty liên quan khi có dữ liệu bị xóa
    IF EXISTS (SELECT * FROM deleted)
    BEGIN
        UPDATE CongTy
        SET SoNhanVien = (
            SELECT COUNT(*)
            FROM ChuyenGia
            WHERE MaCongTy = deleted.MaCongTy
        )
        WHERE MaCongTy IN (SELECT DISTINCT MaCongTy FROM deleted);
    END
END;

-- 105. Tạo một trigger để ngăn chặn việc xóa các dự án đã hoàn thành.
CREATE TRIGGER trg_prevent_delete_completed_projects
BEFORE DELETE ON DuAn
FOR EACH ROW
BEGIN
    IF OLD.TrangThai = 'Hoàn thành' THEN
        SIGNAL SQLSTATE '45000' SET MESSAGE_TEXT = 'Không thể xóa dự án đã hoàn thành.';
    END IF;
END;

-- 106. Tạo một trigger để tự động cập nhật cấp độ kỹ năng của chuyên gia khi họ tham gia vào một dự án mới.
CREATE TRIGGER trg_update_expert_skill_level
AFTER INSERT ON ChuyenGia_DuAn
FOR EACH ROW
BEGIN
    UPDATE ChuyenGia_KyNang
    SET CapDo = (SELECT MAX(CapDo) FROM DuAn WHERE MaDuAn = NEW.MaDuAn)
    WHERE MaChuyenGia = NEW.MaChuyenGia;
END;

-- 107. Tạo một trigger để ghi log mỗi khi có sự thay đổi cấp độ kỹ năng của chuyên gia.
CREATE TRIGGER trg_log_skill_level_changes
AFTER UPDATE ON ChuyenGia_KyNang
FOR EACH ROW
BEGIN
    INSERT INTO LogChanges (TableName, ActionType, DateTime, Description)
    VALUES ('ChuyenGia_KyNang', 'UPDATE', NOW(), 
            CONCAT('Cấp độ kỹ năng của chuyên gia ', OLD.MaChuyenGia, ' đã thay đổi từ ', OLD.CapDo, ' thành ', NEW.CapDo));
END;

-- 108. Tạo một trigger để đảm bảo rằng ngày kết thúc của dự án luôn lớn hơn ngày bắt đầu.
CREATE TRIGGER trg_validate_project_dates
BEFORE INSERT, UPDATE ON DuAn
FOR EACH ROW
BEGIN
    IF NEW.NgayKetThuc <= NEW.NgayBatDau THEN
        SIGNAL SQLSTATE '45000' SET MESSAGE_TEXT = 'Ngày kết thúc phải lớn hơn ngày bắt đầu.';
    END IF;
END;

-- 109. Tạo một trigger để tự động xóa các bản ghi liên quan trong bảng ChuyenGia_KyNang khi một kỹ năng bị xóa.
CREATE TRIGGER trg_delete_related_skill_entries
AFTER DELETE ON KyNang
FOR EACH ROW
BEGIN
    DELETE FROM ChuyenGia_KyNang WHERE MaKyNang = OLD.MaKyNang;
END;

-- 110. Tạo một trigger để đảm bảo rằng một công ty không thể có quá 10 dự án đang thực hiện cùng một lúc.
CREATE TRIGGER trg_limit_company_projects
BEFORE INSERT ON DuAn
FOR EACH ROW
BEGIN
    DECLARE project_count INT;
    SELECT COUNT(*) INTO project_count
    FROM DuAn
    WHERE MaCongTy = NEW.MaCongTy AND TrangThai = 'Đang thực hiện';
    
    IF project_count >= 10 THEN
        SIGNAL SQLSTATE '45000' SET MESSAGE_TEXT = 'Công ty không thể có quá 10 dự án đang thực hiện cùng lúc.';
    END IF;
END;

-- 123. Tạo một trigger để tự động cập nhật lương của chuyên gia dựa trên cấp độ kỹ năng và số năm kinh nghiệm.
CREATE TRIGGER trg_update_expert_salary
AFTER INSERT ON ChuyenGia_KyNang
FOR EACH ROW
BEGIN
    UPDATE ChuyenGia
    SET Luong = (SELECT Luong FROM LuongChuyenGia WHERE CapDo = NEW.CapDo AND NamKinhNghiem = NEW.NamKinhNghiem)
    WHERE MaChuyenGia = NEW.MaChuyenGia;
END;

-- 124. Tạo một trigger để tự động gửi thông báo khi một dự án sắp đến hạn (còn 7 ngày).
CREATE TABLE ThongBao (
    MaThongBao INT AUTO_INCREMENT PRIMARY KEY,
    NoiDung TEXT,
    NgayThongBao DATETIME
);

CREATE TRIGGER trg_notify_project_deadline
AFTER UPDATE ON DuAn
FOR EACH ROW
BEGIN
    IF DATEDIFF(NEW.NgayKetThuc, NOW()) = 7 THEN
        INSERT INTO ThongBao (NoiDung, NgayThongBao)
        VALUES (CONCAT('Dự án ', NEW.TenDuAn, ' sắp đến hạn vào ', NEW.NgayKetThuc), NOW());
    END IF;
END;

-- 125. Tạo một trigger để ngăn chặn việc xóa hoặc cập nhật thông tin của chuyên gia đang tham gia dự án.
CREATE TRIGGER trg_prevent_expert_modification
BEFORE UPDATE, DELETE ON ChuyenGia
FOR EACH ROW
BEGIN
    IF EXISTS (SELECT * FROM ChuyenGia_DuAn WHERE MaChuyenGia = OLD.MaChuyenGia) THEN
        SIGNAL SQLSTATE '45000' SET MESSAGE_TEXT = 'Không thể xóa hoặc cập nhật thông tin của chuyên gia đang tham gia dự án.';
    END IF;
END;

-- 126. Tạo một trigger để tự động cập nhật số lượng chuyên gia trong mỗi chuyên ngành.
CREATE TABLE ThongKeChuyenNganh (
    MaChuyenNganh INT,
    SoLuongChuyenGia INT,
    PRIMARY KEY (MaChuyenNganh)
);

CREATE TRIGGER trg_update_expert_count
AFTER INSERT, DELETE ON ChuyenGia
FOR EACH ROW
BEGIN
    UPDATE ThongKeChuyenNganh
    SET SoLuongChuyenGia = (SELECT COUNT(*) FROM ChuyenGia WHERE ChuyenNganh = NEW.ChuyenNganh)
    WHERE MaChuyenNganh = NEW.MaChuyenNganh;
END;

-- 127. Tạo một trigger để tự động tạo bản sao lưu của dự án khi nó được đánh dấu là hoàn thành.
CREATE TABLE DuAnHoanThanh (
    MaDuAn INT,
    TenDuAn NVARCHAR(255),
    NgayBatDau DATE,
    NgayKetThuc DATE,
    PRIMARY KEY (MaDuAn)
);

CREATE TRIGGER trg_backup_completed_projects
AFTER UPDATE ON DuAn
FOR EACH ROW
BEGIN
    IF NEW.TrangThai = 'Hoàn thành' THEN
        INSERT INTO DuAnHoanThanh (MaDuAn, TenDuAn, NgayBatDau, NgayKetThuc)
        VALUES (NEW.MaDuAn, NEW.TenDuAn, NEW.NgayBatDau, NEW.NgayKetThuc);
    END IF;
END;

-- 128. Tạo một trigger để tự động cập nhật điểm đánh giá trung bình của công ty dựa trên điểm đánh giá của các dự án.
CREATE TRIGGER trg_update_company_rating
AFTER UPDATE ON DuAn
FOR EACH ROW
BEGIN
    UPDATE CongTy
    SET DiemDanhGia = (SELECT AVG(DiemDanhGia) FROM DuAn WHERE MaCongTy = NEW.MaCongTy)
    WHERE MaCongTy = NEW.MaCongTy;
END;

-- 129. Tạo một trigger để tự động phân công chuyên gia vào dự án dựa trên kỹ năng và kinh nghiệm.
CREATE TRIGGER trg_assign_expert_to_project
AFTER INSERT ON DuAn
FOR EACH ROW
BEGIN
    INSERT INTO ChuyenGia_DuAn (MaDuAn, MaChuyenGia)
    SELECT NEW.MaDuAn, MaChuyenGia FROM ChuyenGia_KyNang
    WHERE MaKyNang IN (SELECT MaKyNang FROM DuAn WHERE MaDuAn = NEW.MaDuAn)
    AND NamKinhNghiem >= NEW.YeuCauKinhNghiem;
END;

-- 130. Tạo một trigger để tự động cập nhật trạng thái "bận" của chuyên gia khi họ được phân công vào dự án mới.
CREATE TRIGGER trg_update_expert_status
AFTER INSERT ON ChuyenGia_DuAn
FOR EACH ROW
BEGIN
    UPDATE ChuyenGia
    SET TrangThai = 'Bận'
    WHERE MaChuyenGia = NEW.MaChuyenGia;
END;

-- 131. Tạo một trigger để ngăn chặn việc thêm kỹ năng trùng lặp cho một chuyên gia.
CREATE TRIGGER trg_prevent_duplicate_skill
BEFORE INSERT ON ChuyenGia_KyNang
FOR EACH ROW
BEGIN
    IF EXISTS (SELECT * FROM ChuyenGia_KyNang WHERE MaChuyenGia = NEW.MaChuyenGia AND MaKyNang = NEW.MaKyNang) THEN
        SIGNAL SQLSTATE '45000' SET MESSAGE_TEXT = 'Kỹ năng này đã được thêm cho chuyên gia này.';
    END IF;
END;

-- 132. Tạo một trigger để tự động tạo báo cáo tổng kết khi một dự án kết thúc.
CREATE TRIGGER trg_generate_project_report
AFTER UPDATE ON DuAn
FOR EACH ROW
BEGIN
    IF NEW.TrangThai = 'Hoàn thành' THEN
        INSERT INTO BaoCaoDuAn (MaDuAn, NoiDungBaoCao)
        VALUES (NEW.MaDuAn, CONCAT('Dự án ', NEW.TenDuAn, ' đã hoàn thành vào ', NEW.NgayKetThuc));
    END IF;
END;

-- 133. Tạo một trigger để tự động cập nhật thứ hạng của công ty dựa trên số lượng dự án hoàn thành và điểm đánh giá.
CREATE TRIGGER trg_update_company_ranking
AFTER UPDATE ON DuAn
FOR EACH ROW
BEGIN
    UPDATE CongTy
    SET XepHang = (SELECT COUNT(*) FROM DuAn WHERE MaCongTy = NEW.MaCongTy AND TrangThai = 'Hoàn thành') +
                 (SELECT AVG(DiemDanhGia) FROM DuAn WHERE MaCongTy = NEW.MaCongTy)
    WHERE MaCongTy = NEW.MaCongTy;
END;

-- 134. Tạo một trigger để tự động gửi thông báo khi một chuyên gia được thăng cấp (dựa trên số năm kinh nghiệm).
CREATE TRIGGER trg_notify_expert_promotion
AFTER UPDATE ON ChuyenGia
FOR EACH ROW
BEGIN
    IF OLD.NamKinhNghiem < NEW.NamKinhNghiem THEN
        INSERT INTO ThongBao (NoiDung, NgayThongBao)
        VALUES (CONCAT('Chuyên gia ', NEW.HoTen, ' đã được thăng cấp với ', NEW.NamKinhNghiem, ' năm kinh nghiệm'), NOW());
    END IF;
END;

-- 135. Tạo một trigger để tự động cập nhật trạng thái "khẩn cấp" cho dự án khi thời gian còn lại ít hơn 10% tổng thời gian dự án.
CREATE TRIGGER trg_update_project_urgent
AFTER UPDATE ON DuAn
FOR EACH ROW
BEGIN
    IF DATEDIFF(NEW.NgayKetThuc, NOW()) < (0.1 * DATEDIFF(NEW.NgayKetThuc, NEW.NgayBatDau)) THEN
        UPDATE DuAn SET TrangThai = 'Khẩn cấp' WHERE MaDuAn = NEW.MaDuAn;
    END IF;
END;

-- 136. Tạo một trigger để tự động cập nhật số lượng dự án đang thực hiện của mỗi chuyên gia.
CREATE TRIGGER trg_update_expert_project_count
AFTER INSERT, DELETE ON ChuyenGia_DuAn
FOR EACH ROW
BEGIN
    DECLARE project_count INT;
    SELECT COUNT(*) INTO project_count
    FROM ChuyenGia_DuAn
    WHERE MaChuyenGia = NEW.MaChuyenGia AND TrangThai = 'Đang thực hiện';
    
    UPDATE ChuyenGia
    SET SoDuAnDangThucHien = project_count
    WHERE MaChuyenGia = NEW.MaChuyenGia;
END;

-- 137. Tạo một trigger để tự động tính toán và cập nhật tỷ lệ thành công của công ty dựa trên số dự án hoàn thành và tổng số dự án.
CREATE TRIGGER trg_update_company_success_rate
AFTER UPDATE ON DuAn
FOR EACH ROW
BEGIN
    DECLARE completed_projects INT;
    DECLARE total_projects INT;
    SELECT COUNT(*) INTO completed_projects FROM DuAn WHERE MaCongTy = NEW.MaCongTy AND TrangThai = 'Hoàn thành';
    SELECT COUNT(*) INTO total_projects FROM DuAn WHERE MaCongTy = NEW.MaCongTy;
    
    UPDATE CongTy
    SET TyLeThanhCong = completed_projects / total_projects * 100
    WHERE MaCongTy = NEW.MaCongTy;
END;

-- 138. Tạo một trigger để tự động ghi log mỗi khi có thay đổi trong bảng lương của chuyên gia.
CREATE TRIGGER trg_log_salary_changes
AFTER UPDATE ON ChuyenGia
FOR EACH ROW
BEGIN
    INSERT INTO LogChanges (TableName, ActionType, DateTime, Description)
    VALUES ('ChuyenGia', 'UPDATE', NOW(), 
            CONCAT('Lương của chuyên gia ', OLD.MaChuyenGia, ' đã thay đổi từ ', OLD.Luong, ' thành ', NEW.Luong));
END;

-- 139. Tạo một trigger để tự động cập nhật số lượng chuyên gia cấp cao trong mỗi công ty.
CREATE TRIGGER trg_update_high_level_experts
AFTER INSERT, DELETE ON ChuyenGia
FOR EACH ROW
BEGIN
    DECLARE high_level_count INT;
    SELECT COUNT(*) INTO high_level_count
    FROM ChuyenGia
    WHERE MaCongTy = NEW.MaCongTy AND CapDo = 'Cao';
    
    UPDATE CongTy
    SET SoChuyenGiaCapCao = high_level_count
    WHERE MaCongTy = NEW.MaCongTy;
END;

-- 140. Tạo một trigger để tự động phân công chuyên gia vào dự án khi có dự án mới được tạo.
CREATE TRIGGER trg_auto_assign_expert_to_new_project
ON DuAn
AFTER INSERT
AS
BEGIN
    DECLARE @MaDuAn INT;

    -- Lấy giá trị MaDuAn từ bảng inserted
    SELECT @MaDuAn = MaDuAn FROM inserted;

    -- Thực hiện phân công chuyên gia vào dự án
    INSERT INTO ChuyenGia_DuAn (MaDuAn, MaChuyenGia)
    SELECT @MaDuAn, MaChuyenGia
    FROM ChuyenGia_KyNang
    WHERE NamKinhNghiem >= (SELECT YeuCauKinhNghiem FROM DuAn WHERE MaDuAn = @MaDuAn);
END;