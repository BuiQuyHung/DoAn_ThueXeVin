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
CREATE PROCEDURE ThemMoiBaoDuong
    @MaXe INT,            
    @NgayBaoDuong DATE,  
    @ChiPhi DECIMAL(18,2),
    @MoTa NVARCHAR(255)   
AS
BEGIN
    BEGIN TRANSACTION;
    BEGIN TRY
        INSERT INTO BaoDuong (MaXe, NgayBaoDuong, ChiPhi, MoTa)
        VALUES (@MaXe, @NgayBaoDuong, @ChiPhi, @MoTa);

        COMMIT TRANSACTION;
    END TRY
    BEGIN CATCH
        ROLLBACK TRANSACTION;
        DECLARE @ErrorMessage NVARCHAR(4000);
        SET @ErrorMessage = ERROR_MESSAGE();
        RAISERROR (@ErrorMessage, 16, 1);
    END CATCH
END;

EXEC ThemMoiBaoDuong 
    @MaXe = 2,
    @NgayBaoDuong = '2024-09-25',
    @ChiPhi = 500000,
    @MoTa = N'Bảo dưỡng định kỳ';
