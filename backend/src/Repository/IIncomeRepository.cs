using UnderPantsApp.Entity;

namespace UnderPantsApp.Repository
{
    public interface IIncomeRepository
    {
        Task<bool> SaveChangesAsync();
        Task DeleteIncomeAsync(Income income);
        Task<Income?> GetIncomeAsync(int incomeId);
        Task RegisterIncomeAsync(Income income);
    }
}