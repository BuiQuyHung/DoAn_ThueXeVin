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
CREATE PROCEDURE ThemMoiBaoHiem
    @LoaiBaoHiem NVARCHAR(50),    
    @NhaCungCap NVARCHAR(100),     
    @ThoiHan DATE                   
AS
BEGIN
    BEGIN TRANSACTION;

    BEGIN TRY
        INSERT INTO BaoHiem (LoaiBaoHiem, NhaCungCap, ThoiHan)
        VALUES (@LoaiBaoHiem, @NhaCungCap, @ThoiHan);

        COMMIT TRANSACTION;
    END TRY
    BEGIN CATCH
        ROLLBACK TRANSACTION;

        DECLARE @ErrorMessage NVARCHAR(4000);
        SET @ErrorMessage = ERROR_MESSAGE();
        RAISERROR (@ErrorMessage, 16, 1);
    END CATCH
END;

EXEC ThemMoiBaoHiem 
    @LoaiBaoHiem = N'Bảo hiểm ô tô', 
    @NhaCungCap = N'Công ty Bảo hiểm ABC', 
    @ThoiHan = '2025-12-31';
