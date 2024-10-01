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
CREATE PROCEDURE GetXeByID
    @MaXe INT  
AS
BEGIN
    SELECT 
        Xe.MaXe, 
        Xe.BienSo, 
        Xe.MaChiTietXe, 
        ChiTietXe.Model, 
        ChiTietXe.DongCo, 
        ChiTietXe.CongSuat, 
        ChiTietXe.PhamViHoatDong, 
        ChiTietXe.SoChoNgoi, 
        ChiTietXe.MauSac, 
        Xe.TrangThaiXe, 
        Xe.MaBaoHiem,
        BaoHiem.LoaiBaoHiem,
        BaoHiem.NhaCungCap,
        BaoHiem.ThoiHan
    FROM Xe
    LEFT JOIN ChiTietXe ON Xe.MaChiTietXe = ChiTietXe.MaChiTietXe
    LEFT JOIN BaoHiem ON Xe.MaBaoHiem = BaoHiem.MaBaoHiem
    WHERE Xe.MaXe = @MaXe;  
END;
EXEC GetXeByID @MaXe = 1;
