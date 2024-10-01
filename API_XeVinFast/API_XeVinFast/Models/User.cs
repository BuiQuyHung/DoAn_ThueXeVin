using System.ComponentModel.DataAnnotations;

namespace API_XeVinFast.Models
{
    public class User
    {
        [Key]
        public int UserID { get; set; }
        public string Username { get; set; }
        public string PasswordHash { get; set; }
        public string HoTen { get; set; }
        public string Email { get; set; }
        public string SoDienThoai { get; set; }
        public string Vaitro { get; set; }
        public DateTime NgayTao { get; set; }
    }
}
