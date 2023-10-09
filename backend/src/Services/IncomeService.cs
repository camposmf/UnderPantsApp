using Microsoft.EntityFrameworkCore;
using UnderPantsApp.DbContexts;
using UnderPantsApp.Entity;
using UnderPantsApp.Repository;

namespace UnderPantsApp.Services
{
    public class IncomeService : IIncomeRepository
    {
        private readonly UnderPantsContext _context;

        public IncomeService(UnderPantsContext context) 
        {
            _context = context ?? throw new ArgumentNullException(nameof(context));
        }

        public async Task DeleteIncomeAsync(Income income)
        {
            _context.Incomes.Remove(income);
            await _context.SaveChangesAsync();
        }

        public async Task<Income?> GetIncomeAsync(int incomeId)
        {
            return await _context.Incomes.Where(i => i.Id.Equals(incomeId))
                                         .FirstOrDefaultAsync();
        }

        public async Task RegisterIncomeAsync(Income income)
        {
            _context.Incomes.Add(income);
            await SaveChangesAsync();
        }

        public async Task<bool> SaveChangesAsync()
        {
            return (await _context.SaveChangesAsync() >= 0);
        }
    }
}
