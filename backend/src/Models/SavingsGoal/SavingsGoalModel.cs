namespace UnderPantsApp.Models.SavingsGoal
{
    public class SavingsGoalModel
    {
        public int Id { get; set; }
        public DateTime Date { get; set; }
        public double GoalAmount { get; set; }
        public string Description { get; set; } = string.Empty;
    }
}