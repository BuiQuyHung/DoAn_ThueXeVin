using System.ComponentModel.DataAnnotations;

namespace API_XeVinFast.Models
{
    public class KhuyenMai
    {
        [Key]
        public int MaKhuyenMai { get; set; }
        public string TenKhuyenMai { get; set; }
        public string MoTa { get; set; }
        public DateTime NgayBatDau { get; set; }
        public DateTime NgayKetThuc { get; set; }
        public decimal GiaTri { get; set; }
    }
}
