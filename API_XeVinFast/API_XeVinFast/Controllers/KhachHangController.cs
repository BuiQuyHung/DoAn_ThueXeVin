using API_XeVinFast.Interfaces;
using API_XeVinFast.Models;
using Microsoft.AspNetCore.Mvc;
using System.Collections.Generic;
using System.Threading.Tasks;
using API_XeVinFast.DTO;

namespace API_XeVinFast.Controllers
{
    [ApiController]
    [Route("api/[controller]")]
    public class KhachHangController : ControllerBase
    {
        private readonly IKhachHangRepository _khachHangRepository;

        public KhachHangController(IKhachHangRepository khachHangRepository)
        {
            _khachHangRepository = khachHangRepository;
        }

        [HttpGet("GetAllKhachHang")]
        public async Task<ActionResult<IEnumerable<KhachHangDto>>> GetKhachHangs()
        {
            var khachHangs = await _khachHangRepository.GetAllKhachHangsAsync();
            var khachHangDtos = new List<KhachHangDto>();

            foreach (var khachHang in khachHangs)
            {
                khachHangDtos.Add(new KhachHangDto
                {
                    MaKhachHang = khachHang.MaKhachHang,
                    HoTen = khachHang.HoTen,
                    CCCD = khachHang.CCCD,
                    DiaChi = khachHang.DiaChi,
                    SoDienThoai = khachHang.SoDienThoai,
                    Email = khachHang.Email,
                    GiayPhepLaiXe = khachHang.GiayPhepLaiXe
                });
            }

            return Ok(khachHangDtos);
        }

        
        [HttpGet("GetByID/{id}")]
        public async Task<ActionResult<KhachHangDto>> GetKhachHang(int maKhachHang)
        {
            var khachHang = await _khachHangRepository.GetKhachHangByIdAsync(maKhachHang);
            if (khachHang == null)
            {
                return NotFound();
            }

            var khachHangDto = new KhachHangDto
            {
                MaKhachHang = khachHang.MaKhachHang,
                HoTen = khachHang.HoTen,
                CCCD = khachHang.CCCD,
                DiaChi = khachHang.DiaChi,
                SoDienThoai = khachHang.SoDienThoai,
                Email = khachHang.Email,
                GiayPhepLaiXe = khachHang.GiayPhepLaiXe
            };

            return Ok(khachHangDto);
        }

        [HttpPost("CreateKhachHang")]
        public async Task<ActionResult> AddKhachHang(KhachHangDto khachHangDto)
        {
            var khachHang = new KhachHang
            {
                HoTen = khachHangDto.HoTen,
                CCCD = khachHangDto.CCCD,
                DiaChi = khachHangDto.DiaChi,
                SoDienThoai = khachHangDto.SoDienThoai,
                Email = khachHangDto.Email,
                GiayPhepLaiXe = khachHangDto.GiayPhepLaiXe
            };

            await _khachHangRepository.AddKhachHangAsync(khachHang);

            return CreatedAtAction(nameof(GetKhachHang), new { maKhachHang = khachHang.MaKhachHang }, khachHangDto);
        }

        // Cập nhật khách hàng
        [HttpPut("UpdateKhachHang")]
        public async Task<ActionResult> UpdateKhachHang(int maKhachHang, KhachHangDto khachHangDto)
        {
            if (maKhachHang != khachHangDto.MaKhachHang)
            {
                return BadRequest();
            }

            var khachHang = new KhachHang
            {
                MaKhachHang = khachHangDto.MaKhachHang,
                HoTen = khachHangDto.HoTen,
                CCCD = khachHangDto.CCCD,
                DiaChi = khachHangDto.DiaChi,
                SoDienThoai = khachHangDto.SoDienThoai,
                Email = khachHangDto.Email,
                GiayPhepLaiXe = khachHangDto.GiayPhepLaiXe
            };

            await _khachHangRepository.UpdateKhachHangAsync(khachHang);

            return NoContent();
        }

        // Xóa khách hàng
        [HttpDelete("DeleteKhachHang/{id}")]
        public async Task<ActionResult> DeleteKhachHang(int maKhachHang)
        {
            await _khachHangRepository.DeleteKhachHangAsync(maKhachHang);
            return NoContent();
        }
    }
}
