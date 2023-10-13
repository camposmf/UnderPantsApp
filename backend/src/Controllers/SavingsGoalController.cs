using AutoMapper;
using Microsoft.AspNetCore.Http;
using Microsoft.AspNetCore.Mvc;
using UnderPantsApp.Entity;
using UnderPantsApp.Models.SavingsGoal;
using UnderPantsApp.Repository;

namespace UnderPantsApp.Controllers
{
    [ApiController]
    [Route("savings-goal")]
    public class SavingsGoalController : ControllerBase
    {
        private readonly IMapper _mapper;
        private readonly ISavingsGoalRepository _savingsGoalRepository;

        public SavingsGoalController(ISavingsGoalRepository savingsGoalRepository, IMapper mapper)
        {
            _mapper = mapper ?? throw new ArgumentNullException(nameof(mapper));
            _savingsGoalRepository = savingsGoalRepository ?? throw new ArgumentNullException(nameof(savingsGoalRepository));
        }

        [HttpPost]
        [ProducesResponseType(StatusCodes.Status201Created)]
        public async Task<IActionResult> RegisterSavingGoal(SavingsGoalForCreationModel savingsGoal)
        {
            var savingGoalResult = _mapper.Map<SavingsGoal>(savingsGoal);
            await _savingsGoalRepository.RegisterSavingsGoalAsync(savingGoalResult);

            var savingsGoalToReturn = _mapper.Map<SavingsGoalModel>(savingGoalResult);
            return Ok(savingsGoalToReturn);
        }

        [HttpPut("{savingGoalId}")]
        public async Task<IActionResult> UpdateSavingGoal(SavingsGoalForUpdateModel savingGoal, int savingGoalId)
        {
            var savingGoalEntity = await _savingsGoalRepository.GetSavingsGoalAsync(savingGoalId);

            if (savingGoalEntity == null)
                return NotFound("Metas não encontrada no sistema.");

            _mapper.Map(savingGoal, savingGoalEntity);
            await _savingsGoalRepository.SaveChangesAsync();

            return NoContent();
        }

        [HttpDelete("{savingGoalId}")]
        public async Task<IActionResult> DeleteSavingGoal(int savingGoalId)
        {
            var savingGoalEntity = await _savingsGoalRepository.GetSavingsGoalAsync(savingGoalId);

            if (savingGoalEntity == null)
                return NotFound("Metas não encontrada no sistema.");

            await _savingsGoalRepository.DeleteIncomeAsync(savingGoalEntity);
            return NoContent();
        }
    }
}