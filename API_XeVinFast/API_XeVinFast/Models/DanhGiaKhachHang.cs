using System.ComponentModel.DataAnnotations;

namespace API_XeVinFast.Models
{
    public class DanhGiaKhachHang
    {
        [Key]
        public int MaDanhGia { get; set; }
        public int MaKhachHang { get; set; }
        public int Diem { get; set; }
        public string NhanXet { get; set; }
    }
}
