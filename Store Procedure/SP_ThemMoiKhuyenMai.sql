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
CREATE PROCEDURE ThemMoiKhuyenMai
    @TenKhuyenMai NVARCHAR(100),   
    @MoTa NVARCHAR(255),            
    @NgayBatDau DATE,              
    @NgayKetThuc DATE,              
    @GiaTri DECIMAL(18, 2)          
AS
BEGIN
    BEGIN TRANSACTION;

    BEGIN TRY
        INSERT INTO KhuyenMai (TenKhuyenMai, MoTa, NgayBatDau, NgayKetThuc, GiaTri)
        VALUES (@TenKhuyenMai, @MoTa, @NgayBatDau, @NgayKetThuc, @GiaTri);

        COMMIT TRANSACTION;
    END TRY
    BEGIN CATCH
        ROLLBACK TRANSACTION;

        DECLARE @ErrorMessage NVARCHAR(4000);
        SET @ErrorMessage = ERROR_MESSAGE();
        RAISERROR (@ErrorMessage, 16, 1);
    END CATCH
END;

EXEC ThemMoiKhuyenMai 
    @TenKhuyenMai = 'Giảm giá 10%', 
    @MoTa = 'Giảm giá 10% cho tất cả các xe thuê trong tháng này', 
    @NgayBatDau = '2024-09-01', 
    @NgayKetThuc = '2024-09-30', 
    @GiaTri = 10.00;
