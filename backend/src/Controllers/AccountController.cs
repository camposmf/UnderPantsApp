using AutoMapper;
using Microsoft.AspNetCore.Http;
using Microsoft.AspNetCore.Mvc;
using UnderPantsApp.Entity;
using UnderPantsApp.Models.Account;
using UnderPantsApp.Repository;

namespace UnderPantsApp.Controllers
{
    [ApiController]
    [Route("accounts")]
    public class AccountController : ControllerBase
    {
        private readonly IMapper _mapper;
        private readonly IAccountRepository _accountRepository;

        public AccountController(IAccountRepository accountRepository, IMapper mapper) 
        {
            _mapper = mapper ?? throw new ArgumentNullException(nameof(mapper));
            _accountRepository = accountRepository ?? throw new ArgumentNullException(nameof(accountRepository));
        }

        [HttpPost]
        [ProducesResponseType(StatusCodes.Status201Created)]
        public async Task<IActionResult> RegisterAccount(AccountForCreationModel account)
        {
            var accountResult = _mapper.Map<Account>(account);
            await _accountRepository.RegisterAccountAsync(accountResult);

            var accountToReturn = _mapper.Map<AccountModel>(accountResult);
            return Ok(accountToReturn);  
        }

        [HttpPut("{accountId}")]
        [ProducesResponseType(StatusCodes.Status200OK)]
        [ProducesResponseType(StatusCodes.Status404NotFound)]
        public async Task<IActionResult> UpdateAccount(AccountForUpdateModel account, int accountId)
        {
            var accountEntity = await _accountRepository.GetAccountAsync(accountId);

            if (accountEntity == null)
                return NotFound("Conta não encontrada no sistema.");

            _mapper.Map(account, accountEntity);
            await _accountRepository.SaveChangesAsync();

            return NoContent();
        }

        [HttpDelete("{accountId}")]
        [ProducesResponseType(StatusCodes.Status200OK)]
        [ProducesResponseType(StatusCodes.Status404NotFound)]
        public async Task<IActionResult> DeleteAccount(int accountId)
        {
            var accountEntity = await _accountRepository.GetAccountAsync(accountId);

            if (accountEntity == null)
                return NotFound("Conta não encontrada no sistema.");

            await _accountRepository.DeleteChangesAsync(accountEntity);
            return NoContent();
        }

    }
}
