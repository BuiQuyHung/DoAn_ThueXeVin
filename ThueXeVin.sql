CREATE DATABASE ThueXeVin
USE ThueXeVin
GO	

-- Bảng Khách hàng
CREATE TABLE KhachHang (
    MaKhachHang INT PRIMARY KEY IDENTITY(1,1),
    HoTen NVARCHAR(100) NOT NULL,
    CCCD NVARCHAR(50) NOT NULL,
    DiaChi NVARCHAR(255),
    SoDienThoai NVARCHAR(15),
    Email NVARCHAR(100),
    GiayPhepLaiXe NVARCHAR(50) NOT NULL
);

-- Bảng Nhân viên
CREATE TABLE NhanVien (
    MaNhanVien INT PRIMARY KEY IDENTITY(1,1),
    HoTen NVARCHAR(100) NOT NULL,
    SoDienThoai NVARCHAR(15),
    Email NVARCHAR(100),
    ChucVu NVARCHAR(50)
);

-- Bảng Chi tiết xe
CREATE TABLE ChiTietXe (
    MaChiTietXe INT PRIMARY KEY IDENTITY(1,1),
    Model NVARCHAR(50) NOT NULL,
    DongCo NVARCHAR(50) NOT NULL,
    CongSuat INT,
    PhamViHoatDong INT,
    SoChoNgoi INT,
    MauSac NVARCHAR(50)
);

-- Bảng Xe
CREATE TABLE Xe (
    MaXe INT PRIMARY KEY IDENTITY(1,1),
    BienSo NVARCHAR(50) NOT NULL,
    MaChiTietXe INT,
    TrangThaiXe NVARCHAR(50) NOT NULL,
    MaBaoHiem INT,
    FOREIGN KEY (MaChiTietXe) REFERENCES ChiTietXe(MaChiTietXe),
    FOREIGN KEY (MaBaoHiem) REFERENCES BaoHiem(MaBaoHiem)
);

-- Bảng Ảnh xe
CREATE TABLE AnhXe (
    AnhID INT PRIMARY KEY IDENTITY(1,1),
    MaXe INT NOT NULL, 
    DuongDanAnh NVARCHAR(255) NOT NULL, 
    MoTa NVARCHAR(255),  
    CONSTRAINT FK_AnhXe_Xe FOREIGN KEY (MaXe) REFERENCES Xe(MaXe)  
);

-- Bảng Bảo hiểm
CREATE TABLE BaoHiem (
    MaBaoHiem INT PRIMARY KEY IDENTITY(1,1),
    LoaiBaoHiem NVARCHAR(50) NOT NULL,
    NhaCungCap NVARCHAR(100),
    ThoiHan DATE NOT NULL
);

-- Bảng Hợp đồng thuê
CREATE TABLE HopDongThue (
    MaHopDong INT PRIMARY KEY IDENTITY(1,1),
    MaKhachHang INT,
    MaXe INT,
    NgayThue DATE,
    NgayTra DATE,
    FOREIGN KEY (MaKhachHang) REFERENCES KhachHang(MaKhachHang),
    FOREIGN KEY (MaXe) REFERENCES Xe(MaXe)
);

-- Bảng Thanh toán
CREATE TABLE ThanhToan (
    MaThanhToan INT PRIMARY KEY IDENTITY(1,1),
    MaHopDong INT,
    NgayThanhToan DATE,
    SoTien DECIMAL(18, 2),
    PhuongThucThanhToan NVARCHAR(50),
    FOREIGN KEY (MaHopDong) REFERENCES HopDongThue(MaHopDong)
);

-- Bảng Chi phí phát sinh
CREATE TABLE ChiPhiPhatSinh (
    MaChiPhi INT PRIMARY KEY IDENTITY(1,1),
    MaHopDong INT,
    LoaiChiPhi NVARCHAR(50),
    SoTien DECIMAL(18, 2),
    FOREIGN KEY (MaHopDong) REFERENCES HopDongThue(MaHopDong)
);

-- Bảng Bảo dưỡng
CREATE TABLE BaoDuong (
    MaBaoDuong INT PRIMARY KEY IDENTITY(1,1),
    MaXe INT,
    NgayBaoDuong DATE,
    ChiPhi DECIMAL(18, 2),
    MoTa NVARCHAR(255),
    FOREIGN KEY (MaXe) REFERENCES Xe(MaXe)
);

-- Bảng Đánh giá khách hàng
CREATE TABLE DanhGiaKhachHang (
    MaDanhGia INT PRIMARY KEY IDENTITY(1,1),
    MaKhachHang INT,
    Diem INT,
    NhanXet NVARCHAR(255),
    FOREIGN KEY (MaKhachHang) REFERENCES KhachHang(MaKhachHang)
);

-- Bảng Khuyến mãi
CREATE TABLE KhuyenMai (
    MaKhuyenMai INT PRIMARY KEY IDENTITY(1,1),
    TenKhuyenMai NVARCHAR(100),
    MoTa NVARCHAR(255),
    NgayBatDau DATE,
    NgayKetThuc DATE,
    GiaTri DECIMAL(18, 2)
);

-- Bảng xử lý sự cố
CREATE TABLE XuLySuCo (
    MaSuCo INT PRIMARY KEY IDENTITY(1,1),
    MaXe INT NOT NULL,   
    NgaySuCo DATE NOT NULL,  
    MoTa NVARCHAR(255) NOT NULL,  
    TinhTrang NVARCHAR(50) CHECK (TinhTrang IN (N'Chưa xử lý', N'Đang xử lý', N'Đã xử lý')) NOT NULL,  
    MaNhanVien INT NOT NULL,  
    GhiChu NVARCHAR(255),  
    CONSTRAINT FK_XuLySuCo_Xe FOREIGN KEY (MaXe) REFERENCES Xe(MaXe), 
    CONSTRAINT FK_XuLySuCo_NhanVien FOREIGN KEY (MaNhanVien) REFERENCES NhanVien(MaNhanVien)  
);

-- Bảng User đăng nhập
CREATE TABLE [User] (
    UserID INT PRIMARY KEY IDENTITY(1,1),
    Username NVARCHAR(50) UNIQUE NOT NULL,
    PasswordHash NVARCHAR(255) NOT NULL,
    HoTen NVARCHAR(100),
    Email NVARCHAR(100),
    SoDienThoai NVARCHAR(15),
    VaiTro NVARCHAR(20) CHECK (VaiTro IN (N'Admin', N'User')), -- Phân quyền Admin và Người dùng
    NgayTao DATE DEFAULT GETDATE()
);

---------------------------------------------------
INSERT INTO [User] (Username, PasswordHash, HoTen, Email, SoDienThoai, VaiTro)
VALUES
(N'buiquyhung', N'12345', N'Bùi Quý Hùng', N'bqh@gmail.com', N'0969769397', N'Admin'),
(N'tran.thi.b', N'12345', N'Trần Thị B', N'ttb@gmail.com', N'0912345678', N'User'),
(N'le.van.c', N'12345', N'Lê Văn C', N'lvc@gmail.com', N'0923456789', N'User'),
(N'pham.thi.d', N'12345', N'Phạm Thị D', N'ptd@gmail.com', N'0934567890', N'User'),
(N'ngo.van.e', N'12345', N'Ngô Văn E', N'nve@gmail.com', N'0945678901', N'User');

INSERT INTO ChiTietXe (Model, DongCo, CongSuat, PhamViHoatDong, SoChoNgoi, MauSac)
VALUES 
(N'VF e34', N'Điện', 110, 300, 5, N'Trắng'),
(N'VF 8', N'Điện', 150, 400, 5, N'Xanh'),
(N'VF 9', N'Điện', 200, 500, 7, N'Đen'),
(N'VF 5 Plus', N'Điện', 120, 320, 5, N'Đỏ'),
(N'VF 6', N'Điện', 130, 350, 5, N'Bạc'),
(N'VF 7', N'Điện', 140, 380, 5, N'Vàng'),
(N'VF e34 Plus', N'Điện', 110, 300, 5, N'Trắng ngọc trai'),
(N'VF 9 Plus', N'Điện', 200, 520, 7, N'Xám'),
(N'VF 8 Pro', N'Điện', 160, 420, 5, N'Xanh dương'),
(N'VF 6 Plus', N'Điện', 130, 360, 5, N'Xanh lá cây');

-- Thêm 5 ảnh cho xe có MaXe = 1
--INSERT INTO AnhXe (MaXe, DuongDanAnh, MoTa)
--VALUES
--(1, N'/images/xe1_1.jpg', N'Ảnh chụp phía trước xe 1'),
--(1, N'/images/xe1_2.jpg', N'Ảnh chụp phía sau xe 1'),
--(1, N'/images/xe1_3.jpg', N'Ảnh chụp bên hông trái xe 1'),
--(1, N'/images/xe1_4.jpg', N'Ảnh chụp bên hông phải xe 1'),
--(1, N'/images/xe1_5.jpg', N'Ảnh nội thất xe 1');

INSERT INTO Xe (BienSo, MaChiTietXe, TrangThaiXe, MaBaoHiem)
VALUES 
(N'29A-12345', 1, N'Sẵn sàng', 1),
(N'30B-54321', 2, N'Sẵn sàng', 2),
(N'31C-67890', 3, N'Đang thuê', 3),
(N'32D-98765', 4, N'Bảo dưỡng', 4),
(N'33E-45678', 5, N'Sẵn sàng', 5),
(N'34F-87654', 6, N'Đang thuê', 6),
(N'35G-11223', 7, N'Sẵn sàng', 7),
(N'36H-44556', 8, N'Sẵn sàng', 8),
(N'37I-77889', 9, N'Bảo dưỡng', 9),
(N'38J-99001', 10, N'Sẵn sàng', 10);

INSERT INTO BaoHiem (LoaiBaoHiem, NhaCungCap, ThoiHan)
VALUES
(N'Bảo hiểm toàn diện', N'Bảo hiểm PVI', '2025-12-31'),
(N'Bảo hiểm trách nhiệm dân sự', N'Bảo hiểm Bảo Việt', '2024-06-30'),
(N'Bảo hiểm toàn diện', N'Bảo hiểm Liberty', '2025-11-15'),
(N'Bảo hiểm thân vỏ', N'Bảo hiểm PVI', '2024-09-20'),
(N'Bảo hiểm trách nhiệm dân sự', N'Bảo hiểm MIC', '2025-01-01'),
(N'Bảo hiểm toàn diện', N'Bảo hiểm Bảo Minh', '2024-10-10'),
(N'Bảo hiểm thân vỏ', N'Bảo hiểm PTI', '2025-03-15'),
(N'Bảo hiểm toàn diện', N'Bảo hiểm PVI', '2025-12-31'),
(N'Bảo hiểm trách nhiệm dân sự', N'Bảo hiểm Bảo Việt', '2024-08-25'),
(N'Bảo hiểm thân vỏ', N'Bảo hiểm Liberty', '2025-02-28');

INSERT INTO NhanVien (HoTen, SoDienThoai, Email, ChucVu)
VALUES
(N'Nguyễn Văn An', '0902345678', N'nvx@example.com', N'Nhân viên kinh doanh'),
(N'Phạm Thị Yến', '0913456789', N'pty@example.com', N'Nhân viên chăm sóc khách hàng'),
(N'Lê Minh Tú', '0924567890', N'lmz@example.com', N'Nhân viên kỹ thuật'),
(N'Bùi Quý Hùng', '0935678901', N'tha@example.com', N'Quản lý'),
(N'Vũ Thị Bảo', '0946789012', N'vtb@example.com', N'Nhân viên hành chính');

INSERT INTO BaoDuong (MaXe, NgayBaoDuong, ChiPhi, MoTa)
VALUES
(1, '2024-01-10', 1500000, N'Thay dầu động cơ và lọc dầu'),
(2, '2024-02-15', 1200000, N'Kiểm tra hệ thống phanh và thay thế má phanh'),
(3, '2024-03-20', 1800000, N'Thay lọc gió và kiểm tra hệ thống điện'),
(4, '2024-04-25', 2000000, N'Đổi nước làm mát và bảo trì hệ thống truyền động'),
(5, '2024-05-30', 1600000, N'Thay bộ lọc nhiên liệu và kiểm tra hệ thống treo'),
(6, '2024-06-10', 1400000, N'Thay dầu hộp số và kiểm tra hệ thống lái'),
(7, '2024-07-15', 2200000, N'Bảo trì toàn diện và kiểm tra hệ thống điều hòa'),
(8, '2024-08-20', 1900000, N'Thay lọc dầu và kiểm tra hệ thống phanh'),
(9, '2024-09-25', 1700000, N'Kiểm tra hệ thống điện và thay bộ lọc gió'),
(10, '2024-10-30', 1500000, N'Đổi nước làm mát và kiểm tra hệ thống truyền động');

INSERT INTO KhuyenMai (TenKhuyenMai, MoTa, NgayBatDau, NgayKetThuc, GiaTri)
VALUES
(N'Giảm giá 10% cho thuê xe lâu dài', N'Giảm giá 10% cho hợp đồng thuê xe từ 30 ngày trở lên', '2024-01-01', '2024-03-31', 10.00),
(N'Khuyến mãi đầu năm', N'Tặng 1 ngày thuê miễn phí cho thuê từ 7 ngày trở lên', '2024-01-01', '2024-01-31', 100.00),
(N'Giảm giá 5% vào ngày cuối tuần', N'Giảm giá 5% cho các hợp đồng thuê vào thứ 6, thứ 7, chủ nhật', '2024-02-01', '2024-02-29', 5.00),
(N'Giảm giá 15% cho xe điện', N'Giảm giá 15% cho tất cả các xe điện', '2024-03-01', '2024-04-30', 15.00),
(N'Tặng 2 ngày thuê miễn phí', N'Tặng 2 ngày thuê miễn phí cho hợp đồng thuê từ 15 ngày trở lên', '2024-04-01', '2024-05-31', 200.00),
(N'Khuyến mãi sinh nhật', N'Giảm giá 20% cho thuê xe vào tháng sinh nhật của khách hàng', '2024-06-01', '2024-06-30', 20.00),
(N'Giảm giá 10% cho khách hàng cũ', N'Giảm giá 10% cho khách hàng đã thuê xe trước đây', '2024-07-01', '2024-08-31', 10.00),
(N'Khuyến mãi mùa hè', N'Tặng 1 ngày thuê miễn phí cho hợp đồng thuê từ 10 ngày trở lên', '2024-06-01', '2024-08-31', 100.00),
(N'Giảm giá 8% cho thuê xe từ thứ 2 đến thứ 5', N'Giảm giá 8% cho các hợp đồng thuê xe từ thứ 2 đến thứ 5', '2024-09-01', '2024-09-30', 8.00),
(N'Khuyến mãi cuối năm', N'Tặng 1 ngày thuê miễn phí cho hợp đồng thuê từ 20 ngày trở lên', '2024-11-01', '2024-12-31', 100.00);

INSERT INTO KhachHang (HoTen, CCCD, DiaChi, SoDienThoai, Email, GiayPhepLaiXe)
VALUES 
(N'Nguyễn Thị Linh', '012345678901', N'Hà Nội', '0901122334', N'ntl@gmail.com', 'GPLX001'),
(N'Trần Văn Minh', '023456789012', N'TP. Hồ Chí Minh', '0902233445', N'tvm@gmail.com', 'GPLX002'),
(N'Lê Thị Ngọc', '034567890123', N'Đà Nẵng', '0903344556', N'ltn@gmail.com', 'GPLX003'),
(N'Nguyễn Thị Lan', '012345678901', N'Hà Nội', '0901122334', N'ntl@gmail.com', 'GPLX004'),
(N'Trần Văn Mạnh', '023456789012', N'TP. Hồ Chí Minh', '0902233445', N'tvm@gmail.com', 'GPLX005'),
(N'Lê Thị Ngọc Anh', '034567890123', N'Đà Nẵng', '0903344556', N'ltn@gmail.com', 'GPLX006'),
(N'Nguyễn Thị Lụa', '012345678901', N'Hà Nội', '0901122334', N'ntl@gmail.com', 'GPLX007'),
(N'Trần Văn Mách', '023456789012', N'TP. Hồ Chí Minh', '0902233445', N'tvm@gmail.com', 'GPLX008'),
(N'Lê Thị Nga', '034567890123', N'Đà Nẵng', '0903344556', N'ltn@gmail.com', 'GPLX009'),
(N'Lê Thị Nguyên', '034567890123', N'Đà Nẵng', '0903344556', N'ltn@gmail.com', 'GPLX010');

INSERT INTO HopDongThue (MaKhachHang, MaXe, NgayThue, NgayTra) VALUES
(1, 1, '2024-09-01', '2024-09-07'),
(2, 2, '2024-09-05', '2024-09-10'),
(3, 3, '2024-09-10', '2024-09-15'),
(4, 1, '2024-09-12', '2024-09-18'),
(5, 4, '2024-09-15', '2024-09-22'),
(6, 2, '2024-09-20', '2024-09-25'),
(7, 5, '2024-09-23', '2024-09-30'),
(8, 6, '2024-09-25', '2024-09-28'),
(9, 7, '2024-09-27', '2024-10-02'),
(10, 3, '2024-09-29', '2024-10-05');

INSERT INTO ThanhToan (MaHopDong, NgayThanhToan, SoTien, PhuongThucThanhToan) VALUES
(1, '2024-09-01', 700000, N'Tiền mặt'),
(2, '2024-09-05', 500000, N'Transfer'),
(3, '2024-09-10', 800000, N'Tiền mặt'),
(4, '2024-09-12', 600000, N'Transfer'),
(5, '2024-09-15', 900000, N'Tiền mặt'),
(6, '2024-09-20', 750000, N'Transfer'),
(7, '2024-09-23', 650000, N'Tiền mặt'),
(8, '2024-09-25', 850000, N'Transfer'),
(9, '2024-09-27', 700000, N'Tiền mặt'),
(10, '2024-09-29', 950000, N'Transfer');

INSERT INTO ChiPhiPhatSinh (MaHopDong, LoaiChiPhi, SoTien) VALUES
(1, N'Phạt nguội', 200000),
(1, N'Thủng lốp', 150000),
(2, N'Chi phí đổ xăng', 300000),
(2, N'Phạt vượt tốc độ', 500000),
(3, N'Sửa chữa va chạm', 800000),
(4, N'Chi phí đỗ xe', 100000),
(5, N'Phạt nguội', 250000),
(6, N'Thủng lốp', 180000),
(7, N'Chi phí rửa xe', 50000),
(8, N'Sửa chữa phanh', 600000);

INSERT INTO DanhGiaKhachHang (MaKhachHang, Diem, NhanXet) VALUES
(1, 4, N'Xe hơi sạch sẽ, nhưng cần bảo trì định kỳ.'),
(2, 5, N'Tôi rất hài lòng với dịch vụ và chất lượng xe.'),
(3, 2, N'Xe không đạt tiêu chuẩn, sẽ không quay lại.'),
(4, 4, N'Dịch vụ tốt nhưng có thể cải thiện thời gian xử lý.'),
(5, 3, N'Thủ tục thuê xe dễ dàng nhưng xe có một số vấn đề.'),
(6, 5, N'Cảm ơn vì đã hỗ trợ nhiệt tình và chu đáo.'),
(7, 4, N'Rất hài lòng với cách phục vụ của nhân viên.'),
(8, 1, N'Tôi đã gặp phải một số vấn đề lớn với xe, không hài lòng.'),
(9, 4, N'Chi phí hợp lý và chất lượng xe ổn.'),
(10, 3, N'Cần cải thiện chất lượng xe và dịch vụ khách hàng.');

INSERT INTO XuLySuCo (MaXe, NgaySuCo, MoTa, TinhTrang, MaNhanVien, GhiChu) VALUES
(1, '2024-09-02', N'Va chạm với xe khác', N'Đang xử lý', 11, N'Đã kiểm tra xe.'),
(2, '2024-09-05', N'Thủng lốp', N'Chưa xử lý', 12, N'Chờ thay lốp mới.'),
(3, '2024-09-10', N'Máy phát tiếng kêu lạ', N'Đã xử lý', 13, N'Đã sửa xong.'),
(4, '2024-09-12', N'Xe không khởi động được', N'Đang xử lý', 11, N'Chờ kỹ thuật đến xem.'),
(5, '2024-09-15', N'Đổ dầu sai loại', N'Đã xử lý', 14, N'Đã thay dầu và kiểm tra.'),
(6, '2024-09-20', N'Gãy gương xe', N'Chưa xử lý', 12, N'Chờ phụ tùng thay thế.'),
(7, '2024-09-23', N'Sửa chữa phanh', N'Đang xử lý', 13, N'Đang chờ linh kiện.'),
(8, '2024-09-25', N'Thủng lốp', N'Đã xử lý', 14, N'Đã thay lốp mới.'),
(9, '2024-09-27', N'Va quẹt vào cột', N'Chưa xử lý', 11, N'Chờ đánh giá thiệt hại.'),
(10, '2024-09-29', N'Thay dầu động cơ', N'Đã xử lý', 13, N'Hoàn tất thay dầu.');
