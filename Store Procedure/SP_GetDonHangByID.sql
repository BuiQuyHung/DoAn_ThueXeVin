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
CREATE PROCEDURE GetDonHangByID
    @MaDonHang INT  -- Tham số đầu vào là mã đơn hàng
AS
BEGIN
    SELECT 
        MaDonHang, 
        MaKhachHang, 
        HoTen, 
        Email, 
        SoDienThoai, 
        DiaChi, 
        PhuongThucThanhToan, 
        MaXe, 
        BienSo, 
        GiaThue, 
        NgayThue, 
        NgayTra, 
        TongTien, 
        MaHopDong, 
        TrangThaiDonHang
    FROM DonHang
    WHERE MaDonHang = @MaDonHang;  
END;

EXEC GetDonHangByID @MaDonHang = 1;  
