using UnderPantsApp.Models.FinancialHistory;

namespace UnderPantsApp.Models.SavingsGoal
{
    public class SavingsGoalModel
    {
        public int Id { get; set; }
        public FinancialHistoryModel HistoryId { get; set; } = new FinancialHistoryModel();
        public string Description { get; set; } = string.Empty;
        public double GoalAmount { get; set; }
        public DateTime Date { get; set; }
    }
}
