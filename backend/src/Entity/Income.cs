using System.ComponentModel.DataAnnotations;
using System.ComponentModel.DataAnnotations.Schema;

namespace UnderPantsApp.Entity
{
    public class Income
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
        public double Amount { get; set; }

        [Required]
        public DateTime Date { get; set; }
    }
}
