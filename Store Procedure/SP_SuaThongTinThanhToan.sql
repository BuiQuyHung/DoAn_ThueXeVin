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
CREATE PROCEDURE SuaThongTinThanhToan
    @MaThanhToan INT,                  
    @MaHopDong INT,                     
    @NgayThanhToan DATE,                
    @SoTien DECIMAL(18, 2),            
    @PhuongThucThanhToan NVARCHAR(50)   
AS
BEGIN
    BEGIN TRANSACTION;

    BEGIN TRY
        UPDATE ThanhToan
        SET 
            MaHopDong = @MaHopDong,
            NgayThanhToan = @NgayThanhToan,
            SoTien = @SoTien,
            PhuongThucThanhToan = @PhuongThucThanhToan
        WHERE 
            MaThanhToan = @MaThanhToan;

        COMMIT TRANSACTION;
    END TRY
    BEGIN CATCH
        ROLLBACK TRANSACTION;
        DECLARE @ErrorMessage NVARCHAR(4000);
        SET @ErrorMessage = ERROR_MESSAGE();
        RAISERROR (@ErrorMessage, 16, 1);
    END CATCH
END;

EXEC SuaThongTinThanhToan 
    @MaThanhToan = 12, 
    @MaHopDong = 11, 
    @NgayThanhToan = '2024-09-30', 
    @SoTien = 5500000.00, 
    @PhuongThucThanhToan = N'Tiền mặt';
