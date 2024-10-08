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
CREATE PROCEDURE GetThanhToanByID
    @MaThanhToan INT
AS
BEGIN
    SET NOCOUNT ON;

    SELECT 
        MaThanhToan,
        MaHopDong,
        NgayThanhToan,
        SoTien,
        PhuongThucThanhToan
    FROM 
        ThanhToan
    WHERE 
        MaThanhToan = @MaThanhToan;
END;

EXEC GetThanhToanByID @MaThanhToan = 10;
