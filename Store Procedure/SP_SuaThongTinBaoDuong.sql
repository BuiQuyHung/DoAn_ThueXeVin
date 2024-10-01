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
CREATE PROCEDURE SuaThongTinBaoDuong
    @MaBaoDuong INT,                     
    @MaXe INT = NULL,                     
    @NgayBaoDuong DATE = NULL,            
    @ChiPhi DECIMAL(18, 2) = NULL,        
    @MoTa NVARCHAR(255) = NULL             
AS
BEGIN
    BEGIN TRANSACTION;

    BEGIN TRY
        IF EXISTS (SELECT 1 FROM BaoDuong WHERE MaBaoDuong = @MaBaoDuong)
        BEGIN
            UPDATE BaoDuong
            SET 
                MaXe = COALESCE(@MaXe, MaXe),                
                NgayBaoDuong = COALESCE(@NgayBaoDuong, NgayBaoDuong),
                ChiPhi = COALESCE(@ChiPhi, ChiPhi),
                MoTa = COALESCE(@MoTa, MoTa)
            WHERE MaBaoDuong = @MaBaoDuong;
            COMMIT TRANSACTION;
        END
        ELSE
        BEGIN
            ROLLBACK TRANSACTION;
            RAISERROR('Bản ghi bảo dưỡng không tồn tại.', 16, 1);
        END
    END TRY
    BEGIN CATCH
        ROLLBACK TRANSACTION;

        DECLARE @ErrorMessage NVARCHAR(4000);
        SET @ErrorMessage = ERROR_MESSAGE();
        RAISERROR (@ErrorMessage, 16, 1);
    END CATCH
END;

EXEC SuaThongTinBaoDuong 
    @MaBaoDuong = 11, 
    @MaXe = 2, 
    @NgayBaoDuong = '2023-09-30',
    @ChiPhi = 600000,
    @MoTa = N'Bảo dưỡng nội thất';
