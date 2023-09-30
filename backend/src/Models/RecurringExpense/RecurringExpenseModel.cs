using UnderPantsApp.Models.FinancialHistory;

namespace UnderPantsApp.Models.RecurringExpense
{
    public class RecurringExpenseModel
    {
        public int Id { get; set; }
        public FinancialHistoryModel HistoryId { get; set; } = new FinancialHistoryModel();
        public string Description { get; set; } = string.Empty;
        public double Amount { get; set; }
        public string RecurrenceFrequency { get; set; } = string.Empty;
    }
}
