using Dapper;
using Microsoft.Data.SqlClient;
using Microsoft.Extensions.Configuration;
using API_XeVinFast.Interfaces;
using API_XeVinFast.Models.Dto;
using System.Collections.Generic;
using System.Threading.Tasks;

namespace API_XeVinFast.Repository
{
    public class HopDongThueRepository : IHopDongThueRepository
    {
        private readonly IConfiguration _configuration;
        private readonly string _connectionString;

        public HopDongThueRepository(IConfiguration configuration)
        {
            _configuration = configuration;
            _connectionString = _configuration.GetConnectionString("DefaultConnection");
        }

        public async Task<IEnumerable<HopDongThueDto>> GetAllHopDongThueAsync()
        {
            using (var connection = new SqlConnection(_connectionString))
            {
                var query = "GetAllHopDongThue";
                var result = await connection.QueryAsync<HopDongThueDto>(query, commandType: System.Data.CommandType.StoredProcedure);
                return result;
            }
        }

        public async Task<HopDongThueDto> GetHopDongThueByIdAsync(int maHopDong)
        {
            using (var connection = new SqlConnection(_connectionString))
            {
                var query = "GetHopDongThueById";
                var parameters = new { MaHopDong = maHopDong };
                var result = await connection.QueryFirstOrDefaultAsync<HopDongThueDto>(query, parameters, commandType: System.Data.CommandType.StoredProcedure);
                return result;
            }
        }

        public async Task<bool> CreateHopDongThueAsync(HopDongThueDto hopDongThueDto)
        {
            using (var connection = new SqlConnection(_connectionString))
            {
                var query = "ThemMoiHopDongThue";
                var parameters = new
                {
                    MaKhachHang = hopDongThueDto.MaKhachHang,
                    MaXe = hopDongThueDto.MaXe,
                    NgayThue = hopDongThueDto.NgayThue,
                    NgayTra = hopDongThueDto.NgayTra
                };
                var result = await connection.ExecuteAsync(query, parameters, commandType: System.Data.CommandType.StoredProcedure);
                return result > 0;
            }
        }

        public async Task<bool> UpdateHopDongThueAsync(HopDongThueDto hopDongThueDto)
        {
            using (var connection = new SqlConnection(_connectionString))
            {
                var query = "SuaThongTinHopDongThue";
                var parameters = new
                {
                    MaHopDong = hopDongThueDto.MaHopDong,
                    MaKhachHang = hopDongThueDto.MaKhachHang,
                    MaXe = hopDongThueDto.MaXe,
                    NgayThue = hopDongThueDto.NgayThue,
                    NgayTra = hopDongThueDto.NgayTra
                };
                var result = await connection.ExecuteAsync(query, parameters, commandType: System.Data.CommandType.StoredProcedure);
                return result > 0;
            }
        }

        public async Task<bool> DeleteHopDongThueAsync(int maHopDong)
        {
            using (var connection = new SqlConnection(_connectionString))
            {
                var query = "XoaHopDongThue";
                var parameters = new { MaHopDong = maHopDong };
                var result = await connection.ExecuteAsync(query, parameters, commandType: System.Data.CommandType.StoredProcedure);
                return result > 0;
            }
        }
    }
}
