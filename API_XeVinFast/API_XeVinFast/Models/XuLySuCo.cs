using System.ComponentModel.DataAnnotations;

namespace API_XeVinFast.Models
{
    public class XuLySuCo
    {
        [Key]
        public int MaSuCo { get; set; }
        public int MaXe { get; set; }
        public DateTime NgaySuCo { get; set; }
        public string MoTa { get; set; }
        public string TinhTrang { get; set; }
        public int NhanVienPhuTrach { get; set; }
        public string GhiChu { get; set; }
    }
}
