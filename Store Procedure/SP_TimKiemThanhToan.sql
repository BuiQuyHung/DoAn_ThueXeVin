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
CREATE PROCEDURE TimKiemThanhToan
    @MaHopDong INT = NULL,                     -- Mã hợp đồng (có thể NULL để không tìm kiếm theo tiêu chí này)
    @NgayThanhToan DATE = NULL,                -- Ngày thanh toán (có thể NULL để không tìm kiếm theo tiêu chí này)
    @PhuongThucThanhToan NVARCHAR(50) = NULL   -- Phương thức thanh toán (có thể NULL để không tìm kiếm theo tiêu chí này)
AS
BEGIN
    -- Truy vấn tìm kiếm thông tin thanh toán
    SELECT 
        MaThanhToan,
        MaHopDong,
        NgayThanhToan,
        SoTien,
        PhuongThucThanhToan
    FROM 
        ThanhToan
    WHERE 
        (@MaHopDong IS NULL OR MaHopDong = @MaHopDong) AND
        (@NgayThanhToan IS NULL OR NgayThanhToan = @NgayThanhToan) AND
        (@PhuongThucThanhToan IS NULL OR PhuongThucThanhToan = @PhuongThucThanhToan);
END;

EXEC TimKiemThanhToan @MaHopDong = 1;