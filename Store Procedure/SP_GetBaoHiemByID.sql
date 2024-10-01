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
CREATE PROCEDURE GetBaoHiemByID
    @MaBaoHiem INT  -- Tham số đầu vào là mã bảo hiểm cần lấy
AS
BEGIN
    -- Truy vấn lấy thông tin bảo hiểm dựa trên MaBaoHiem
    SELECT 
        MaBaoHiem, 
        LoaiBaoHiem, 
        NhaCungCap, 
        ThoiHan
    FROM BaoHiem
    WHERE MaBaoHiem = @MaBaoHiem;  -- Lọc theo MaBaoHiem
END;

EXEC GetBaoHiemByID @MaBaoHiem = 1;
