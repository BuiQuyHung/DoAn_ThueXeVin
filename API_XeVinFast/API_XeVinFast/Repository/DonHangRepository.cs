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
    public class DonHangRepository : IDonHangRepository
    {
        private readonly string _connectionString;

        public DonHangRepository(IConfiguration configuration)
        {
            _connectionString = configuration.GetConnectionString("DefaultConnection");
        }

        public async Task<bool> CreateDonHangAsync(DonHangDto donHangDto)
        {
            using (IDbConnection dbConnection = new SqlConnection(_connectionString))
            {
                var parameters = new
                {
                    donHangDto.MaKhachHang,
                    donHangDto.HoTen,
                    donHangDto.Email,
                    donHangDto.SoDienThoai,
                    donHangDto.DiaChi,
                    donHangDto.PhuongThucThanhToan,
                    donHangDto.MaXe,
                    donHangDto.BienSo,
                    donHangDto.GiaThue,
                    donHangDto.NgayThue,
                    donHangDto.NgayTra,
                    donHangDto.TongTien,
                    donHangDto.MaHopDong
                };

                var result = await dbConnection.ExecuteAsync("ThemMoiDonHang", parameters, commandType: CommandType.StoredProcedure);
                return result > 0;
            }
        }

        public async Task<IEnumerable<DonHangDto>> TimKiemDonHangAsync(string bienSo, string trangThaiDonHang)
        {
            using (IDbConnection dbConnection = new SqlConnection(_connectionString))
            {
                var parameters = new
                {
                    BienSo = bienSo,
                    TrangThaiDonHang = trangThaiDonHang
                };

                var result = await dbConnection.QueryAsync<DonHangDto>("TimKiemDonHang", parameters, commandType: CommandType.StoredProcedure);
                return result;
            }
        }

        public async Task<IEnumerable<DonHangDto>> GetAllDonHangAsync()
        {
            using (IDbConnection dbConnection = new SqlConnection(_connectionString))
            {
                var result = await dbConnection.QueryAsync<DonHangDto>("GetAllDonHang", commandType: CommandType.StoredProcedure);
                return result;
            }
        }

        public async Task<DonHangDto> GetDonHangByIdAsync(int maDonHang)
        {
            using (IDbConnection dbConnection = new SqlConnection(_connectionString))
            {
                var parameters = new { MaDonHang = maDonHang };
                var result = await dbConnection.QueryFirstOrDefaultAsync<DonHangDto>("GetDonHangById", parameters, commandType: CommandType.StoredProcedure);
                return result;
            }
        }

        public async Task<bool> UpdateTrangThaiDonHangAsync(int maDonHang, string trangThaiDonHang)
        {
            using (IDbConnection dbConnection = new SqlConnection(_connectionString))
            {
                var parameters = new
                {
                    MaDonHang = maDonHang,
                    TrangThaiDonHang = trangThaiDonHang
                };

                var result = await dbConnection.ExecuteAsync("SuaTrangThaiDonHang", parameters, commandType: CommandType.StoredProcedure);
                return result > 0;
            }
        }

        public async Task<bool> DeleteDonHangAsync(int maDonHang)
        {
            using (IDbConnection dbConnection = new SqlConnection(_connectionString))
            {
                var parameters = new { MaDonHang = maDonHang };
                var result = await dbConnection.ExecuteAsync("XoaDonHang", parameters, commandType: CommandType.StoredProcedure);
                return result > 0;
            }
        }
    }
}
