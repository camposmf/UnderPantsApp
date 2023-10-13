using UnderPantsApp.Entity;

namespace UnderPantsApp.Repository
{
    public interface ISavingsGoalRepository
    {
        Task<bool> SaveChangesAsync();
        Task DeleteIncomeAsync(SavingsGoal savingsGoal);
        Task<SavingsGoal?> GetSavingsGoalAsync(int savingsGoalId);
        Task RegisterSavingsGoalAsync(SavingsGoal savingsGoal);

    }
}
