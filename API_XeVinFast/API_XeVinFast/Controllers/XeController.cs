using API_XeVinFast.DTO;
using API_XeVinFast.Interfaces;
using Microsoft.AspNetCore.Mvc;
using System.Collections.Generic;
using System.Threading.Tasks;

namespace API_XeVinFast.Controllers
{
    [Route("api/[controller]")]
    [ApiController]
    public class XeController : ControllerBase
    {
        private readonly IXeRepository _xeRepository;

        public XeController(IXeRepository xeRepository)
        {
            _xeRepository = xeRepository;
        }

        [HttpGet("GetAllXe")]
        public async Task<ActionResult<IEnumerable<XeDto>>> GetAllXe()
        {
            var xes = await _xeRepository.GetAllXeAsync();
            return Ok(xes);
        }

        [HttpGet("GetById/{id}")]
        public async Task<ActionResult<XeDto>> GetXeById(int id)
        {
            var xe = await _xeRepository.GetXeByIdAsync(id);
            if (xe == null)
                return NotFound();
            return Ok(xe);
        }

        [HttpPost("CreateXe")]
        public async Task<ActionResult> CreateXe(XeDto xeDto)
        {
            var created = await _xeRepository.CreateXeAsync(xeDto);
            if (!created)
                return BadRequest();
            return Ok();
        }


        [HttpPut("UpdateXe")]
        public async Task<ActionResult> UpdateXe(XeDto xeDto)
        {
            var updated = await _xeRepository.UpdateXeAsync(xeDto);
            if (!updated)
                return BadRequest();
            return Ok();
        }

        [HttpDelete("DeleteXe/{id}")]
        public async Task<ActionResult> DeleteXe(int id)
        {
            var deleted = await _xeRepository.DeleteXeAsync(id);
            if (!deleted)
                return BadRequest();
            return Ok();
        }

        [HttpGet("TimKiemXe")]
        public async Task<ActionResult<IEnumerable<XeDto>>> TimKiemXe(string bienSo = null, int? maChiTietXe = null, string trangThaiXe = null, int? maBaoHiem = null)
        {
            var xeList = await _xeRepository.TimKiemXeAsync(bienSo, maChiTietXe, trangThaiXe, maBaoHiem);
            return Ok(xeList);
        }

    }
}
