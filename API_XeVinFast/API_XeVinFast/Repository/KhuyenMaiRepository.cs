using Dapper;
using Microsoft.Data.SqlClient;
using System.Collections.Generic;
using System.Data;
using System.Threading.Tasks;
using API_XeVinFast.DTO;
using API_XeVinFast.Interfaces;
using Microsoft.Extensions.Configuration;

namespace API_XeVinFast.Repository
{
    public class KhuyenMaiRepository : IKhuyenMaiRepository
    {
        private readonly string _connectionString;

        public KhuyenMaiRepository(IConfiguration configuration)
        {
            _connectionString = configuration.GetConnectionString("DefaultConnection");
        }

        public async Task<IEnumerable<KhuyenMaiDto>> GetAllKhuyenMaiAsync()
        {
            using (IDbConnection dbConnection = new SqlConnection(_connectionString))
            {
                var result = await dbConnection.QueryAsync<KhuyenMaiDto>("GetAllKhuyenMai", commandType: CommandType.StoredProcedure);
                return result;
            }
        }

        public async Task<KhuyenMaiDto> GetKhuyenMaiByIdAsync(int maKhuyenMai)
        {
            using (IDbConnection dbConnection = new SqlConnection(_connectionString))
            {
                var parameters = new { MaKhuyenMai = maKhuyenMai };
                var result = await dbConnection.QuerySingleOrDefaultAsync<KhuyenMaiDto>("GetKhuyenMaiById", parameters, commandType: CommandType.StoredProcedure);
                return result;
            }
        }

        public async Task<bool> CreateKhuyenMaiAsync(KhuyenMaiDto khuyenMaiDto)
        {
            using (IDbConnection dbConnection = new SqlConnection(_connectionString))
            {
                var parameters = new
                {
                    khuyenMaiDto.TenKhuyenMai,
                    khuyenMaiDto.MoTa,
                    khuyenMaiDto.NgayBatDau,
                    khuyenMaiDto.NgayKetThuc,
                    khuyenMaiDto.GiaTri
                };
                var result = await dbConnection.ExecuteAsync("ThemMoiKhuyenMai", parameters, commandType: CommandType.StoredProcedure);
                return result > 0;
            }
        }

        public async Task<bool> UpdateKhuyenMaiAsync(KhuyenMaiDto khuyenMaiDto)
        {
            using (IDbConnection dbConnection = new SqlConnection(_connectionString))
            {
                var parameters = new
                {
                    khuyenMaiDto.MaKhuyenMai,
                    khuyenMaiDto.TenKhuyenMai,
                    khuyenMaiDto.MoTa,
                    khuyenMaiDto.NgayBatDau,
                    khuyenMaiDto.NgayKetThuc,
                    khuyenMaiDto.GiaTri
                };
                var result = await dbConnection.ExecuteAsync("SuaThongTinKhuyenMai", parameters, commandType: CommandType.StoredProcedure);
                return result > 0;
            }
        }

        public async Task<bool> DeleteKhuyenMaiAsync(int maKhuyenMai)
        {
            using (IDbConnection dbConnection = new SqlConnection(_connectionString))
            {
                var parameters = new { MaKhuyenMai = maKhuyenMai };
                var result = await dbConnection.ExecuteAsync("XoaKhuyenMai", parameters, commandType: CommandType.StoredProcedure);
                return result > 0;
            }
        }
    }
}
