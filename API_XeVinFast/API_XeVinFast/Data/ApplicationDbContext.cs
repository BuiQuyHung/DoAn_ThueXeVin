using Microsoft.EntityFrameworkCore;

namespace API_XeVinFast.Models
{
    public class ApplicationDbContext : DbContext
    {
        public ApplicationDbContext(DbContextOptions<ApplicationDbContext> options)
            : base(options) { }

        public DbSet<Xe> Xe { get; set; }
        public DbSet<KhachHang> KhachHang { get; set; }
        //public dbset<anhxe> anhxes { get; set; }
        //public dbset<baoduong> baoduongs { get; set; }
        //public dbset<baohiem> baohiems { get; set; }
        //public dbset<chiphiphatsinh> chiphiphatsinhs { get; set; }
        //public dbset<chitietxe> chitietxes { get; set; }
        //public dbset<danhgiakhachhang> danhgiakhachhangs { get; set; }
        //public dbset<hopdongthue> hopdongthues { get; set; }
        //public DbSet<KhuyenMai> KhuyenMais { get; set; }
        //public DbSet<NhanVien> NhanViens { get; set; }
        //public DbSet<ThanhToan> ThanhToans { get; set; }
        //public DbSet<User> Users { get; set; }
        //public DbSet<XuLySuCo> XuLySuCos { get; set; }

        protected override void OnModelCreating(ModelBuilder modelBuilder)
        {
            modelBuilder.Entity<Xe>()
                .HasKey(x => x.MaXe); 

            modelBuilder.Entity<Xe>()
                .Property(x => x.BienSo)
                .IsRequired() 
                .HasMaxLength(20); 

            modelBuilder.Entity<Xe>()
                .Property(x => x.TrangThaiXe)
                .HasMaxLength(50); 

            modelBuilder.Entity<KhachHang>()
                .HasKey(k => k.MaKhachHang); 
        }
    }
}
