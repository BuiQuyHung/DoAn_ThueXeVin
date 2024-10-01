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
CREATE PROCEDURE SuaThongTinHopDongThue
    @MaHopDong INT,
    @MaKhachHang INT,
    @MaXe INT,
    @NgayThue DATE,
    @NgayTra DATE
AS
BEGIN
    SET NOCOUNT ON;

    UPDATE HopDongThue
    SET 
        MaKhachHang = @MaKhachHang,
        MaXe = @MaXe,
        NgayThue = @NgayThue,
        NgayTra = @NgayTra
    WHERE 
        MaHopDong = @MaHopDong;
END;

EXEC SuaThongTinHopDongThue 
    @MaHopDong = 1, 
    @MaKhachHang = 2, 
    @MaXe = 3, 
    @NgayThue = '2024-10-01', 
    @NgayTra = '2024-10-08';
