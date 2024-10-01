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
CREATE PROCEDURE ThemMoiChiTietXe
    @Model NVARCHAR(50),            
    @DongCo NVARCHAR(50),         
    @CongSuat INT,                
    @PhamViHoatDong INT,           
    @SoChoNgoi INT,               
    @MauSac NVARCHAR(50)           
AS
BEGIN
    BEGIN TRANSACTION;
    
    BEGIN TRY
        INSERT INTO ChiTietXe (Model, DongCo, CongSuat, PhamViHoatDong, SoChoNgoi, MauSac)
        VALUES (@Model, @DongCo, @CongSuat, @PhamViHoatDong, @SoChoNgoi, @MauSac);

        COMMIT TRANSACTION;
    END TRY
    BEGIN CATCH
        ROLLBACK TRANSACTION;
        DECLARE @ErrorMessage NVARCHAR(4000);
        SET @ErrorMessage = ERROR_MESSAGE();
        RAISERROR (@ErrorMessage, 16, 1);
    END CATCH
END;

EXEC ThemMoiChiTietXe 
    @Model = N'VF97', 
    @DongCo = N'Điện', 
    @CongSuat = 250, 
    @PhamViHoatDong = 600, 
    @SoChoNgoi = 5, 
    @MauSac = N'Đen';
