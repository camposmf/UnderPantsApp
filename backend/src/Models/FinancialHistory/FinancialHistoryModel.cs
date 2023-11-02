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
        public UserModel Users { get; set; } = new UserModel();
        public ICollection<IncomeModel> Incomes { get; set; } = new List<IncomeModel>();
        public ICollection<AccountModel> Accounts { get; set; } = new List<AccountModel>();
        public ICollection<ExpenseModel> Expenses { get; set; } = new List<ExpenseModel>();
        public ICollection<SavingsGoalModel> SavingsGoal { get; set; } = new List<SavingsGoalModel>();
    }
}