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
CREATE PROCEDURE SuaThongTinXuLySuCo
    @MaSuCo INT,                 
    @NgaySuCo DATE = NULL,       
    @MoTa NVARCHAR(255) = NULL,  
    @TinhTrang NVARCHAR(50) = NULL, 
    @MaNhanVien INT = NULL,      
    @GhiChu NVARCHAR(255) = NULL  
AS
BEGIN
    BEGIN TRANSACTION;
    
    BEGIN TRY
        UPDATE XuLySuCo
        SET 
            NgaySuCo = COALESCE(@NgaySuCo, NgaySuCo),
            MoTa = COALESCE(@MoTa, MoTa),
            TinhTrang = COALESCE(@TinhTrang, TinhTrang),
            MaNhanVien = COALESCE(@MaNhanVien, MaNhanVien),
            GhiChu = COALESCE(@GhiChu, GhiChu)
        WHERE MaSuCo = @MaSuCo;
        COMMIT TRANSACTION;
    END TRY
    BEGIN CATCH
        ROLLBACK TRANSACTION;
        
        DECLARE @ErrorMessage NVARCHAR(4000);
        SET @ErrorMessage = ERROR_MESSAGE();
        RAISERROR (@ErrorMessage, 16, 1);
    END CATCH
END;

EXEC SuaThongTinXuLySuCo 
    @MaSuCo = 13,                    
    @ghiChu = N'Sự cố đã được xử lý';  
