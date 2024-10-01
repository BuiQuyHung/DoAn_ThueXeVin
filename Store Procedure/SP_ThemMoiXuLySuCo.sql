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
CREATE PROCEDURE ThemMoiXuLySuCo
    @MaXe INT,
    @NgaySuCo DATE,
    @MoTa NVARCHAR(255),
    @TinhTrang NVARCHAR(50),
    @MaNhanVien INT,
    @GhiChu NVARCHAR(255) = NULL  
AS
BEGIN
    BEGIN TRANSACTION;
    
    BEGIN TRY
        INSERT INTO XuLySuCo (MaXe, NgaySuCo, MoTa, TinhTrang, MaNhanVien, GhiChu)
        VALUES (@MaXe, @NgaySuCo, @MoTa, @TinhTrang, @MaNhanVien, @GhiChu);
        COMMIT TRANSACTION;
    END TRY
    BEGIN CATCH
        ROLLBACK TRANSACTION;
        
        DECLARE @ErrorMessage NVARCHAR(4000);
        SET @ErrorMessage = ERROR_MESSAGE();
        RAISERROR (@ErrorMessage, 16, 1);
    END CATCH
END;

EXEC ThemMoiXuLySuCo 
    @MaXe = 1,               
    @NgaySuCo = '2024-09-27', 
    @MoTa = N'Sự cố về động cơ', 
    @TinhTrang = N'Chưa xử lý', 
    @MaNhanVien = 12,        
    @GhiChu = N'Đã xử lý'; 
