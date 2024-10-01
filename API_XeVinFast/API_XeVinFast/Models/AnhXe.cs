using System.ComponentModel.DataAnnotations;

namespace API_XeVinFast.Models
{
    public class AnhXe
    {

        [Key]
        public int AnhID { get; set; }
        public int MaXe { get; set; }
        public string DuongDanAnh { get; set; }
        public string MoTa { get; set; }
    }
}
