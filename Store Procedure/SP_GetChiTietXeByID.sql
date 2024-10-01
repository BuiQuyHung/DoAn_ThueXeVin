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
CREATE PROCEDURE GetChiTietXeByID
    @MaChiTietXe INT
AS
BEGIN
    SET NOCOUNT ON;

    SELECT 
        MaChiTietXe,
        Model,
        DongCo,
        CongSuat,
        PhamViHoatDong,
        SoChoNgoi,
        MauSac
    FROM 
        ChiTietXe
    WHERE 
        MaChiTietXe = @MaChiTietXe;
END;

EXEC GetChiTietXeByID @MaChiTietXe = 1;
