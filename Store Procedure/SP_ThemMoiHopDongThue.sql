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
CREATE PROCEDURE ThemMoiHopDongThue
    @MaKhachHang INT,
    @MaXe INT,
    @NgayThue DATE,
    @NgayTra DATE
AS
BEGIN
    SET NOCOUNT ON;

    INSERT INTO HopDongThue (MaKhachHang, MaXe, NgayThue, NgayTra)
    VALUES (@MaKhachHang, @MaXe, @NgayThue, @NgayTra);
END;

EXEC ThemMoiHopDongThue @MaKhachHang = 1, @MaXe = 2, @NgayThue = '2024-09-30', @NgayTra = '2024-10-07';
