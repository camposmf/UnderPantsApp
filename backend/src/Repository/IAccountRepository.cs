using UnderPantsApp.Entity;

namespace UnderPantsApp.Repository
{
    public interface IAccountRepository
    {
        Task<bool> SaveChangesAsync();
        Task DeleteChangesAsync(Account account);
        Task<Account?> GetAccountAsync(int accountId);
        Task RegisterAccountAsync(Account account);
    }
}
