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
CREATE PROCEDURE SuaThongTinChiPhiPhatSinh
    @MaChiPhi INT,                
    @MaHopDong INT = NULL,        
    @LoaiChiPhi NVARCHAR(50) = NULL,  
    @SoTien DECIMAL(18, 2) = NULL   
AS
BEGIN
    BEGIN TRANSACTION;

    BEGIN TRY
        UPDATE ChiPhiPhatSinh
        SET 
            MaHopDong = COALESCE(@MaHopDong, MaHopDong),
            LoaiChiPhi = COALESCE(@LoaiChiPhi, LoaiChiPhi),
            SoTien = COALESCE(@SoTien, SoTien)
        WHERE 
            MaChiPhi = @MaChiPhi;  

        COMMIT TRANSACTION;
    END TRY
    BEGIN CATCH
        ROLLBACK TRANSACTION;

        DECLARE @ErrorMessage NVARCHAR(4000);
        SET @ErrorMessage = ERROR_MESSAGE();
        RAISERROR (@ErrorMessage, 16, 1);
    END CATCH
END;

EXEC SuaThongTinChiPhiPhatSinh
    @MaChiPhi = 2,        
    @LoaiChiPhi = N'Phạt vượt tốc độ';