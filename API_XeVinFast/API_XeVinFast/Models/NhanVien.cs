using System.ComponentModel.DataAnnotations;

namespace API_XeVinFast.Models
{
    public class NhanVien
    {
        [Key]
        public int MaNhanVien { get; set; }
        public string HoTen { get; set; }
        public string SoDienThoai { get; set; }
        public string Email { get; set; }
        public string ChucVu { get; set; }
    }
}
