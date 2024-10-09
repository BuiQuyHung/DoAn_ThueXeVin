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
ALTER PROCEDURE Top3XeThueNhieu
AS
BEGIN
    SELECT TOP 3 
        Xe.MaXe,
        Xe.BienSo,
        Xe.TrangThaiXe,
        Xe.MaBaoHiem,
        ChiTietXe.Model,
        ChiTietXe.DongCo,
        ChiTietXe.CongSuat,
        ChiTietXe.PhamViHoatDong,
        ChiTietXe.SoChoNgoi,
        ChiTietXe.MauSac,
        AnhXe.DuongDanAnh,  
        COUNT(HopDongThue.MaHopDong) AS SoLuotThue  
    FROM 
        Xe
    INNER JOIN 
        HopDongThue ON Xe.MaXe = HopDongThue.MaXe  
    LEFT JOIN 
        ChiTietXe ON Xe.MaChiTietXe = ChiTietXe.MaChiTietXe  
    LEFT JOIN 
        AnhXe ON Xe.MaXe = AnhXe.MaXe  
    GROUP BY 
        Xe.MaXe, 
        Xe.BienSo, 
        Xe.TrangThaiXe,
        Xe.MaBaoHiem,
        ChiTietXe.Model,
        ChiTietXe.DongCo,
        ChiTietXe.CongSuat,
        ChiTietXe.PhamViHoatDong,
        ChiTietXe.SoChoNgoi,
        ChiTietXe.MauSac,
        AnhXe.DuongDanAnh  
    ORDER BY 
        SoLuotThue DESC; 
END;


EXEC Top3XeThueNhieu;