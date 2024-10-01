using API_XeVinFast.DTO;
using API_XeVinFast.Interfaces;
using API_XeVinFast.Repository;
using Microsoft.AspNetCore.Mvc;
using System.Collections.Generic;
using System.Threading.Tasks;

namespace API_XeVinFast.Controllers
{
    [Route("api/[controller]")]
    [ApiController]
    public class NhanVienController : ControllerBase
    {
        private readonly INhanVienRepository _nhanVienRepository;

        public NhanVienController(INhanVienRepository nhanVienRepository)
        {
            _nhanVienRepository = nhanVienRepository;
        }

        [HttpGet("GetAllNhanVien")]
        public async Task<ActionResult<IEnumerable<NhanVienDto>>> GetAllNhanVien()
        {
            var nhanViens = await _nhanVienRepository.GetAllNhanVienAsync();
            return Ok(nhanViens);
        }

        [HttpGet("GetByID/{id}")]
        public async Task<ActionResult<NhanVienDto>> GetNhanVienById(int id)
        {
            var nhanVien = await _nhanVienRepository.GetNhanVienByIdAsync(id);
            if (nhanVien == null)
                return NotFound();
            return Ok(nhanVien);
        }

        [HttpPost("CreateNhanVien")]
        public async Task<ActionResult> CreateNhanVien(NhanVienDto nhanVienDto)
        {
            var created = await _nhanVienRepository.CreateNhanVienAsync(nhanVienDto);
            if (!created)
                return BadRequest();
            return Ok();
        }

        [HttpPut("UpdateNhanVien")]
        public async Task<ActionResult> UpdateNhanVien(NhanVienDto nhanVienDto)
        {
            var updated = await _nhanVienRepository.UpdateNhanVienAsync(nhanVienDto);
            if (!updated)
                return BadRequest();
            return Ok();
        }

        [HttpDelete("DeleteNhanVien/{id}")]
        public async Task<ActionResult> DeleteNhanVien(int id)
        {
            var deleted = await _nhanVienRepository.DeleteNhanVienAsync(id);
            if (!deleted)
                return BadRequest();
            return Ok();
        }

        [HttpGet("TimKiemNhanVien")]
        public async Task<ActionResult<IEnumerable<NhanVienDto>>> TimKiemNhanVien(string hoTen = null, string soDienThoai = null, string email = null, string chucVu = null)
        {
            var nhanViens = await _nhanVienRepository.TimKiemNhanVienAsync(hoTen, soDienThoai, email, chucVu);
            return Ok(nhanViens);
        }
    }
}
