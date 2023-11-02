using UnderPantsApp.Entity;

namespace UnderPantsApp.Repository
{
    public interface IFinancialHistoryRepository
    {
        Task<bool> SaveChangesAsync();
        Task<bool> FinancialHistoryExistsAsync();
        Task RegisterFinancialHistoryAsync(FinancialHistory financialHistory);
        Task<FinancialHistory?> GetFinancialHistoryAsync(int financialHistoryId);
        Task<IEnumerable<FinancialHistory>> GetFinancialHistoriesAsync();
    }
}