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
CREATE PROCEDURE TimKiemChiTietXe
    @Model NVARCHAR(50) = NULL,           
    @DongCo NVARCHAR(50) = NULL,         
    @CongSuat INT = NULL,                  
    @PhamViHoatDong INT = NULL,             
    @SoChoNgoi INT = NULL,                  
    @MauSac NVARCHAR(50) = NULL             
AS
BEGIN
    SELECT 
        MaChiTietXe, 
        Model, 
        DongCo, 
        CongSuat, 
        PhamViHoatDong, 
        SoChoNgoi, 
        MauSac
    FROM ChiTietXe
    WHERE 
        (@Model IS NULL OR Model LIKE '%' + @Model + '%') AND    
        (@DongCo IS NULL OR DongCo LIKE '%' + @DongCo + '%') AND 
        (@CongSuat IS NULL OR CongSuat = @CongSuat) AND          
        (@PhamViHoatDong IS NULL OR PhamViHoatDong = @PhamViHoatDong) AND 
        (@SoChoNgoi IS NULL OR SoChoNgoi = @SoChoNgoi) AND       
        (@MauSac IS NULL OR MauSac LIKE '%' + @MauSac + '%');   
END;

EXEC TimKiemChiTietXe @Model = N'VF 8', @MauSac = N'Xanh';