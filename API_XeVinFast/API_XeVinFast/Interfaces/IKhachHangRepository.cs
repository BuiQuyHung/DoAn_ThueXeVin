using API_XeVinFast.Models;

namespace API_XeVinFast.Interfaces
{
    public interface IKhachHangRepository
    {
        Task<IEnumerable<KhachHang>> GetAllKhachHangsAsync(); // Lấy tất cả khách hàng
        Task<KhachHang> GetKhachHangByIdAsync(int maKhachHang); // Lấy khách hàng theo ID
        Task AddKhachHangAsync(KhachHang khachHang); // Thêm khách hàng mới
        Task UpdateKhachHangAsync(KhachHang khachHang); // Cập nhật khách hàng
        Task DeleteKhachHangAsync(int maKhachHang); // Xóa khách hàng theo ID
    }
}
