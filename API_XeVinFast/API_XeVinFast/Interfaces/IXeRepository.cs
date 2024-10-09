using API_XeVinFast.DTO;
using System.Collections.Generic;
using System.Threading.Tasks;

namespace API_XeVinFast.Interfaces
{
    public interface IXeRepository
    {
        Task<IEnumerable<XeDto>> GetAllXeAsync();
        Task<XeDto> GetXeByIdAsync(int maXe);
        Task<bool> CreateXeAsync(XeDto xeDto);
        Task<bool> UpdateXeAsync(XeDto xeDto);
        Task<bool> DeleteXeAsync(int maXe);
        Task<IEnumerable<XeDto>> TimKiemXeAsync(string bienSo, int? maChiTietXe, string trangThaiXe, int? maBaoHiem, string duongDanAnh);
    }

}
