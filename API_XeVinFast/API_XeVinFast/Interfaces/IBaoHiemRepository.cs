using API_XeVinFast.DTO;
using System.Collections.Generic;
using System.Threading.Tasks;

namespace API_XeVinFast.Interfaces
{
    public interface IBaoHiemRepository
    {
        Task<IEnumerable<BaoHiemDto>> GetAllBaoHiemAsync();
        Task<BaoHiemDto> GetBaoHiemByIdAsync(int maBaoHiem);
        Task<bool> CreateBaoHiemAsync(BaoHiemDto baoHiemDto);
        Task<bool> UpdateBaoHiemAsync(BaoHiemDto baoHiemDto);
        Task<bool> DeleteBaoHiemAsync(int maBaoHiem);
    }
}
