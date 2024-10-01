using API_XeVinFast.DTO;
using System.Collections.Generic;
using System.Threading.Tasks;

namespace API_XeVinFast.Interfaces
{
    public interface IChiTietXeRepository
    {
        Task<IEnumerable<ChiTietXeDto>> GetAllChiTietXeAsync();
        Task<ChiTietXeDto> GetChiTietXeByIdAsync(int maChiTietXe);
        Task<bool> CreateChiTietXeAsync(ChiTietXeDto chiTietXeDto);
        Task<bool> UpdateChiTietXeAsync(ChiTietXeDto chiTietXeDto);
        Task<bool> DeleteChiTietXeAsync(int maChiTietXe);
    }
}
