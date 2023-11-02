using Microsoft.EntityFrameworkCore;
using UnderPantsApp.DbContexts;
using UnderPantsApp.Entity;
using UnderPantsApp.Repository;

namespace UnderPantsApp.Services
{
    public class FinancialHistoryService : IFinancialHistoryRepository
    {
        private readonly UnderPantsContext _context;

        public FinancialHistoryService(UnderPantsContext context)
        {
            _context = context ?? throw new ArgumentNullException(nameof(context));
        }

        public async Task<bool> SaveChangesAsync()
        {
            return (await _context.SaveChangesAsync() >= 0);
        }

        public async Task<bool> FinancialHistoryExistsAsync()
        {
            return await _context.FinancialHistories.Include(fh => fh.Account)
                                                    .Include(fh => fh.Expense)
                                                    .Include(fh => fh.Income)
                                                    .Include(fh => fh.SavingsGoal)
                                                    .Include(fh => fh.User)
                                                    .AnyAsync();
        }

        public async Task<IEnumerable<FinancialHistory>> GetFinancialHistoriesAsync()
        {
            return await _context.FinancialHistories
                                 .ToListAsync();
        }

        public async Task<FinancialHistory?> GetFinancialHistoryAsync(int financialHistoryId)
        {
            return await _context.FinancialHistories
                                 .Where(f => f.Id.Equals(financialHistoryId))
                                 .FirstOrDefaultAsync();
        }

        public async Task RegisterFinancialHistoryAsync(FinancialHistory financialHistory)
        {
            _context.FinancialHistories.Add(financialHistory);
            await SaveChangesAsync();
        }
    }
}