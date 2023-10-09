using UnderPantsApp.Models.User;
using UnderPantsApp.Models.Income;
using UnderPantsApp.Models.Account;
using UnderPantsApp.Models.Expense;
using UnderPantsApp.Models.SavingsGoal;

namespace UnderPantsApp.Models.FinancialHistory
{
    public class FinancialHistoryModel
    {
        public int Id { get; set; }
        public UserModel UserId { get; set; } = new UserModel();
        public IncomeModel Income { get; set; } = new IncomeModel();
        public AccountModel account { get; set; } = new AccountModel();
        public ExpenseModel Expense { get; set; } = new ExpenseModel();
        public SavingsGoalModel SavingsGoal { get; set; } = new SavingsGoalModel();
    }
}