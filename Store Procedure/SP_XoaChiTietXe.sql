﻿-- ================================================
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
CREATE PROCEDURE XoaChiTietXe
    @MaChiTietXe INT  
AS
BEGIN
    BEGIN TRANSACTION;
    
    BEGIN TRY
        IF EXISTS (SELECT 1 FROM ChiTietXe WHERE MaChiTietXe = @MaChiTietXe)
        BEGIN
            DELETE FROM ChiTietXe
            WHERE MaChiTietXe = @MaChiTietXe;
            
            COMMIT TRANSACTION;
        END
        ELSE
        BEGIN
            ROLLBACK TRANSACTION;
            RAISERROR('Chi tiết xe không tồn tại.', 16, 1);
        END
    END TRY
    BEGIN CATCH
        ROLLBACK TRANSACTION;
        
        DECLARE @ErrorMessage NVARCHAR(4000);
        SET @ErrorMessage = ERROR_MESSAGE();
        RAISERROR (@ErrorMessage, 16, 1);
    END CATCH
END;

EXEC XoaChiTietXe @MaChiTietXe = 21;
