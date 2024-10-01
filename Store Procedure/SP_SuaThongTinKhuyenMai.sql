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
CREATE PROCEDURE SuaThongTinKhuyenMai
    @MaKhuyenMai INT,                
    @TenKhuyenMai NVARCHAR(100),     
    @MoTa NVARCHAR(255),              
    @NgayBatDau DATE,                 
    @NgayKetThuc DATE,                
    @GiaTri DECIMAL(18, 2)           
AS
BEGIN
    BEGIN TRANSACTION;

    BEGIN TRY
        UPDATE KhuyenMai
        SET 
            TenKhuyenMai = @TenKhuyenMai,
            MoTa = @MoTa,
            NgayBatDau = @NgayBatDau,
            NgayKetThuc = @NgayKetThuc,
            GiaTri = @GiaTri
        WHERE 
            MaKhuyenMai = @MaKhuyenMai;  

        COMMIT TRANSACTION;
    END TRY
    BEGIN CATCH
        ROLLBACK TRANSACTION;
        DECLARE @ErrorMessage NVARCHAR(4000);
        SET @ErrorMessage = ERROR_MESSAGE();
        RAISERROR (@ErrorMessage, 16, 1);
    END CATCH
END;

EXEC SuaThongTinKhuyenMai 
    @MaKhuyenMai = 11,                 
    @TenKhuyenMai = N'Giảm giá 15%',   
    @MoTa = N'Giảm giá 15% cho tất cả xe trong tháng tới', 
    @NgayBatDau = '2024-10-01', 
    @NgayKetThuc = '2024-10-31', 
    @GiaTri = 15.00;
