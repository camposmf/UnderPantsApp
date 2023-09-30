using UnderPantsApp.Models.User;

namespace UnderPantsApp.Models.FinancialHistory
{
    public class FinancialHistoryModel
    {
        public int Id { get; set; }
        public UserModel UserId { get; set; } = new UserModel();
    }
}
