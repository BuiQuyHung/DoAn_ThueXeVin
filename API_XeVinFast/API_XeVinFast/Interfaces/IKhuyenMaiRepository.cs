using API_XeVinFast.DTO;
using System.Collections.Generic;
using System.Threading.Tasks;

namespace API_XeVinFast.Interfaces
{
    public interface IKhuyenMaiRepository
    {
        Task<IEnumerable<KhuyenMaiDto>> GetAllKhuyenMaiAsync();
        Task<KhuyenMaiDto> GetKhuyenMaiByIdAsync(int maKhuyenMai);
        Task<bool> CreateKhuyenMaiAsync(KhuyenMaiDto khuyenMaiDto);
        Task<bool> UpdateKhuyenMaiAsync(KhuyenMaiDto khuyenMaiDto);
        Task<bool> DeleteKhuyenMaiAsync(int maKhuyenMai);
    }
}
