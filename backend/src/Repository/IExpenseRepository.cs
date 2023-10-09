using UnderPantsApp.Entity;

namespace UnderPantsApp.Repository
{
    public interface IExpenseRepository
    {
        Task<bool> SaveChangesAsync();
        Task DeleteUserAsync(Expense expense);
        Task<Expense?> GetExpenseAsync(int expenseId);
        Task RegisterExpenseAsync(Expense expense);
    }
}