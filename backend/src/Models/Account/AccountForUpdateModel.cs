using System.ComponentModel.DataAnnotations;

namespace UnderPantsApp.Models.Account
{
    public class AccountForUpdateModel
    {
        [Required(ErrorMessage = "Você deve fornecer uma data para sua conta.")]
        public DateTime Date { get; set; }

        [Required(ErrorMessage = "Você deve fornecer um valor para o saldo da conta.")]
        public double Amount { get; set; }

        [MaxLength(255)]
        [Required(ErrorMessage = "Você deve fornecer o nome da conta.")]
        public string Description { get; set; } = string.Empty;
    }
}
