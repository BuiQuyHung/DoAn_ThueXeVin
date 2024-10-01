using System.ComponentModel.DataAnnotations;

namespace API_XeVinFast.Models
{
    public class KhachHang
    {
        [Key]
        public int MaKhachHang { get; set; }
        public string HoTen { get; set; }
        public string CCCD { get; set; }
        public string DiaChi { get; set; }
        public string SoDienThoai { get; set; }
        public string Email { get; set; }
        public string GiayPhepLaiXe { get; set; }
    }
}
