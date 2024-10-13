using System.Collections.Generic;
using System.Threading.Tasks;
using API_XeVinFast.DTO;

namespace API_XeVinFast.Interfaces
{
    public interface IDonHangRepository
    {
        Task<bool> CreateDonHangAsync(DonHangDto donHangDto);
        Task<IEnumerable<DonHangDto>> TimKiemDonHangAsync(string bienSo, string trangThaiDonHang);
        Task<IEnumerable<DonHangDto>> GetAllDonHangAsync();
        Task<DonHangDto> GetDonHangByIdAsync(int maDonHang);
        Task<bool> UpdateTrangThaiDonHangAsync(int maDonHang, string trangThaiDonHang);
        Task<bool> DeleteDonHangAsync(int maDonHang);
    }
}
