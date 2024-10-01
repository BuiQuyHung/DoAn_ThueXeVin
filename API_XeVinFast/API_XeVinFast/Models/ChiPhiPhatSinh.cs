using System.ComponentModel.DataAnnotations;

namespace API_XeVinFast.Models
{
    public class ChiPhiPhatSinh
    {
        [Key]
        public int MaChiPhi { get; set; }
        public int MaHopDong { get; set; }
        public string LoaiChiPhi { get; set; }
        public decimal SoTien { get; set; }
    }
}
