using API_XeVinFast.Interfaces;
using API_XeVinFast.Models.Dto;
using Microsoft.AspNetCore.Mvc;
using System.Collections.Generic;
using System.Threading.Tasks;

namespace API_XeVinFast.Controllers
{
    [Route("api/[controller]")]
    [ApiController]
    public class HopDongThueController : ControllerBase
    {
        private readonly IHopDongThueRepository _hopDongThueRepository;

        public HopDongThueController(IHopDongThueRepository hopDongThueRepository)
        {
            _hopDongThueRepository = hopDongThueRepository;
        }

        [HttpGet("GetAllHopDongThue")]
        public async Task<ActionResult<IEnumerable<HopDongThueDto>>> GetAllHopDongThue()
        {
            var hopDongs = await _hopDongThueRepository.GetAllHopDongThueAsync();
            return Ok(hopDongs);
        }

        [HttpGet("GetByID/{id}")]
        public async Task<ActionResult<HopDongThueDto>> GetHopDongThueById(int id)
        {
            var hopDong = await _hopDongThueRepository.GetHopDongThueByIdAsync(id);
            if (hopDong == null)
                return NotFound();
            return Ok(hopDong);
        }

        [HttpPost("CreateHopDongThue")]
        public async Task<ActionResult> CreateHopDongThue(HopDongThueDto hopDongThueDto)
        {
            var created = await _hopDongThueRepository.CreateHopDongThueAsync(hopDongThueDto);
            if (!created)
                return BadRequest();
            return Ok();
        }

        [HttpPut("UpdateHopDongThue")]
        public async Task<ActionResult> UpdateHopDongThue(HopDongThueDto hopDongThueDto)
        {
            var updated = await _hopDongThueRepository.UpdateHopDongThueAsync(hopDongThueDto);
            if (!updated)
                return BadRequest();
            return Ok();
        }

        [HttpDelete("DeleteHopDongThue/{id}")]
        public async Task<ActionResult> DeleteHopDongThue(int id)
        {
            var deleted = await _hopDongThueRepository.DeleteHopDongThueAsync(id);
            if (!deleted)
                return BadRequest();
            return Ok();
        }
    }
}
