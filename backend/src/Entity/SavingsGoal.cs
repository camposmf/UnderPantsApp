using System.ComponentModel.DataAnnotations;
using System.ComponentModel.DataAnnotations.Schema;

namespace UnderPantsApp.Entity
{
    public class SavingsGoal
    {
        [Key]
        [DatabaseGenerated(DatabaseGeneratedOption.Identity)]
        public int Id { get; set; }

        [ForeignKey("HistoryId")]
        public FinancialHistory? History { get; set; }
        public int HistoryId { get; set; }

        [Required]
        [MaxLength(255)]
        public string Description { get; set; } = string.Empty;

        [Required]
        public double GoalAmount { get; set; }

        [Required]
        public DateTime CompletionDate { get; set; }
    }
}
