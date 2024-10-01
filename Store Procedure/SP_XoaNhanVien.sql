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
CREATE PROCEDURE XoaNhanVien
    @MaNhanVien INT  -- Tham số đầu vào là mã nhân viên cần xóa
AS
BEGIN
    -- Bắt đầu giao dịch
    BEGIN TRANSACTION;

    BEGIN TRY
        -- Kiểm tra xem nhân viên có tồn tại không
        IF EXISTS (SELECT 1 FROM NhanVien WHERE MaNhanVien = @MaNhanVien)
        BEGIN
            -- Thực hiện xóa nhân viên
            DELETE FROM NhanVien
            WHERE MaNhanVien = @MaNhanVien;

            -- Xác nhận giao dịch nếu thành công
            COMMIT TRANSACTION;
        END
        ELSE
        BEGIN
            -- Hủy giao dịch nếu không tìm thấy nhân viên
            ROLLBACK TRANSACTION;
            RAISERROR('Nhân viên không tồn tại.', 16, 1);
        END
    END TRY
    BEGIN CATCH
        -- Hủy giao dịch nếu có lỗi
        ROLLBACK TRANSACTION;

        -- Trả về thông báo lỗi
        DECLARE @ErrorMessage NVARCHAR(4000);
        SET @ErrorMessage = ERROR_MESSAGE();
        RAISERROR (@ErrorMessage, 16, 1);
    END CATCH
END;

EXEC XoaNhanVien @MaNhanVien = 16;
