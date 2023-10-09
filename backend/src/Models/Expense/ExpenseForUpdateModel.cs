using System.ComponentModel.DataAnnotations;

namespace UnderPantsApp.Models.Expense
{
    public class ExpenseForUpdateModel
    {
        [Required(ErrorMessage = "Você deve fornecer uma data para sua despsa.")]
        public DateTime Date { get; set; }

        [Required(ErrorMessage = "Você deve fornecer um valor para sua despesa.")]
        public double Amount { get; set; }

        [MaxLength(255)]
        [Required(ErrorMessage = "Você deve fornecer uma descrição para sua despesa.")]
        public string Description { get; set; } = string.Empty;
    }
}