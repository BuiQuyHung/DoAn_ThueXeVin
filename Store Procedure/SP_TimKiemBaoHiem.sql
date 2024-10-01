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
CREATE PROCEDURE TimKiemBaoHiem
    @LoaiBaoHiem NVARCHAR(50) = NULL,    
    @NhaCungCap NVARCHAR(100) = NULL,     
    @ThoiHan DATE = NULL                   
AS
BEGIN
    SELECT 
        MaBaoHiem, 
        LoaiBaoHiem, 
        NhaCungCap, 
        ThoiHan
    FROM BaoHiem
    WHERE 
        (@LoaiBaoHiem IS NULL OR LoaiBaoHiem LIKE '%' + @LoaiBaoHiem + '%') AND  
        (@NhaCungCap IS NULL OR NhaCungCap LIKE '%' + @NhaCungCap + '%') AND    
        (@ThoiHan IS NULL OR ThoiHan = @ThoiHan);  
END;

EXEC TimKiemBaoHiem @LoaiBaoHiem = N'vỏ';