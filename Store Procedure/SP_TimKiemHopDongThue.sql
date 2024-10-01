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
CREATE PROCEDURE TimKiemHopDongThue
    @MaHopDong INT = NULL,          
    @MaKhachHang INT = NULL,        
    @MaXe INT = NULL,               
    @NgayThue DATE = NULL,          
    @NgayTra DATE = NULL            
AS
BEGIN
    DECLARE @SQL NVARCHAR(MAX);
    SET @SQL = N'SELECT * FROM HopDongThue WHERE 1=1';

    IF @MaHopDong IS NOT NULL
    BEGIN
        SET @SQL += ' AND MaHopDong = @MaHopDong';
    END

    IF @MaKhachHang IS NOT NULL
    BEGIN
        SET @SQL += ' AND MaKhachHang = @MaKhachHang';
    END

    IF @MaXe IS NOT NULL
    BEGIN
        SET @SQL += ' AND MaXe = @MaXe';
    END

    IF @NgayThue IS NOT NULL
    BEGIN
        SET @SQL += ' AND NgayThue = @NgayThue';
    END

    IF @NgayTra IS NOT NULL
    BEGIN
        SET @SQL += ' AND NgayTra = @NgayTra';
    END

    EXEC sp_executesql @SQL, 
                       N'@MaHopDong INT, @MaKhachHang INT, @MaXe INT, @NgayThue DATE, @NgayTra DATE', 
                       @MaHopDong = @MaHopDong, 
                       @MaKhachHang = @MaKhachHang, 
                       @MaXe = @MaXe, 
                       @NgayThue = @NgayThue, 
                       @NgayTra = @NgayTra;
END;

EXEC TimKiemHopDongThue @MaKhachHang = 2;