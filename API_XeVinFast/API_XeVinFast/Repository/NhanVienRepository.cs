using Dapper;
using Microsoft.Data.SqlClient;
using Microsoft.Extensions.Configuration;
using API_XeVinFast.Repository;
using System.Collections.Generic;
using System.Threading.Tasks;
using API_XeVinFast.DTO;
using API_XeVinFast.Interfaces;

namespace API_XeVinFast.Repository
{
    public class NhanVienRepository : INhanVienRepository
    {
        private readonly IConfiguration _configuration;
        private readonly string _connectionString;

        public NhanVienRepository(IConfiguration configuration)
        {
            _configuration = configuration;
            _connectionString = _configuration.GetConnectionString("DefaultConnection");
        }

        public async Task<IEnumerable<NhanVienDto>> GetAllNhanVienAsync()
        {
            using (var connection = new SqlConnection(_connectionString))
            {
                var query = "GetAllNhanVien"; // Tên store procedure
                var result = await connection.QueryAsync<NhanVienDto>(query, commandType: System.Data.CommandType.StoredProcedure);
                return result;
            }
        }

        public async Task<NhanVienDto> GetNhanVienByIdAsync(int maNhanVien)
        {
            using (var connection = new SqlConnection(_connectionString))
            {
                var query = "GetNhanVienById";
                var parameters = new { MaNhanVien = maNhanVien };
                var result = await connection.QueryFirstOrDefaultAsync<NhanVienDto>(query, parameters, commandType: System.Data.CommandType.StoredProcedure);
                return result;
            }
        }

        public async Task<bool> CreateNhanVienAsync(NhanVienDto nhanVienDto)
        {
            using (var connection = new SqlConnection(_connectionString))
            {
                var query = "ThemMoiNhanVien";
                var parameters = new
                {
                    HoTen = nhanVienDto.HoTen,
                    SoDienThoai = nhanVienDto.SoDienThoai,
                    Email = nhanVienDto.Email,
                    ChucVu = nhanVienDto.ChucVu
                };
                var result = await connection.ExecuteAsync(query, parameters, commandType: System.Data.CommandType.StoredProcedure);
                return result > 0;
            }
        }

        public async Task<bool> UpdateNhanVienAsync(NhanVienDto nhanVienDto)
        {
            using (var connection = new SqlConnection(_connectionString))
            {
                var query = "SuaThongTinNhanVien";
                var parameters = new
                {
                    MaNhanVien = nhanVienDto.MaNhanVien,
                    HoTen = nhanVienDto.HoTen,
                    SoDienThoai = nhanVienDto.SoDienThoai,
                    Email = nhanVienDto.Email,
                    ChucVu = nhanVienDto.ChucVu
                };
                var result = await connection.ExecuteAsync(query, parameters, commandType: System.Data.CommandType.StoredProcedure);
                return result > 0;
            }
        }

        public async Task<bool> DeleteNhanVienAsync(int maNhanVien)
        {
            using (var connection = new SqlConnection(_connectionString))
            {
                var query = "XoaNhanVien";
                var parameters = new { MaNhanVien = maNhanVien };
                var result = await connection.ExecuteAsync(query, parameters, commandType: System.Data.CommandType.StoredProcedure);
                return result > 0;
            }
        }
        public async Task<IEnumerable<NhanVienDto>> TimKiemNhanVienAsync(string hoTen, string soDienThoai, string email, string chucVu)
        {
            using (var connection = new SqlConnection(_connectionString))
            {
                var query = "TimKiemNhanVien"; // Tên Store Procedure
                var parameters = new
                {
                    HoTen = hoTen,
                    SoDienThoai = soDienThoai,
                    Email = email,
                    ChucVu = chucVu
                };
                var result = await connection.QueryAsync<NhanVienDto>(query, parameters, commandType: System.Data.CommandType.StoredProcedure);
                return result;
            }
        }
    }
}
