-- ================================================
-- Template generated from Template Explorer using:
-- Create Procedure (New Menu).SQL
--
-- Use the Specify Values for Template Parameters 
-- command (Ctrl-Shift-M) to fill in the parameter 
-- values below.
--
-- This block of comments will not be included in
-- the definition of the procedure.
-- ================================================
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		<Author,,Name>
-- Create date: <Create Date,,>
-- Description:	<Description,,>
-- =============================================
CREATE PROCEDURE ThemMoiDonHang
    @MaKhachHang INT,            
    @HoTen NVARCHAR(100),          
    @Email NVARCHAR(100),          
    @SoDienThoai NVARCHAR(20),     
    @DiaChi NVARCHAR(255),         
    @PhuongThucThanhToan NVARCHAR(50),  
    @MaXe INT,                 
    @BienSo NVARCHAR(20),          
    @GiaThue DECIMAL(18,2),       
    @NgayThue DATE,                
    @NgayTra DATE,                 
    @TongTien DECIMAL(18,2),       
    @MaHopDong INT = NULL          
AS
BEGIN
    BEGIN TRANSACTION;

    BEGIN TRY
        INSERT INTO DonHang (MaKhachHang, HoTen, Email, SoDienThoai, DiaChi, PhuongThucThanhToan, MaXe, BienSo, GiaThue, NgayThue, NgayTra, TongTien, MaHopDong)
        VALUES (@MaKhachHang, @HoTen, @Email, @SoDienThoai, @DiaChi, @PhuongThucThanhToan, @MaXe, @BienSo, @GiaThue, @NgayThue, @NgayTra, @TongTien, @MaHopDong);


        COMMIT TRANSACTION;
    END TRY
    BEGIN CATCH

        ROLLBACK TRANSACTION;

        DECLARE @ErrorMessage NVARCHAR(4000);
        SET @ErrorMessage = ERROR_MESSAGE();
        RAISERROR (@ErrorMessage, 16, 1);
    END CATCH
END;

EXEC ThemMoiDonHang 
    @MaKhachHang = 1, 
    @HoTen = N'Nguyễn Văn A', 
    @Email = N'email@example.com', 
    @SoDienThoai = N'0123456789', 
    @DiaChi = N'Hải Dương', 
    @PhuongThucThanhToan = N'Thẻ tín dụng', 
    @MaXe = 1, 
    @BienSo = N'29A-12345', 
    @GiaThue = 500000, 
    @NgayThue = '2024-10-15', 
    @NgayTra = '2024-10-20', 
    @TongTien = 2500000, 
    @MaHopDong = NULL;  

SELECT * FROM DonHang