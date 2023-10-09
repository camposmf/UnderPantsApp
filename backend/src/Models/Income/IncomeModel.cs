using UnderPantsApp.Models.FinancialHistory;

namespace UnderPantsApp.Models.Income
{
    public class IncomeModel
    {
        public int Id { get; set; }
        public double Amount { get; set; }
        public DateTime Date { get; set; }
        public string Description { get; set; } = string.Empty;
    }
}