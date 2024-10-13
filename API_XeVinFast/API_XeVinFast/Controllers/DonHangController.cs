using Microsoft.AspNetCore.Mvc;
using API_XeVinFast.Interfaces;
using API_XeVinFast.DTO;
using System.Collections.Generic;
using System.Threading.Tasks;
using API_XeVinFast.Repository;
using API_XeVinFast.Models;

namespace API_XeVinFast.Controllers
{
    [Route("api/[controller]")]
    [ApiController]
    public class DonHangController : ControllerBase
    {
        private readonly IDonHangRepository _donHangRepository;

        public DonHangController(IDonHangRepository donHangRepository)
        {
            _donHangRepository = donHangRepository;
        }

        [HttpGet("GetAllDonHang")]
        public async Task<ActionResult<IEnumerable<DonHangDto>>> GetAllDonHang()
        {
            var donHangs = await _donHangRepository.GetAllDonHangAsync();
            return Ok(donHangs);
        }
        [HttpGet("GetById/{maDonHang}")]
        public async Task<ActionResult<DonHangDto>> GetDonHangById(int maDonHang)
        {
            var donHang = await _donHangRepository.GetDonHangByIdAsync(maDonHang);
            if (donHang == null)
                return NotFound();
            return Ok(donHang);
        }

        //[HttpGet("GetById/{id}")]
        //public async Task<ActionResult<DonHangDto>> GetDonHangById(int maDonHang)
        //{
        //    var donHang = await _donHangRepository.GetDonHangByIdAsync(maDonHang);
        //    return donHang != null ? Ok(donHang) : NotFound();
        //}

        [HttpPost("CreateDonHang")]
        public async Task<IActionResult> CreateDonHang([FromBody] DonHangDto donHangDto)
        {
            if (donHangDto == null)
                return BadRequest();

            var result = await _donHangRepository.CreateDonHangAsync(donHangDto);
            return result ? Ok() : BadRequest("Thêm đơn hàng không thành công.");
        }

        [HttpPut("UpdateTrangThaiDonHang")]
        public async Task<IActionResult> UpdateTrangThaiDonHang(int maDonHang, [FromBody] string trangThaiDonHang)
        {
            var result = await _donHangRepository.UpdateTrangThaiDonHangAsync(maDonHang, trangThaiDonHang);
            return result ? Ok() : NotFound("Cập nhật trạng thái không thành công.");
        }

        [HttpDelete("DeleteXe/{maDonHang}")]
        public async Task<IActionResult> DeleteDonHang(int maDonHang)
        {
            var result = await _donHangRepository.DeleteDonHangAsync(maDonHang);
            return result ? Ok() : NotFound("Xóa đơn hàng không thành công.");
        }

        [HttpGet("TimKiemDonHang")]
        public async Task<ActionResult<IEnumerable<DonHangDto>>> TimKiemDonHang(string bienSo, string trangThaiDonHang)
        {
            var donHangs = await _donHangRepository.TimKiemDonHangAsync(bienSo, trangThaiDonHang);
            return Ok(donHangs);
        }
    }
}
