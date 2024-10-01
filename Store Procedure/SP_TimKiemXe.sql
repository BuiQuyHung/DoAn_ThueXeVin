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
CREATE PROCEDURE TimKiemXe
    @BienSo NVARCHAR(50) = NULL,       -- Biển số xe (có thể NULL)
    @MaChiTietXe INT = NULL,           -- Mã chi tiết xe (có thể NULL)
    @TrangThaiXe NVARCHAR(50) = NULL,  -- Trạng thái xe (có thể NULL)
    @MaBaoHiem INT = NULL              -- Mã bảo hiểm (có thể NULL)
AS
BEGIN
    -- Truy vấn tìm kiếm
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
    WHERE 
        (@BienSo IS NULL OR Xe.BienSo LIKE '%' + @BienSo + '%') AND
        (@MaChiTietXe IS NULL OR Xe.MaChiTietXe = @MaChiTietXe) AND
        (@TrangThaiXe IS NULL OR Xe.TrangThaiXe LIKE '%' + @TrangThaiXe + '%') AND
        (@MaBaoHiem IS NULL OR Xe.MaBaoHiem = @MaBaoHiem);
END;

EXEC TimKiemXe @BienSo = '34F', @MaChiTietXe = NULL, @TrangThaiXe = NULL, @MaBaoHiem = NULL;

