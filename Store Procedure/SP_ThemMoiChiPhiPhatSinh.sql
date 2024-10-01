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
CREATE PROCEDURE ThemMoiChiPhiPhatSinh
    @MaHopDong INT,        
    @LoaiChiPhi NVARCHAR(50),  
    @SoTien DECIMAL(18, 2)    
AS
BEGIN
    BEGIN TRANSACTION;

    BEGIN TRY
        INSERT INTO ChiPhiPhatSinh (MaHopDong, LoaiChiPhi, SoTien)
        VALUES (@MaHopDong, @LoaiChiPhi, @SoTien);

        COMMIT TRANSACTION;
    END TRY
    BEGIN CATCH
        ROLLBACK TRANSACTION;

        DECLARE @ErrorMessage NVARCHAR(4000);
        SET @ErrorMessage = ERROR_MESSAGE();
        RAISERROR (@ErrorMessage, 16, 1);
    END CATCH
END;

EXEC ThemMoiChiPhiPhatSinh 
    @MaHopDong = 8,        
    @LoaiChiPhi = N'Phạt nguội',  
    @SoTien = 500.00;       
