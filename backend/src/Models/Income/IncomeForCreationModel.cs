using System.ComponentModel.DataAnnotations;

namespace UnderPantsApp.Models.Income
{
    public class IncomeForCreationModel
    {
        [Required(ErrorMessage = "Você deve fornecer uma data para sua renda.")]
        public DateTime Date { get; set; }

        [Required(ErrorMessage = "Você deve fornecer um valor para sua renda.")]
        public double Amount { get; set; }

        [MaxLength(255)]
        [Required(ErrorMessage = "Você deve fornecer uma descrição para sua renda.")]
        public string Description { get; set; } = string.Empty;
    }
}