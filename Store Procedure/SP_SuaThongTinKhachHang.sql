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
CREATE PROCEDURE SuaThongTinKhachHang
    @MaKhachHang INT,              
    @HoTen NVARCHAR(100) = NULL,   
    @CCCD NVARCHAR(50) = NULL,     
    @DiaChi NVARCHAR(255) = NULL,  
    @SoDienThoai NVARCHAR(15) = NULL, 
    @Email NVARCHAR(100) = NULL,   
    @GiayPhepLaiXe NVARCHAR(50) = NULL 
AS
BEGIN
    BEGIN TRANSACTION;
    
    BEGIN TRY
        IF EXISTS (SELECT 1 FROM KhachHang WHERE MaKhachHang = @MaKhachHang)
        BEGIN
            UPDATE KhachHang
            SET 
                HoTen = COALESCE(@HoTen, HoTen), 
                CCCD = COALESCE(@CCCD, CCCD),
                DiaChi = COALESCE(@DiaChi, DiaChi),
                SoDienThoai = COALESCE(@SoDienThoai, SoDienThoai),
                Email = COALESCE(@Email, Email),
                GiayPhepLaiXe = COALESCE(@GiayPhepLaiXe, GiayPhepLaiXe)
            WHERE MaKhachHang = @MaKhachHang;

            COMMIT TRANSACTION;
        END
        ELSE
        BEGIN
            ROLLBACK TRANSACTION;
            RAISERROR('Khách hàng không tồn tại.', 16, 1);
        END
    END TRY
    BEGIN CATCH
        ROLLBACK TRANSACTION;
        
        DECLARE @ErrorMessage NVARCHAR(4000);
        SET @ErrorMessage = ERROR_MESSAGE();
        RAISERROR (@ErrorMessage, 16, 1);
    END CATCH
END;

EXEC SuaThongTinKhachHang 
    @MaKhachHang = 10, 
    @HoTen = N'Hùng Bùi', 
    @DiaChi = N'Hải Dương';
