using API_XeVinFast.DTO;
using System.Collections.Generic;
using System.Threading.Tasks;

namespace API_XeVinFast.Interfaces
{
    public interface IThanhToanRepository
    {
        Task<IEnumerable<ThanhToanDto>> GetAllThanhToanAsync();
        Task<ThanhToanDto> GetThanhToanByIdAsync(int maThanhToan);
        Task<bool> CreateThanhToanAsync(ThanhToanDto thanhToanDto);
        Task<bool> UpdateThanhToanAsync(ThanhToanDto thanhToanDto);
        Task<bool> DeleteThanhToanAsync(int maThanhToan);
        Task<IEnumerable<ThanhToanDto>> TimKiemThanhToanAsync(int? maHopDong, DateTime? ngayThanhToan);
    }
}
