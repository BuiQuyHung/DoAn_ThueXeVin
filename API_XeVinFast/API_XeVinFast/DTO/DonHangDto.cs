using System;

namespace API_XeVinFast.DTO
{
    public class DonHangDto
    {
        public int MaDonHang { get; set; }
        public int MaKhachHang { get; set; }
        public string HoTen { get; set; }
        public string Email { get; set; }
        public string SoDienThoai { get; set; }
        public string DiaChi { get; set; }
        public string PhuongThucThanhToan { get; set; }
        public int MaXe { get; set; }
        public string BienSo { get; set; }
        public decimal GiaThue { get; set; }
        public DateTime NgayThue { get; set; }
        public DateTime NgayTra { get; set; }
        public decimal TongTien { get; set; }
        public int? MaHopDong { get; set; }
        public string TrangThaiDonHang { get; set; }
    }
}
