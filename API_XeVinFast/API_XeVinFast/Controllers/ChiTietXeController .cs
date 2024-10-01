using API_XeVinFast.DTO;
using API_XeVinFast.Interfaces;
using Microsoft.AspNetCore.Mvc;
using System.Collections.Generic;
using System.Threading.Tasks;

namespace API_XeVinFast.Controllers
{
    [Route("api/[controller]")]
    [ApiController]
    public class ChiTietXeController : ControllerBase
    {
        private readonly IChiTietXeRepository _chiTietXeRepository;

        public ChiTietXeController(IChiTietXeRepository chiTietXeRepository)
        {
            _chiTietXeRepository = chiTietXeRepository;
        }

        [HttpGet("GetAllChiTietXe")]
        public async Task<ActionResult<IEnumerable<ChiTietXeDto>>> GetAllChiTietXe()
        {
            var chiTietXes = await _chiTietXeRepository.GetAllChiTietXeAsync();
            return Ok(chiTietXes);
        }

        [HttpGet("GetByID/{id}")]
        public async Task<ActionResult<ChiTietXeDto>> GetChiTietXeById(int id)
        {
            var chiTietXe = await _chiTietXeRepository.GetChiTietXeByIdAsync(id);
            if (chiTietXe == null)
                return NotFound();
            return Ok(chiTietXe);
        }

        [HttpPost("CreateChiTietXe")]
        public async Task<ActionResult> CreateChiTietXe(ChiTietXeDto chiTietXeDto)
        {
            var created = await _chiTietXeRepository.CreateChiTietXeAsync(chiTietXeDto);
            if (!created)
                return BadRequest();
            return Ok();
        }

        [HttpPut("UpdateChiTietXe")]
        public async Task<ActionResult> UpdateChiTietXe(ChiTietXeDto chiTietXeDto)
        {
            var updated = await _chiTietXeRepository.UpdateChiTietXeAsync(chiTietXeDto);
            if (!updated)
                return BadRequest();
            return Ok();
        }

        [HttpDelete("DeleteChiTietXe/{id}")]
        public async Task<ActionResult> DeleteChiTietXe(int id)
        {
            var deleted = await _chiTietXeRepository.DeleteChiTietXeAsync(id);
            if (!deleted)
                return BadRequest();
            return Ok();
        }
    }
}
