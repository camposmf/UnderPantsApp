using System.ComponentModel.DataAnnotations;
using System.ComponentModel.DataAnnotations.Schema;

namespace UnderPantsApp.Entity
{
    public class Income
    {
        [Key]
        [DatabaseGenerated(DatabaseGeneratedOption.Identity)]
        public int Id { get; set; }

        [Required]
        public DateTime Date { get; set; }

        [Required]
        public double Amount { get; set; }

        [Required]
        [MaxLength(255)]
        public string Description { get; set; } = string.Empty;
    }
}