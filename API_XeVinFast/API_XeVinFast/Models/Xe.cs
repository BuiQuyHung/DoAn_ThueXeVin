using System.ComponentModel.DataAnnotations;

namespace API_XeVinFast.Models
{
    public class Xe
    {
        [Key]
        public int MaXe { get; set; }
        public string BienSo { get; set; }
        public int MaChiTietXe { get; set; }
      
        public int MaBaoHiem { get; set; }
        public string DuongDanAnh { get; set; }
        public string TrangThaiXe { get; set; }
        public string Model { get; set; }
        public string DongCo { get; set; }
        public string MauSac { get; set; }
        public decimal GiaThueXe { get; set; }
        public int CongSuat { get; set; }
        public int PhamViHoatDong { get; set; }
    }
}
