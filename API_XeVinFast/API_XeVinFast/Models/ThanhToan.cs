using System.ComponentModel.DataAnnotations;

namespace API_XeVinFast.Models
{
    public class ThanhToan
    {
        [Key]
        public int MaThanhToan { get; set; }
        public int MaHopDong { get; set; }
        public DateTime NgayThanhToan { get; set; }
        public decimal SoTien { get; set; }
        public string PhuongThucThanhToan { get; set; }
    }
}
