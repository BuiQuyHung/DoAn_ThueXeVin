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
CREATE PROCEDURE TimKiemChiPhiPhatSinh
    @MaHopDong INT = NULL,         
    @LoaiChiPhi NVARCHAR(50) = NULL,  
    @SoTien DECIMAL(18, 2) = NULL   
AS
BEGIN
    DECLARE @SQL NVARCHAR(MAX);
    SET @SQL = N'SELECT * FROM ChiPhiPhatSinh WHERE 1=1';  
    IF @MaHopDong IS NOT NULL
        SET @SQL += N' AND MaHopDong = @MaHopDong';

    IF @LoaiChiPhi IS NOT NULL
        SET @SQL += N' AND LoaiChiPhi = @LoaiChiPhi';

    IF @SoTien IS NOT NULL
        SET @SQL += N' AND SoTien = @SoTien';

    EXEC sp_executesql @SQL, 
        N'@MaHopDong INT, @LoaiChiPhi NVARCHAR(50), @SoTien DECIMAL(18, 2)', 
        @MaHopDong, @LoaiChiPhi, @SoTien;
END;

EXEC TimKiemChiPhiPhatSinh 
    @LoaiChiPhi = N'Thủng lốp';