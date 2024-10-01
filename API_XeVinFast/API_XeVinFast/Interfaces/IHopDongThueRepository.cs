using API_XeVinFast.Models.Dto;
using System.Collections.Generic;
using System.Threading.Tasks;

namespace API_XeVinFast.Interfaces
{
    public interface IHopDongThueRepository
    {
        Task<IEnumerable<HopDongThueDto>> GetAllHopDongThueAsync();
        Task<HopDongThueDto> GetHopDongThueByIdAsync(int maHopDong);
        Task<bool> CreateHopDongThueAsync(HopDongThueDto hopDongThueDto);
        Task<bool> UpdateHopDongThueAsync(HopDongThueDto hopDongThueDto);
        Task<bool> DeleteHopDongThueAsync(int maHopDong);
    }
}
