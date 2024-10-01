using API_XeVinFast.DTO;

namespace API_XeVinFast.Interfaces
{
    public interface INhanVienRepository
    {
        Task<IEnumerable<NhanVienDto>> GetAllNhanVienAsync();
        Task<NhanVienDto> GetNhanVienByIdAsync(int maNhanVien);
        Task<bool> CreateNhanVienAsync(NhanVienDto nhanVienDto);
        Task<bool> UpdateNhanVienAsync(NhanVienDto nhanVienDto);
        Task<bool> DeleteNhanVienAsync(int maNhanVien);
        Task<IEnumerable<NhanVienDto>> TimKiemNhanVienAsync(string hoTen, string soDienThoai, string email, string chucVu);
    }
}
