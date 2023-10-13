using System.ComponentModel.DataAnnotations;

namespace UnderPantsApp.Models.SavingsGoal
{
    public class SavingsGoalForCreationModel
    {
        [Required(ErrorMessage = "Você deve fornecer um valor para sua meta.")]
        public double GoalAmount { get; set; }

        [Required(ErrorMessage = "Você deve fornecer uma data para sua meta.")]
        public DateTime CompletionDate { get; set; }

        [MaxLength(255)]
        [Required(ErrorMessage = "Você deve fornecer uma descrição para sua meta.")]
        public string Description { get; set; } = string.Empty;
    }
}
