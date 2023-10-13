using UnderPantsApp.Entity;
using UnderPantsApp.DbContexts;
using UnderPantsApp.Repository;
using Microsoft.EntityFrameworkCore;

namespace UnderPantsApp.Services
{
    public class SavingsGoalService : ISavingsGoalRepository
    {
        private readonly UnderPantsContext _context;

        public SavingsGoalService(UnderPantsContext context) 
        {
            _context = context ?? throw new ArgumentNullException(nameof(context));
        }

        public async Task DeleteIncomeAsync(SavingsGoal savingsGoal)
        {
            _context.SavingsGoals.Remove(savingsGoal);
            await SaveChangesAsync();
        }

        public async Task<SavingsGoal?> GetSavingsGoalAsync(int savingsGoalId)
        {
            return await _context.SavingsGoals.Where(s => s.Id.Equals(savingsGoalId))
                                              .FirstOrDefaultAsync();
        }

        public async Task RegisterSavingsGoalAsync(SavingsGoal savingsGoal)
        {
            _context.SavingsGoals.Add(savingsGoal);
            await SaveChangesAsync();
        }

        public async Task<bool> SaveChangesAsync()
        {
            return (await _context.SaveChangesAsync() >= 0);
        }
    }
}
