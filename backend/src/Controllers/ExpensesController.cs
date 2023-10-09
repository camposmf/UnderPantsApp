using AutoMapper;
using Microsoft.AspNetCore.Http;
using Microsoft.AspNetCore.Mvc;
using UnderPantsApp.Entity;
using UnderPantsApp.Models.Expense;
using UnderPantsApp.Repository;

namespace UnderPantsApp.Controllers
{
    [ApiController]
    [Route("expenses")]
    public class ExpensesController : ControllerBase
    {
        private readonly IMapper _mapper;
        private readonly IExpenseRepository _expenseRepository;

        public ExpensesController(IExpenseRepository expenseRepository, IMapper mapper)
        {
            _mapper = mapper ?? throw new ArgumentNullException(nameof(mapper));
            _expenseRepository = expenseRepository ?? throw new ArgumentNullException(nameof(expenseRepository));
        }

        [HttpPost]
        [ProducesResponseType(StatusCodes.Status201Created)]
        public async Task<IActionResult> RegisterExpense(ExpenseForCreationModel expense)
        {
            var expenseResult = _mapper.Map<Expense>(expense);
            await _expenseRepository.RegisterExpenseAsync(expenseResult);

            var expenseToReturn = _mapper.Map<ExpenseModel>(expenseResult);
            return Ok(expenseToReturn);
        }

        [HttpPut("{expenseId}")]
        [ProducesResponseType(StatusCodes.Status200OK)]
        [ProducesResponseType(StatusCodes.Status404NotFound)]
        public async Task<IActionResult> UpdateExpense(ExpenseForUpdateModel expense, int expenseId)
        {
            var expenseEntity = await _expenseRepository.GetExpenseAsync(expenseId);

            if(expenseEntity == null)
                return NotFound("Despesa não encontrada no sistema.");

            _mapper.Map(expense, expenseEntity);
            await _expenseRepository.SaveChangesAsync();

            return NoContent();
        }

        [HttpDelete("{expenseId}")]
        [ProducesResponseType(StatusCodes.Status200OK)]
        [ProducesResponseType(StatusCodes.Status404NotFound)]
        public async Task<IActionResult> DeleteExpense(int expenseId)
        {
            var expenseEntity = await _expenseRepository.GetExpenseAsync(expenseId);

            if (expenseEntity == null)
                return NotFound("Despesa não encontrada no sistema.");

            await _expenseRepository.DeleteExpenseAsync(expenseEntity);
            return NoContent();
        }
    }
}