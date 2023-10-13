using UnderPantsApp.Entity;
using UnderPantsApp.DbContexts;
using UnderPantsApp.Repository;
using Microsoft.EntityFrameworkCore;

namespace UnderPantsApp.Services
{
    public class AccountService : IAccountRepository
    {
        private readonly UnderPantsContext _context;

        public AccountService(UnderPantsContext context) 
        {
            _context = context ?? throw new ArgumentNullException(nameof(context));
        }

        public async Task DeleteChangesAsync(Account account)
        {
            _context.Accounts.Remove(account);
            await SaveChangesAsync();
        }

        public async Task<Account?> GetAccountAsync(int accountId)
        {
            return await _context.Accounts.Where(a => a.Id.Equals(accountId))
                                          .FirstOrDefaultAsync();
        }

        public async Task RegisterAccountAsync(Account account)
        {
            _context.Accounts.Add(account);
            await SaveChangesAsync();
        }

        public async Task<bool> SaveChangesAsync()
        {
            return (await _context.SaveChangesAsync() >= 0);
        }
    }
}
