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
CREATE PROCEDURE TimKiemXuLySuCo
    @MaSuCo INT = NULL,                
    @MaXe INT = NULL,                  
    @TinhTrang NVARCHAR(50) = NULL     
AS
BEGIN
    DECLARE @SQL NVARCHAR(MAX);
    SET @SQL = N'SELECT * FROM XuLySuCo WHERE 1=1';

    IF @MaSuCo IS NOT NULL
    BEGIN
        SET @SQL += ' AND MaSuCo = @MaSuCo';
    END

    IF @MaXe IS NOT NULL
    BEGIN
        SET @SQL += ' AND MaXe = @MaXe';
    END

    IF @TinhTrang IS NOT NULL
    BEGIN
        SET @SQL += ' AND TinhTrang = @TinhTrang';
    END

    EXEC sp_executesql @SQL, 
                       N'@MaSuCo INT, @MaXe INT, @TinhTrang NVARCHAR(50)', 
                       @MaSuCo = @MaSuCo, 
                       @MaXe = @MaXe, 
                       @TinhTrang = @TinhTrang;
END;

EXEC TimKiemXuLySuCo @MaSuCo = 10, @TinhTrang = N'Chưa xử lý';