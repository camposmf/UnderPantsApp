using Microsoft.EntityFrameworkCore;
using UnderPantsApp.DbContexts;
using UnderPantsApp.Entity;
using UnderPantsApp.Repository;

namespace UnderPantsApp.Services
{
    public class ExpenseService : IExpenseRepository
    {
        private readonly UnderPantsContext _context;

        public ExpenseService(UnderPantsContext context)
        {
            _context = context ?? throw new ArgumentNullException(nameof(context));
        }

        public async Task DeleteUserAsync(Expense expense)
        {
            _context.Expenses.Remove(expense);
            await SaveChangesAsync();

        }

        public async Task<Expense?> GetExpenseAsync(int expenseId)
        {
            return await _context.Expenses.Where(e => e.Id.Equals(expenseId))
                                          .FirstOrDefaultAsync();
        }

        public async Task RegisterExpenseAsync(Expense expense)
        {
            _context.Expenses.Add(expense);
            await SaveChangesAsync();
        }

        public async Task<bool> SaveChangesAsync()
        {
            return (await _context.SaveChangesAsync() >= 0);
        }
    }
}