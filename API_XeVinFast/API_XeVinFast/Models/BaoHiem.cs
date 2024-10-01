using System.ComponentModel.DataAnnotations;

namespace API_XeVinFast.Models
{
    public class BaoHiem
    {
        [Key]
        public int MaBaoHiem { get; set; }
        public string LoaiBaoHiem { get; set; }
        public string NhaCungCap { get; set; }
        public DateTime ThoiHan { get; set; }
    }
}
