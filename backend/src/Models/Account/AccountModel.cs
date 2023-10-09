using UnderPantsApp.Models.FinancialHistory;

namespace UnderPantsApp.Models.Account
{
    public class AccountModel
    {
        public int Id { get; set; }
        public double Balance { get; set; }
        public string AccountName { get; set; } = string.Empty;
    }
}
