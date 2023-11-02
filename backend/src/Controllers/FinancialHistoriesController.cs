using AutoMapper;
using Microsoft.AspNetCore.Http;
using Microsoft.AspNetCore.Mvc;
using Microsoft.EntityFrameworkCore;
using UnderPantsApp.Entity;
using UnderPantsApp.Models.FinancialHistory;
using UnderPantsApp.Repository;

namespace UnderPantsApp.Controllers
{
    [ApiController]
    [Route("financial-histories")]
    public class FinancialHistoriesController : ControllerBase
    {
        private readonly IMapper _mapper;
        private readonly IFinancialHistoryRepository _financialHistoryRepository;

        public FinancialHistoriesController(IFinancialHistoryRepository financialHistoryRepository, IMapper mapper)
        {
            _financialHistoryRepository = financialHistoryRepository ?? throw new ArgumentNullException(nameof(financialHistoryRepository));
            _mapper = mapper ?? throw new ArgumentNullException(nameof(mapper));
        }

        [HttpPost]
        [ProducesResponseType(StatusCodes.Status201Created)]
        [ProducesResponseType(StatusCodes.Status404NotFound)]
        [ProducesResponseType(StatusCodes.Status400BadRequest)]
        public async Task<ActionResult<FinancialHistoryModel>> RegisterFinancialHistory(FinancialHistoryModel financialHistoryModel)
        {
            try
            {
                bool financialHistoryExists = await _financialHistoryRepository.FinancialHistoryExistsAsync();

                if (financialHistoryExists == false)
                    return NotFound();

                var finalFinancialHistory = _mapper.Map<FinancialHistory>(financialHistoryModel);
                await _financialHistoryRepository.RegisterFinancialHistoryAsync(finalFinancialHistory);

                var createdFinancialHistoryToReturn = _mapper.Map<FinancialHistoryModel>(finalFinancialHistory);

                return CreatedAtRoute(
                    "GetFinancialHistory",
                    new
                    {
                        financialHistoryModelId = createdFinancialHistoryToReturn.Id,
                    },
                    createdFinancialHistoryToReturn
                );
            }
            catch (ArgumentException ex)
            {
                return NotFound(ex.Message);
            }
            catch(Exception ex)
            {
                return BadRequest(ex.Message);
            }
        }

        [HttpGet]
        [ProducesResponseType(StatusCodes.Status200OK)]
        [ProducesResponseType(StatusCodes.Status404NotFound)]
        [ProducesResponseType(StatusCodes.Status400BadRequest)]
        public async Task<ActionResult<IEnumerable<FinancialHistoryModel>>> GetFinancialHistories()
        {
            try
            {
                bool financialHistoryExists = await _financialHistoryRepository.FinancialHistoryExistsAsync();

                if (financialHistoryExists == false)
                    return NotFound();
                
                var financialHistoryEntity = await _financialHistoryRepository.GetFinancialHistoriesAsync();

                return Ok(_mapper.Map<IEnumerable<FinancialHistoryModel>>(financialHistoryEntity));
            }
            catch (Exception ex)
            {
                return BadRequest(ex.Message);
            }
        }

        [HttpGet("{financialHistoryId}")]
        [ProducesResponseType(StatusCodes.Status200OK)]
        [ProducesResponseType(StatusCodes.Status404NotFound)]
        [ProducesResponseType(StatusCodes.Status400BadRequest)]
        public async Task<ActionResult<FinancialHistoryModel>> GetFinancialHistoryId(int financialHistoryId)
        {
            try
            {
                bool financialHistoryExists = await _financialHistoryRepository.FinancialHistoryExistsAsync();

                if (financialHistoryExists == false)
                    return NotFound();

                var financialEntity = await _financialHistoryRepository.GetFinancialHistoryAsync(financialHistoryId);

                if (financialEntity == null)
                    return NotFound("Histórico não encontrado no sistema.");

                return Ok(_mapper.Map<FinancialHistoryModel>(financialEntity));
            }
            catch (Exception ex)
            {
                return BadRequest(ex.Message);
            }
        }

    }
}