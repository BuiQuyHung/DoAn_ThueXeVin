using System.ComponentModel.DataAnnotations;

namespace API_XeVinFast.Models
{
    public class ChiTietXe
    {
        [Key]
        public int MaChiTietXe { get; set; }
        public string Model { get; set; }
        public string DongCo { get; set; }
        public int CongSuat { get; set; }
        public int PhamViHoatDong { get; set; }
        public int SoChoNgoi { get; set; }
        public string MauSac { get; set; }
    }
}
