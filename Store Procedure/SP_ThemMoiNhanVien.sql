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
CREATE PROCEDURE ThemMoiNhanVien
    @HoTen NVARCHAR(100),
    @SoDienThoai NVARCHAR(15) = NULL,
    @Email NVARCHAR(100) = NULL,
    @ChucVu NVARCHAR(50) = NULL
AS
BEGIN
    -- Thêm mới một nhân viên vào bảng NhanVien
    INSERT INTO NhanVien (HoTen, SoDienThoai, Email, ChucVu)
    VALUES (@HoTen, @SoDienThoai, @Email, @ChucVu);

    -- Trả về ID của nhân viên mới được thêm
    SELECT SCOPE_IDENTITY() AS MaNhanVien;
END;

EXEC ThemMoiNhanVien 
    @HoTen = N'Hùng Bùi',
    @SoDienThoai = '0988888888',
    @Email = 'bqh@gmail.com',
    @ChucVu = N'Nhân viên kỹ thuật';
