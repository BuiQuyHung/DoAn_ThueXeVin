using Dapper;
using Microsoft.Data.SqlClient;
using Microsoft.Extensions.Configuration;
using API_XeVinFast.DTO;
using API_XeVinFast.Interfaces;
using System.Collections.Generic;
using System.Threading.Tasks;

namespace API_XeVinFast.Repository
{
    public class ChiTietXeRepository : IChiTietXeRepository
    {
        private readonly IConfiguration _configuration;
        private readonly string _connectionString;

        public ChiTietXeRepository(IConfiguration configuration)
        {
            _configuration = configuration;
            _connectionString = _configuration.GetConnectionString("DefaultConnection");
        }

        public async Task<IEnumerable<ChiTietXeDto>> GetAllChiTietXeAsync()
        {
            using (var connection = new SqlConnection(_connectionString))
            {
                var query = "GetAllXe"; 
                var result = await connection.QueryAsync<ChiTietXeDto>(query, commandType: System.Data.CommandType.StoredProcedure);
                return result;
            }
        }

        public async Task<ChiTietXeDto> GetChiTietXeByIdAsync(int maChiTietXe)
        {
            using (var connection = new SqlConnection(_connectionString))
            {
                var query = "GetChiTietXeById";
                var parameters = new { MaChiTietXe = maChiTietXe };
                var result = await connection.QueryFirstOrDefaultAsync<ChiTietXeDto>(query, parameters, commandType: System.Data.CommandType.StoredProcedure);
                return result;
            }
        }

        public async Task<bool> CreateChiTietXeAsync(ChiTietXeDto chiTietXeDto)
        {
            using (var connection = new SqlConnection(_connectionString))
            {
                var query = "ThemMoiChiTietXe";
                var parameters = new
                {
                    chiTietXeDto.Model,
                    chiTietXeDto.DongCo,
                    chiTietXeDto.CongSuat,
                    chiTietXeDto.PhamViHoatDong,
                    chiTietXeDto.SoChoNgoi,
                    chiTietXeDto.MauSac
                };
                var result = await connection.ExecuteAsync(query, parameters, commandType: System.Data.CommandType.StoredProcedure);
                return result > 0;
            }
        }

        public async Task<bool> UpdateChiTietXeAsync(ChiTietXeDto chiTietXeDto)
        {
            using (var connection = new SqlConnection(_connectionString))
            {
                var query = "SuaThongTinChiTietXe";
                var parameters = new
                {
                    chiTietXeDto.MaChiTietXe,
                    chiTietXeDto.Model,
                    chiTietXeDto.DongCo,
                    chiTietXeDto.CongSuat,
                    chiTietXeDto.PhamViHoatDong,
                    chiTietXeDto.SoChoNgoi,
                    chiTietXeDto.MauSac
                };
                var result = await connection.ExecuteAsync(query, parameters, commandType: System.Data.CommandType.StoredProcedure);
                return result > 0;
            }
        }

        public async Task<bool> DeleteChiTietXeAsync(int maChiTietXe)
        {
            using (var connection = new SqlConnection(_connectionString))
            {
                var query = "XoaChiTietXe";
                var parameters = new { MaChiTietXe = maChiTietXe };
                var result = await connection.ExecuteAsync(query, parameters, commandType: System.Data.CommandType.StoredProcedure);
                return result > 0;
            }
        }
    }
}
