using API_XeVinFast.DTO;
using API_XeVinFast.Interfaces;
using Microsoft.AspNetCore.Mvc;
using System.Collections.Generic;
using System.Threading.Tasks;

namespace API_XeVinFast.Controllers
{
    [Route("api/[controller]")]
    [ApiController]
    public class KhuyenMaiController : ControllerBase
    {
        private readonly IKhuyenMaiRepository _khuyenMaiRepository;

        public KhuyenMaiController(IKhuyenMaiRepository khuyenMaiRepository)
        {
            _khuyenMaiRepository = khuyenMaiRepository;
        }

        [HttpGet("GetAllKhuyenMai")]
        public async Task<ActionResult<IEnumerable<KhuyenMaiDto>>> GetAllKhuyenMai()
        {
            var khuyenMais = await _khuyenMaiRepository.GetAllKhuyenMaiAsync();
            return Ok(khuyenMais);
        }

        [HttpGet("GetByID/{id}")]
        public async Task<ActionResult<KhuyenMaiDto>> GetKhuyenMaiById(int id)
        {
            var khuyenMai = await _khuyenMaiRepository.GetKhuyenMaiByIdAsync(id);
            if (khuyenMai == null)
                return NotFound();
            return Ok(khuyenMai);
        }

        [HttpPost("CreateKhuyenMai")]
        public async Task<ActionResult> CreateKhuyenMai(KhuyenMaiDto khuyenMaiDto)
        {
            var created = await _khuyenMaiRepository.CreateKhuyenMaiAsync(khuyenMaiDto);
            if (!created)
                return BadRequest();
            return Ok();
        }

        [HttpPut("UpdateKhuyenMai")]
        public async Task<ActionResult> UpdateKhuyenMai(KhuyenMaiDto khuyenMaiDto)
        {
            var updated = await _khuyenMaiRepository.UpdateKhuyenMaiAsync(khuyenMaiDto);
            if (!updated)
                return BadRequest();
            return Ok();
        }

        [HttpDelete("DeleteKhuyenMai/{id}")]
        public async Task<ActionResult> DeleteKhuyenMai(int id)
        {
            var deleted = await _khuyenMaiRepository.DeleteKhuyenMaiAsync(id);
            if (!deleted)
                return BadRequest();
            return Ok();
        }
    }
}
