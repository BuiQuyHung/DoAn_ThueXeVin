using API_XeVinFast.Models;
using API_XeVinFast.Interfaces;
using Microsoft.EntityFrameworkCore;
using System.Collections.Generic;
using System.Threading.Tasks;

namespace API_XeVinFast.Repositories
{
    public class KhachHangRepository : IKhachHangRepository
    {
        private readonly ApplicationDbContext _context;

        public KhachHangRepository(ApplicationDbContext context)
        {
            _context = context;
        }

        // Lấy tất cả khách hàng
        public async Task<IEnumerable<KhachHang>> GetAllKhachHangsAsync()
        {
            return await _context.KhachHang.ToListAsync();
        }

        // Lấy khách hàng theo ID
        public async Task<KhachHang> GetKhachHangByIdAsync(int maKhachHang)
        {
            return await _context.KhachHang.FindAsync(maKhachHang);
        }

        // Thêm một khách hàng mới
        public async Task AddKhachHangAsync(KhachHang khachHang)
        {
            await _context.KhachHang.AddAsync(khachHang);
            await _context.SaveChangesAsync();
        }

        // Cập nhật khách hàng
        public async Task UpdateKhachHangAsync(KhachHang khachHang)
        {
            _context.KhachHang.Update(khachHang);
            await _context.SaveChangesAsync();
        }

        // Xóa khách hàng theo ID
        public async Task DeleteKhachHangAsync(int maKhachHang)
        {
            var khachHang = await _context.KhachHang.FindAsync(maKhachHang);
            if (khachHang != null)
            {
                _context.KhachHang.Remove(khachHang);
                await _context.SaveChangesAsync();
            }
        }
    }
}
