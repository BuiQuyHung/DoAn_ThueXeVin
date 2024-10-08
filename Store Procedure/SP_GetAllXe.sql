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
CREATE PROCEDURE GetAllXe
AS
BEGIN
    -- Truy vấn để lấy tất cả xe kèm theo thông tin chi tiết xe và ảnh xe
    SELECT 
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
        AnhXe.DuongDanAnh  -- Đường dẫn đến ảnh xe
    FROM 
        Xe
    LEFT JOIN 
        ChiTietXe ON Xe.MaChiTietXe = ChiTietXe.MaChiTietXe  -- Liên kết với bảng ChiTietXe để lấy thông tin chi tiết xe
    LEFT JOIN 
        AnhXe ON Xe.MaXe = AnhXe.MaXe  -- Liên kết với bảng AnhXe để lấy thông tin ảnh xe
END;

EXEC GetAllXe;
