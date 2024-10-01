using Dapper;
using Microsoft.Data.SqlClient;
using Microsoft.Extensions.Configuration;
using API_XeVinFast.DTO;
using API_XeVinFast.Interfaces;
using System.Collections.Generic;
using System.Threading.Tasks;

namespace API_XeVinFast.Repository
{
    public class ThanhToanRepository : IThanhToanRepository
    {
        private readonly IConfiguration _configuration;
        private readonly string _connectionString;

        public ThanhToanRepository(IConfiguration configuration)
        {
            _configuration = configuration;
            _connectionString = _configuration.GetConnectionString("DefaultConnection");
        }

        public async Task<IEnumerable<ThanhToanDto>> GetAllThanhToanAsync()
        {
            using (var connection = new SqlConnection(_connectionString))
            {
                var query = "GetAllThanhToan"; 
                var result = await connection.QueryAsync<ThanhToanDto>(query, commandType: System.Data.CommandType.StoredProcedure);
                return result;
            }
        }

        public async Task<ThanhToanDto> GetThanhToanByIdAsync(int maThanhToan)
        {
            using (var connection = new SqlConnection(_connectionString))
            {
                var query = "GetThanhToanById";
                var parameters = new { MaThanhToan = maThanhToan };
                var result = await connection.QueryFirstOrDefaultAsync<ThanhToanDto>(query, parameters, commandType: System.Data.CommandType.StoredProcedure);
                return result;
            }
        }

        public async Task<bool> CreateThanhToanAsync(ThanhToanDto thanhToanDto)
        {
            using (var connection = new SqlConnection(_connectionString))
            {
                var query = "ThemMoiThanhToan";
                var parameters = new
                {
                    MaHopDong = thanhToanDto.MaHopDong,
                    NgayThanhToan = thanhToanDto.NgayThanhToan,
                    SoTien = thanhToanDto.SoTien,
                    PhuongThucThanhToan = thanhToanDto.PhuongThucThanhToan
                };
                var result = await connection.ExecuteAsync(query, parameters, commandType: System.Data.CommandType.StoredProcedure);
                return result > 0;
            }
        }

        public async Task<bool> UpdateThanhToanAsync(ThanhToanDto thanhToanDto)
        {
            using (var connection = new SqlConnection(_connectionString))
            {
                var query = "SuaThongTinThanhToan";
                var parameters = new
                {
                    MaThanhToan = thanhToanDto.MaThanhToan,
                    MaHopDong = thanhToanDto.MaHopDong,
                    NgayThanhToan = thanhToanDto.NgayThanhToan,
                    SoTien = thanhToanDto.SoTien,
                    PhuongThucThanhToan = thanhToanDto.PhuongThucThanhToan
                };
                var result = await connection.ExecuteAsync(query, parameters, commandType: System.Data.CommandType.StoredProcedure);
                return result > 0;
            }
        }

        public async Task<bool> DeleteThanhToanAsync(int maThanhToan)
        {
            using (var connection = new SqlConnection(_connectionString))
            {
                var query = "XoaThanhToan";
                var parameters = new { MaThanhToan = maThanhToan };
                var result = await connection.ExecuteAsync(query, parameters, commandType: System.Data.CommandType.StoredProcedure);
                return result > 0;
            }
        }

        public async Task<IEnumerable<ThanhToanDto>> TimKiemThanhToanAsync(int? maHopDong, DateTime? ngayThanhToan)
        {
            using (var connection = new SqlConnection(_connectionString))
            {
                var query = "TimKiemThanhToan";
                var parameters = new { MaHopDong = maHopDong, NgayThanhToan = ngayThanhToan };
                var result = await connection.QueryAsync<ThanhToanDto>(query, parameters, commandType: System.Data.CommandType.StoredProcedure);
                return result;
            }
        }
    }
}
