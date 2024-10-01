using API_XeVinFast.DTO;
using System.Collections.Generic;
using System.Threading.Tasks;

namespace API_XeVinFast.Repository
{
    public interface IBaoDuongRepository
    {
        Task<IEnumerable<BaoDuongDto>> GetAllBaoDuongAsync();
        Task<BaoDuongDto> GetBaoDuongByIdAsync(int maBaoDuong);
        Task<bool> CreateBaoDuongAsync(BaoDuongDto baoDuongDto);
        Task<bool> UpdateBaoDuongAsync(BaoDuongDto baoDuongDto);
        Task<bool> DeleteBaoDuongAsync(int maBaoDuong);
        Task<IEnumerable<BaoDuongDto>> TimKiemBaoDuongAsync(int maXe, DateTime NgayBaoDuong, decimal ChiPhi, string MoTa);
        Task TimKiemBaoDuongAsync(DateTime? ngayBaoDuong, decimal? chiPhi);
    }
}
