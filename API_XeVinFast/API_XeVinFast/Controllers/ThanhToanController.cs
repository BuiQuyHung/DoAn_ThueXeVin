using API_XeVinFast.DTO;
using API_XeVinFast.Interfaces;
using Microsoft.AspNetCore.Mvc;
using System.Collections.Generic;
using System.Threading.Tasks;

namespace API_XeVinFast.Controllers
{
    [Route("api/[controller]")]
    [ApiController]
    public class ThanhToanController : ControllerBase
    {
        private readonly IThanhToanRepository _thanhToanRepository;

        public ThanhToanController(IThanhToanRepository thanhToanRepository)
        {
            _thanhToanRepository = thanhToanRepository;
        }

        [HttpGet("GetAllThanhToan")]
        public async Task<ActionResult<IEnumerable<ThanhToanDto>>> GetAllThanhToan()
        {
            var thanhToans = await _thanhToanRepository.GetAllThanhToanAsync();
            return Ok(thanhToans);
        }

        [HttpGet("GetById/{id}")]
        public async Task<ActionResult<ThanhToanDto>> GetThanhToanById(int id)
        {
            var thanhToan = await _thanhToanRepository.GetThanhToanByIdAsync(id);
            if (thanhToan == null)
                return NotFound();
            return Ok(thanhToan);
        }

        [HttpPost("CreateThanhToan")]
        public async Task<ActionResult> CreateThanhToan(ThanhToanDto thanhToanDto)
        {
            var created = await _thanhToanRepository.CreateThanhToanAsync(thanhToanDto);
            if (!created)
                return BadRequest();
            return Ok();
        }

        [HttpPut("UpdateThanhToan")]
        public async Task<ActionResult> UpdateThanhToan(ThanhToanDto thanhToanDto)
        {
            var updated = await _thanhToanRepository.UpdateThanhToanAsync(thanhToanDto);
            if (!updated)
                return BadRequest();
            return Ok();
        }

        [HttpDelete("DeleteThanhToan/{id}")]
        public async Task<ActionResult> DeleteThanhToan(int id)
        {
            var deleted = await _thanhToanRepository.DeleteThanhToanAsync(id);
            if (!deleted)
                return BadRequest();
            return Ok();
        }

        [HttpGet("TimKiemThanhToan")]
        public async Task<ActionResult<IEnumerable<ThanhToanDto>>> TimKiemThanhToan(int? maHopDong = null, DateTime? ngayThanhToan = null)
        {
            var thanhToans = await _thanhToanRepository.TimKiemThanhToanAsync(maHopDong, ngayThanhToan);
            return Ok(thanhToans);
        }
    }
}
