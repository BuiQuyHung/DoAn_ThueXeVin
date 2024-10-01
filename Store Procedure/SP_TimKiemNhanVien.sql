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
CREATE PROCEDURE TimKiemNhanVien
    @HoTen NVARCHAR(100) = NULL,         
    @SoDienThoai NVARCHAR(15) = NULL,   
    @Email NVARCHAR(100) = NULL,        
    @ChucVu NVARCHAR(50) = NULL         
AS
BEGIN
    SELECT 
        MaNhanVien, 
        HoTen, 
        SoDienThoai, 
        Email, 
        ChucVu
    FROM NhanVien
    WHERE 
        (@HoTen IS NULL OR HoTen LIKE '%' + @HoTen + '%') AND    
        (@SoDienThoai IS NULL OR SoDienThoai LIKE '%' + @SoDienThoai + '%') AND 
        (@Email IS NULL OR Email LIKE '%' + @Email + '%') AND    
        (@ChucVu IS NULL OR ChucVu LIKE '%' + @ChucVu + '%');   
END;

EXEC TimKiemNhanVien @HoTen = N'Quý', @ChucVu = N'Quản lý';