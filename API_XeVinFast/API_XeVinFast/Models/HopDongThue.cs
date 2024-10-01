using System.ComponentModel.DataAnnotations;

namespace API_XeVinFast.Models
{
    public class HopDongThue
    {
        [Key]
        public int MaHopDong { get; set; }
        public int MaKhachHang { get; set; }
        public int MaXe { get; set; }
        public DateTime NgayThue { get; set; }
        public DateTime NgayTra { get; set; }
    }
}
