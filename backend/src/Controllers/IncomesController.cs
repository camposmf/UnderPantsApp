using AutoMapper;
using Microsoft.AspNetCore.Http;
using Microsoft.AspNetCore.Mvc;
using UnderPantsApp.Entity;
using UnderPantsApp.Models.Income;
using UnderPantsApp.Models.User;
using UnderPantsApp.Repository;

namespace UnderPantsApp.Controllers
{
    [ApiController]
    [Route("incomes")]
    public class IncomesController : ControllerBase
    {
        private readonly IMapper _mapper;
        private readonly IIncomeRepository _incomeRepository;

        public IncomesController(IIncomeRepository incomeRepository, IMapper mapper)
        {
            _mapper = mapper ?? throw new ArgumentNullException(nameof(mapper));
            _incomeRepository = incomeRepository ?? throw new ArgumentNullException(nameof(incomeRepository));
        }

        [HttpGet]
        public async Task<ActionResult<IEnumerable<Income>>> GetIncomes()
        {
            var incomeEntity = await _incomeRepository.GetIncomesAsync();

            if(!incomeEntity.Any())
                return NotFound("Não há nenhuma renda cadastrada.");

            return Ok(_mapper.Map<IEnumerable<IncomeModel>>(incomeEntity));
        }

        [HttpPost]
        [ProducesResponseType(StatusCodes.Status201Created)]
        public async Task<IActionResult> RegisterIncome(IncomeForCreationModel income)
        {
            var incomeResult = _mapper.Map<Income>(income);
            await _incomeRepository.RegisterIncomeAsync(incomeResult);

            var incomeToReturn = _mapper.Map<IncomeModel>(incomeResult);
            return Ok(incomeToReturn);
        }

        [HttpPut("{incomeId}")]
        [ProducesResponseType(StatusCodes.Status200OK)]
        [ProducesResponseType(StatusCodes.Status404NotFound)]
        public async Task<IActionResult> UpdateIncome(IncomeForUpdateModel income, int incomeId) 
        {
            var incomeEntity = await _incomeRepository.GetIncomeAsync(incomeId);

            if (incomeEntity == null)
                return NotFound("Renda não encontrada no sistema.");

            _mapper.Map(income, incomeEntity);
            await _incomeRepository.SaveChangesAsync();

            return NoContent();
        }

        [HttpDelete("{incomeId}")]
        [ProducesResponseType(StatusCodes.Status200OK)]
        [ProducesResponseType(StatusCodes.Status404NotFound)]
        public async Task<IActionResult> DeleteIncome(int incomeId)
        {
            var incomeEntity = await _incomeRepository.GetIncomeAsync(incomeId);

            if (incomeEntity == null)
                return NotFound("Renda não encontrada no sistema.");

            await _incomeRepository.DeleteIncomeAsync(incomeEntity);
            return NoContent();
        }

    }
}