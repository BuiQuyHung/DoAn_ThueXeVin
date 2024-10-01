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
CREATE PROCEDURE ThemMoiXe
    @BienSo NVARCHAR(50),         -- Biển số xe
    @MaChiTietXe INT,             -- Mã chi tiết xe
    @TrangThaiXe NVARCHAR(50),    -- Trạng thái của xe
    @MaBaoHiem INT                -- Mã bảo hiểm
AS
BEGIN
    -- Bắt đầu giao dịch
    BEGIN TRANSACTION;
    
    BEGIN TRY
        -- Thêm mới xe vào bảng Xe
        INSERT INTO Xe (BienSo, MaChiTietXe, TrangThaiXe, MaBaoHiem)
        VALUES (@BienSo, @MaChiTietXe, @TrangThaiXe, @MaBaoHiem);
        
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

EXEC ThemMoiXe 
    @BienSo = '30A-12345', 
    @MaChiTietXe = 1, 
    @TrangThaiXe = N'Có sẵn', 
    @MaBaoHiem = 2;

