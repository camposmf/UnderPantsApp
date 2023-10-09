namespace UnderPantsApp.Models.Expense
{
    public class ExpenseModel
    {
        public int Id { get; set; }
        public DateTime Date { get; set; }
        public double Amount { get; set; }
        public string Description { get; set; } = string.Empty;
    }
}