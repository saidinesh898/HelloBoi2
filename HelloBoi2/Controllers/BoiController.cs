using System;
using System.Collections.Generic;
using System.Linq;
using System.Threading.Tasks;
using Microsoft.AspNetCore.Http;
using Microsoft.AspNetCore.Mvc;

namespace HelloBoi2.Controllers
{
    [Route("api/[controller]")]
    [ApiController]
    public class BoiController : ControllerBase
    {

        [HttpGet]
        public IActionResult GetData()
        {
            return Ok("Hello BOI");
        }
    }
}