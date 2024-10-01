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
CREATE PROCEDURE SuaThongTinXe
    @MaXe INT,                   -- Mã xe cần cập nhật
    @BienSo NVARCHAR(50),        -- Biển số xe mới
    @MaChiTietXe INT,            -- Mã chi tiết xe mới
    @TrangThaiXe NVARCHAR(50),   -- Trạng thái xe mới
    @MaBaoHiem INT               -- Mã bảo hiểm mới
AS
BEGIN
    -- Bắt đầu giao dịch
    BEGIN TRANSACTION;
    
    BEGIN TRY
        -- Cập nhật thông tin xe trong bảng Xe
        UPDATE Xe
        SET 
            BienSo = @BienSo,
            MaChiTietXe = @MaChiTietXe,
            TrangThaiXe = @TrangThaiXe,
            MaBaoHiem = @MaBaoHiem
        WHERE MaXe = @MaXe;  -- Điều kiện để cập nhật đúng xe
        
        -- Xác nhận giao dịch nếu không có lỗi
        COMMIT TRANSACTION;
    END TRY
    BEGIN CATCH
        -- Rollback giao dịch nếu có lỗi
        ROLLBACK TRANSACTION;
        
        -- Trả về thông báo lỗi
        DECLARE @ErrorMessage NVARCHAR(4000);
        SET @ErrorMessage = ERROR_MESSAGE();
        RAISERROR (@ErrorMessage, 16, 1);
    END CATCH
END;

EXEC SuaThongTinXe 
    @MaXe = 11, 
    @BienSo = '30A-12345', 
    @MaChiTietXe = 2, 
    @TrangThaiXe = N'Đang bảo dưỡng', 
    @MaBaoHiem = 3;

