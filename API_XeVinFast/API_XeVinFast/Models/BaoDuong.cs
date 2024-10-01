using System.ComponentModel.DataAnnotations;

namespace API_XeVinFast.Models
{
    public class BaoDuong
    {
        [Key]
        public int MaBaoDuong { get; set; }
        public int MaXe { get; set; }
        public DateTime NgayBaoDuong { get; set; }
        public decimal ChiPhi { get; set; }
        public string MoTa { get; set; }
    }
}
