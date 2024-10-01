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
CREATE PROCEDURE TimKiemKhachHang
    @HoTen NVARCHAR(100) = NULL,         
    @CCCD NVARCHAR(50) = NULL,          
    @DiaChi NVARCHAR(255) = NULL,       
    @SoDienThoai NVARCHAR(15) = NULL,   
    @Email NVARCHAR(100) = NULL          
AS
BEGIN
    SELECT 
        MaKhachHang, 
        HoTen, 
        CCCD, 
        DiaChi, 
        SoDienThoai, 
        Email, 
        GiayPhepLaiXe
    FROM KhachHang
    WHERE 
        (@HoTen IS NULL OR HoTen LIKE '%' + @HoTen + '%') AND    
        (@CCCD IS NULL OR CCCD LIKE '%' + @CCCD + '%') AND       
        (@DiaChi IS NULL OR DiaChi LIKE '%' + @DiaChi + '%') AND 
        (@SoDienThoai IS NULL OR SoDienThoai LIKE '%' + @SoDienThoai + '%') AND 
        (@Email IS NULL OR Email LIKE '%' + @Email + '%');      
END;

EXEC TimKiemKhachHang @HoTen = N'Hùng', @SoDienThoai = N'0903';