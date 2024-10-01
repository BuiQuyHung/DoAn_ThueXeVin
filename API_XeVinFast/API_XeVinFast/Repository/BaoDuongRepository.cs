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
    public class BaoDuongRepository : IBaoDuongRepository
    {
        private readonly IConfiguration _configuration;
        private readonly string _connectionString;

        public BaoDuongRepository(IConfiguration configuration)
        {
            _configuration = configuration;
            _connectionString = _configuration.GetConnectionString("DefaultConnection");
        }

        public async Task<IEnumerable<BaoDuongDto>> GetAllBaoDuongAsync()
        {
            using (var connection = new SqlConnection(_connectionString))
            {
                var query = "GetAllBaoDuong"; // Tên store procedure
                var result = await connection.QueryAsync<BaoDuongDto>(query, commandType: System.Data.CommandType.StoredProcedure);
                return result;
            }
        }

        public async Task<BaoDuongDto> GetBaoDuongByIdAsync(int maBaoDuong)
        {
            using (var connection = new SqlConnection(_connectionString))
            {
                var query = "GetBaoDuongById";
                var parameters = new { MaBaoDuong = maBaoDuong };
                var result = await connection.QueryFirstOrDefaultAsync<BaoDuongDto>(query, parameters, commandType: System.Data.CommandType.StoredProcedure);
                return result;
            }
        }

        public async Task<bool> CreateBaoDuongAsync(BaoDuongDto baoDuongDto)
        {
            using (var connection = new SqlConnection(_connectionString))
            {
                var query = "ThemMoiBaoDuong"; // Tên Store Procedure
                var parameters = new
                {
                    MaXe = baoDuongDto.MaXe,
                    NgayBaoDuong = baoDuongDto.NgayBaoDuong,
                    ChiPhi = baoDuongDto.ChiPhi,
                    MoTa = baoDuongDto.MoTa
                };
                var result = await connection.ExecuteAsync(query, parameters, commandType: System.Data.CommandType.StoredProcedure);
                return result > 0;
            }
        }

        public async Task<bool> UpdateBaoDuongAsync(BaoDuongDto baoDuongDto)
        {
            using (var connection = new SqlConnection(_connectionString))
            {
                var query = "SuaThongTinBaoDuong"; // Tên Store Procedure
                var parameters = new
                {
                    MaBaoDuong = baoDuongDto.MaBaoDuong,
                    MaXe = baoDuongDto.MaXe,
                    NgayBaoDuong = baoDuongDto.NgayBaoDuong,
                    ChiPhi = baoDuongDto.ChiPhi,
                    MoTa = baoDuongDto.MoTa
                };
                var result = await connection.ExecuteAsync(query, parameters, commandType: System.Data.CommandType.StoredProcedure);
                return result > 0;
            }
        }

        public async Task<bool> DeleteBaoDuongAsync(int maBaoDuong)
        {
            using (var connection = new SqlConnection(_connectionString))
            {
                var query = "XoaBaoDuong"; // Tên Store Procedure
                var parameters = new { MaBaoDuong = maBaoDuong };
                var result = await connection.ExecuteAsync(query, parameters, commandType: System.Data.CommandType.StoredProcedure);
                return result > 0;
            }
        }

        public async Task<IEnumerable<BaoDuongDto>> TimKiemBaoDuongAsync(DateTime? ngayBaoDuong, decimal? chiPhi)
        {
            using (var connection = new SqlConnection(_connectionString))
            {
                var query = "TimKiemBaoDuong"; // Tên Store Procedure
                var parameters = new
                {
                    NgayBaoDuong = ngayBaoDuong,
                    ChiPhi = chiPhi
                };
                var result = await connection.QueryAsync<BaoDuongDto>(query, parameters, commandType: System.Data.CommandType.StoredProcedure);
                return result;
            }
        }

        public Task<IEnumerable<BaoDuongDto>> TimKiemBaoDuongAsync(int maXe, DateTime NgayBaoDuong, decimal ChiPhi, string MoTa)
        {
            throw new NotImplementedException();
        }

        Task IBaoDuongRepository.TimKiemBaoDuongAsync(DateTime? ngayBaoDuong, decimal? chiPhi)
        {
            throw new NotImplementedException();
        }
    }
}
