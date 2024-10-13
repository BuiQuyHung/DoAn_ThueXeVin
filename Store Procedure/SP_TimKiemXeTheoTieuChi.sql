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
CREATE PROCEDURE TimKiemXeTheoTieuChi
    @BienSo NVARCHAR(50) = NULL,         
    @MaChiTietXe INT = NULL,               
    @TrangThaiXe NVARCHAR(50) = NULL,    
    @MaBaoHiem INT = NULL,                 
    @GiaThueXe DECIMAL(18, 2) = NULL       
AS
BEGIN

    SELECT 
        Xe.MaXe, 
        Xe.BienSo, 
        Xe.MaChiTietXe, 
        ChiTietXe.Model, 
        ChiTietXe.DongCo, 
        ChiTietXe.GiaThueXe, 
        ChiTietXe.CongSuat, 
        ChiTietXe.PhamViHoatDong, 
        ChiTietXe.SoChoNgoi, 
        ChiTietXe.MauSac, 
        Xe.TrangThaiXe, 
        Xe.MaBaoHiem, 
        Xe.DuongDanAnh
    FROM Xe
    LEFT JOIN ChiTietXe ON Xe.MaChiTietXe = ChiTietXe.MaChiTietXe
    WHERE (@BienSo IS NULL OR Xe.BienSo = @BienSo)  
      AND (@MaChiTietXe IS NULL OR Xe.MaChiTietXe = @MaChiTietXe)  
      AND (@TrangThaiXe IS NULL OR Xe.TrangThaiXe = @TrangThaiXe) 
      AND (@MaBaoHiem IS NULL OR Xe.MaBaoHiem = @MaBaoHiem)  
      AND (@GiaThueXe IS NULL OR ChiTietXe.GiaThueXe = @GiaThueXe);  
END;

EXEC TimKiemXeTheoTieuChi @BienSo = '34B-54321';              
EXEC TimKiemXeTheoTieuChi @MaChiTietXe = 1;                   
EXEC TimKiemXeTheoTieuChi @TrangThaiXe = N'Sẵn sàng';     
EXEC TimKiemXeTheoTieuChi @MaBaoHiem = 2;                     
EXEC TimKiemXeTheoTieuChi @GiaThueXe = 500000;               
