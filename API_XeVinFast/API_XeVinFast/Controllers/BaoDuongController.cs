using API_XeVinFast.DTO;
using API_XeVinFast.Interfaces;
using API_XeVinFast.Repository;
using Microsoft.AspNetCore.Mvc;
using System;
using System.Collections.Generic;
using System.Threading.Tasks;

namespace API_XeVinFast.Controllers
{
    [Route("api/[controller]")]
    [ApiController]
    public class BaoDuongController : ControllerBase
    {
        private readonly IBaoDuongRepository _baoDuongRepository;

        public BaoDuongController(IBaoDuongRepository baoDuongRepository)
        {
            _baoDuongRepository = baoDuongRepository;
        }

        [HttpGet("GetAllBaoDuong")]
        public async Task<ActionResult<IEnumerable<BaoDuongDto>>> GetAllBaoDuong()
        {
            var baoDuongs = await _baoDuongRepository.GetAllBaoDuongAsync();
            return Ok(baoDuongs);
        }

        [HttpGet("GetByID/{id}")]
        public async Task<ActionResult<BaoDuongDto>> GetBaoDuongById(int id)
        {
            var baoDuong = await _baoDuongRepository.GetBaoDuongByIdAsync(id);
            if (baoDuong == null)
                return NotFound();
            return Ok(baoDuong);
        }

        [HttpPost("CreateBaoDuong")]
        public async Task<ActionResult> CreateBaoDuong(BaoDuongDto baoDuongDto)
        {
            var created = await _baoDuongRepository.CreateBaoDuongAsync(baoDuongDto);
            if (!created)
                return BadRequest();
            return Ok();
        }

        [HttpPut("UpdateBaoDuong")]
        public async Task<ActionResult> UpdateBaoDuong(BaoDuongDto baoDuongDto)
        {
            var updated = await _baoDuongRepository.UpdateBaoDuongAsync(baoDuongDto);
            if (!updated)
                return BadRequest();
            return Ok();
        }

        [HttpDelete("DeleteBaoDuong/{id}")]
        public async Task<ActionResult> DeleteBaoDuong(int id)
        {
            var deleted = await _baoDuongRepository.DeleteBaoDuongAsync(id);
            if (!deleted)
                return BadRequest();
            return Ok();
        }

        //[HttpGet("TimKiemBaoDuong")]
        //public async Task<ActionResult<IEnumerable<BaoDuongDto>>> TimKiemBaoDuong(DateTime? ngayBaoDuong = null, decimal? chiPhi = null)
        //{
        //    var baoDuongs = await _baoDuongRepository.TimKiemBaoDuongAsync(ngayBaoDuong, chiPhi);
        //    return Ok(baoDuongs);
        //}
    }
}
