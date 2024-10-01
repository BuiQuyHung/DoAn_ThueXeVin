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
CREATE PROCEDURE TimKiemBaoDuong
    @MaXe INT = NULL,                        
    @NgayBaoDuong DATE = NULL,               
    @ChiPhi DECIMAL(18, 2) = NULL             
AS
BEGIN
    SELECT 
        MaBaoDuong, 
        MaXe, 
        NgayBaoDuong, 
        ChiPhi, 
        MoTa
    FROM BaoDuong
    WHERE 
        (@MaXe IS NULL OR MaXe = @MaXe) AND          
        (@NgayBaoDuong IS NULL OR NgayBaoDuong = @NgayBaoDuong) AND  
        (@ChiPhi IS NULL OR ChiPhi = @ChiPhi);     
END;

EXEC TimKiemBaoDuong @NgayBaoDuong = '2024-05-30';