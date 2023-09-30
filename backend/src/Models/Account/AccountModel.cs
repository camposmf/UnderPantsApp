using UnderPantsApp.Models.FinancialHistory;

namespace UnderPantsApp.Models.Account
{
    public class AccountModel
    {
        public int Id { get; set; }
        public FinancialHistoryModel HistoryId { get; set; } = new FinancialHistoryModel();
        public string AccountName { get; set; } = string.Empty;
        public double Balance { get; set; }
    }
}
