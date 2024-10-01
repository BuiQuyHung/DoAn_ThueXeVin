using API_XeVinFast.DTO;
using API_XeVinFast.Interfaces;
using Microsoft.AspNetCore.Mvc;
using System.Collections.Generic;
using System.Threading.Tasks;

namespace API_XeVinFast.Controllers
{
    [Route("api/[controller]")]
    [ApiController]
    public class BaoHiemController : ControllerBase
    {
        private readonly IBaoHiemRepository _baoHiemRepository;

        public BaoHiemController(IBaoHiemRepository baoHiemRepository)
        {
            _baoHiemRepository = baoHiemRepository;
        }

        [HttpGet("GetAllBaoHiem")]
        public async Task<ActionResult<IEnumerable<BaoHiemDto>>> GetAllBaoHiem()
        {
            var baoHiems = await _baoHiemRepository.GetAllBaoHiemAsync();
            return Ok(baoHiems);
        }

        [HttpGet("GetByID/{id}")]
        public async Task<ActionResult<BaoHiemDto>> GetBaoHiemById(int id)
        {
            var baoHiem = await _baoHiemRepository.GetBaoHiemByIdAsync(id);
            if (baoHiem == null)
                return NotFound();
            return Ok(baoHiem);
        }

        [HttpPost("CreateBaoHiem")]
        public async Task<ActionResult> CreateBaoHiem(BaoHiemDto baoHiemDto)
        {
            var created = await _baoHiemRepository.CreateBaoHiemAsync(baoHiemDto);
            if (!created)
                return BadRequest();
            return Ok();
        }

        [HttpPut("UpdateBaoHiem")]
        public async Task<ActionResult> UpdateBaoHiem(BaoHiemDto baoHiemDto)
        {
            var updated = await _baoHiemRepository.UpdateBaoHiemAsync(baoHiemDto);
            if (!updated)
                return BadRequest();
            return Ok();
        }

        [HttpDelete("DeleteBaoHiem/{id}")]
        public async Task<ActionResult> DeleteBaoHiem(int id)
        {
            var deleted = await _baoHiemRepository.DeleteBaoHiemAsync(id);
            if (!deleted)
                return BadRequest();
            return Ok();
        }
    }
}
