using Dapper;
using Microsoft.Data.SqlClient;
using Microsoft.Extensions.Configuration;
using API_XeVinFast.DTO;
using API_XeVinFast.Interfaces;
using System.Collections.Generic;
using System.Threading.Tasks;

namespace API_XeVinFast.Repository
{
    public class BaoHiemRepository : IBaoHiemRepository
    {
        private readonly IConfiguration _configuration;
        private readonly string _connectionString;

        public BaoHiemRepository(IConfiguration configuration)
        {
            _configuration = configuration;
            _connectionString = _configuration.GetConnectionString("DefaultConnection");
        }

        public async Task<IEnumerable<BaoHiemDto>> GetAllBaoHiemAsync()
        {
            using (var connection = new SqlConnection(_connectionString))
            {
                var query = "GetAllBaoHiem"; 
                var result = await connection.QueryAsync<BaoHiemDto>(query, commandType: System.Data.CommandType.StoredProcedure);
                return result;
            }
        }

        public async Task<BaoHiemDto> GetBaoHiemByIdAsync(int maBaoHiem)
        {
            using (var connection = new SqlConnection(_connectionString))
            {
                var query = "GetBaoHiemById";
                var parameters = new { MaBaoHiem = maBaoHiem };
                var result = await connection.QueryFirstOrDefaultAsync<BaoHiemDto>(query, parameters, commandType: System.Data.CommandType.StoredProcedure);
                return result;
            }
        }

        public async Task<bool> CreateBaoHiemAsync(BaoHiemDto baoHiemDto)
        {
            using (var connection = new SqlConnection(_connectionString))
            {
                var query = "ThemMoiBaoHiem";
                var parameters = new
                {
                    baoHiemDto.LoaiBaoHiem,
                    baoHiemDto.NhaCungCap,
                    baoHiemDto.ThoiHan
                };
                var result = await connection.ExecuteAsync(query, parameters, commandType: System.Data.CommandType.StoredProcedure);
                return result > 0;
            }
        }

        public async Task<bool> UpdateBaoHiemAsync(BaoHiemDto baoHiemDto)
        {
            using (var connection = new SqlConnection(_connectionString))
            {
                var query = "SuaThongTinBaoHiem";
                var parameters = new
                {
                    baoHiemDto.MaBaoHiem,
                    baoHiemDto.LoaiBaoHiem,
                    baoHiemDto.NhaCungCap,
                    baoHiemDto.ThoiHan
                };
                var result = await connection.ExecuteAsync(query, parameters, commandType: System.Data.CommandType.StoredProcedure);
                return result > 0;
            }
        }

        public async Task<bool> DeleteBaoHiemAsync(int maBaoHiem)
        {
            using (var connection = new SqlConnection(_connectionString))
            {
                var query = "XoaBaoHiem";
                var parameters = new { MaBaoHiem = maBaoHiem };
                var result = await connection.ExecuteAsync(query, parameters, commandType: System.Data.CommandType.StoredProcedure);
                return result > 0;
            }
        }
    }
}
