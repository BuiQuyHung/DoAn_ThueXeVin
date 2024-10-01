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
CREATE PROCEDURE SuaThongTinNhanVien
    @MaNhanVien INT,                -- Mã nhân viên cần sửa (bắt buộc)
    @HoTen NVARCHAR(100) = NULL,    -- Họ tên (có thể NULL nếu không muốn sửa)
    @SoDienThoai NVARCHAR(15) = NULL, -- Số điện thoại (có thể NULL nếu không muốn sửa)
    @Email NVARCHAR(100) = NULL,    -- Email (có thể NULL nếu không muốn sửa)
    @ChucVu NVARCHAR(50) = NULL     -- Chức vụ (có thể NULL nếu không muốn sửa)
AS
BEGIN
    -- Bắt đầu giao dịch
    BEGIN TRANSACTION;

    BEGIN TRY
        -- Kiểm tra xem nhân viên có tồn tại không
        IF EXISTS (SELECT 1 FROM NhanVien WHERE MaNhanVien = @MaNhanVien)
        BEGIN
            -- Thực hiện cập nhật thông tin của nhân viên
            UPDATE NhanVien
            SET 
                HoTen = COALESCE(@HoTen, HoTen),           -- Chỉ cập nhật nếu giá trị mới không phải NULL
                SoDienThoai = COALESCE(@SoDienThoai, SoDienThoai),
                Email = COALESCE(@Email, Email),
                ChucVu = COALESCE(@ChucVu, ChucVu)
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

EXEC SuaThongTinNhanVien 
    @MaNhanVien = 16, 
    @HoTen = N'Bùi Qúy Hùng', 
    @SoDienThoai = N'0986886888';
