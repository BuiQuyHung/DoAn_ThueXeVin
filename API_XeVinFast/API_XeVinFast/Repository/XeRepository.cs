using Dapper;
using Microsoft.Data.SqlClient;
using Microsoft.Extensions.Configuration;
using API_XeVinFast.DTO;
using API_XeVinFast.Interfaces;
using System.Collections.Generic;
using System.Threading.Tasks;

namespace API_XeVinFast.Repository
{
    public class XeRepository : IXeRepository
    {
        private readonly IConfiguration _configuration;
        private readonly string _connectionString;

        public XeRepository(IConfiguration configuration)
        {
            _configuration = configuration;
            _connectionString = _configuration.GetConnectionString("DefaultConnection");
        }

        public async Task<IEnumerable<XeDto>> GetAllXeAsync()
        {
            using (var connection = new SqlConnection(_connectionString))
            {
                var query = "GetAllXe_ChiTiet"; 
                var result = await connection.QueryAsync<XeDto>(query, commandType: System.Data.CommandType.StoredProcedure);
                return result;
            }
        }

        public async Task<XeDto> GetXeByIdAsync(int maXe)
        {
            using (var connection = new SqlConnection(_connectionString))
            {
                var query = "GetXeById";
                var parameters = new { MaXe = maXe };
                var result = await connection.QueryFirstOrDefaultAsync<XeDto>(query, parameters, commandType: System.Data.CommandType.StoredProcedure);
                return result;
            }
        }

        public async Task<bool> CreateXeAsync(XeDto xeDto)
        {
            using (var connection = new SqlConnection(_connectionString))
            {
                var query = "ThemMoiXe"; 
                var parameters = new
                {
                    BienSo = xeDto.BienSo,
                    MaChiTietXe = xeDto.MaChiTietXe,
                    TrangThaiXe = xeDto.TrangThaiXe,
                    MaBaoHiem = xeDto.MaBaoHiem,
                    DuongDanAnh = xeDto.DuongDanAnh,
                    GiaThueXe = xeDto.GiaThueXe
                };
                var result = await connection.ExecuteAsync(query, parameters, commandType: System.Data.CommandType.StoredProcedure);
                return result > 0;
            }
        }



        public async Task<bool> UpdateXeAsync(XeDto xeDto)
        {
            using (var connection = new SqlConnection(_connectionString))
            {
                var query = "SuaThongTinXe";
                var parameters = new
                {
                    MaXe = xeDto.MaXe,
                    BienSo = xeDto.BienSo,
                    MaChiTietXe = xeDto.MaChiTietXe,
                    TrangThaiXe = xeDto.TrangThaiXe,
                    MaBaoHiem = xeDto.MaBaoHiem,
                    DuongDanAnh = xeDto.DuongDanAnh,
                    GiaThueXe = xeDto.GiaThueXe
                };
                var result = await connection.ExecuteAsync(query, parameters, commandType: System.Data.CommandType.StoredProcedure);
                return result > 0;
            }
        }

        public async Task<bool> DeleteXeAsync(int maXe)
        {
            using (var connection = new SqlConnection(_connectionString))
            {
                var query = "XoaThongTinXe";
                var parameters = new { MaXe = maXe };
                var result = await connection.ExecuteAsync(query, parameters, commandType: System.Data.CommandType.StoredProcedure);
                return result > 0;
            }
        }

        public async Task<IEnumerable<XeDto>> TimKiemXeAsync(string bienSo, int? maChiTietXe, string trangThaiXe, int? maBaoHiem, string duongDanAnh, int? giaThueXe)
        {
            using (var connection = new SqlConnection(_connectionString))
            {
                var query = "TimKiemXe"; 
                var parameters = new
                {
                    BienSo = bienSo,
                    MaChiTietXe = maChiTietXe,
                    TrangThaiXe = trangThaiXe,
                    MaBaoHiem = maBaoHiem,
                    DuongDanAnh = duongDanAnh,
                    GiaThueXe = giaThueXe
                };

                var result = await connection.QueryAsync<XeDto>(query, parameters, commandType: System.Data.CommandType.StoredProcedure);
                return result;
            }
        }

    }
}
