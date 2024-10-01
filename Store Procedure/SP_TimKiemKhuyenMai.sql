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
CREATE PROCEDURE TimKiemKhuyenMai
    @TenKhuyenMai NVARCHAR(100) = NULL,    
    @MoTa NVARCHAR(255) = NULL,            
    @NgayBatDau DATE = NULL,               
    @NgayKetThuc DATE = NULL,              
    @GiaTri DECIMAL(18, 2) = NULL          
AS
BEGIN
    SELECT 
        MaKhuyenMai,
        TenKhuyenMai,
        MoTa,
        NgayBatDau,
        NgayKetThuc,
        GiaTri
    FROM 
        KhuyenMai
    WHERE
        (@TenKhuyenMai IS NULL OR TenKhuyenMai LIKE '%' + @TenKhuyenMai + '%')  
        AND (@MoTa IS NULL OR MoTa LIKE '%' + @MoTa + '%')                       
        AND (@NgayBatDau IS NULL OR NgayBatDau >= @NgayBatDau)                   
        AND (@NgayKetThuc IS NULL OR NgayKetThuc <= @NgayKetThuc)                
        AND (@GiaTri IS NULL OR GiaTri = @GiaTri);                               
END;

EXEC TimKiemKhuyenMai @GiaTri = 5;