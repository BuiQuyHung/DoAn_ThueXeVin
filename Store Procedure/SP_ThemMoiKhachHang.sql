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
CREATE PROCEDURE ThemMoiKhachHang
    @HoTen NVARCHAR(100),         
    @CCCD NVARCHAR(50),           
    @DiaChi NVARCHAR(255) = NULL, 
    @SoDienThoai NVARCHAR(15) = NULL,  
    @Email NVARCHAR(100) = NULL,  
    @GiayPhepLaiXe NVARCHAR(50)   
AS
BEGIN
    BEGIN TRANSACTION;
    
    BEGIN TRY
        INSERT INTO KhachHang (HoTen, CCCD, DiaChi, SoDienThoai, Email, GiayPhepLaiXe)
        VALUES (@HoTen, @CCCD, @DiaChi, @SoDienThoai, @Email, @GiayPhepLaiXe);
        
        COMMIT TRANSACTION;
    END TRY
    BEGIN CATCH
        ROLLBACK TRANSACTION;
        DECLARE @ErrorMessage NVARCHAR(4000);
        SET @ErrorMessage = ERROR_MESSAGE();
        RAISERROR (@ErrorMessage, 16, 1);
    END CATCH
END;

EXEC ThemMoiKhachHang 
    @HoTen = N'Bùi Quý Hùng', 
    @CCCD = N'123456789', 
    @DiaChi = N'123 Đường Tô Hiệu, Gia Lộc, Hải Dương', 
    @SoDienThoai = N'0912345678', 
    @Email = N'bqh@gmail.com', 
    @GiayPhepLaiXe = N'GPLX97';
