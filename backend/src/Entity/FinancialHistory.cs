using System.ComponentModel.DataAnnotations;
using System.ComponentModel.DataAnnotations.Schema;

namespace UnderPantsApp.Entity
{
    public class FinancialHistory
    {
        [Key]
        [DatabaseGenerated(DatabaseGeneratedOption.Identity)]
        public int Id { get; set; }

        [ForeignKey("UserId")]
        public User? User { get; set; }
        public int UserId { get; set; }

        [ForeignKey("ExpenseId")]
        public Expense? Expense { get; set; }
        public int ExpenseId { get; set; }

        [ForeignKey("IncomeId")]
        public Income? Income { get; set; }
        public int IncomeId { get; set; }

        [ForeignKey("AccountId")]
        public Account? Account { get; set; }
        public int AccountId { get; set; }

        [ForeignKey("SavingsGoalId")]
        public SavingsGoal? SavingsGoal { get; set; }
        public int SavingsGoalId { get; set; }
    }
}