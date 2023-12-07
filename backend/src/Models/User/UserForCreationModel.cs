using System.ComponentModel.DataAnnotations;

namespace UnderPantsApp.Models.User
{
    public class UserForCreationModel
    {
        [Required(ErrorMessage = "Você deve fornecer a data de nascimento do usuário.")]
        public DateTime BornDate { get; set; }

        [MaxLength(100)]
        [Required(ErrorMessage = "Você deve fornecer um nome para o usuário.")]
        public string Name { get; set; } = string.Empty;

        [MaxLength(100)]
        [Required(ErrorMessage = "Você deve fornecer um valor para o email do usuário.")]
        public string Email { get; set; } = string.Empty;

        [MaxLength(20)]
        [Required(ErrorMessage = "Você deve fornecer um valor para a senha do usuário.")]
        public string Password { get; set; } = string.Empty;

        [MaxLength(100)]
        [Required(ErrorMessage = "Você deve fornecer o número do cpf do usuário.")]
        public string CpfNumber { get; set; } = string.Empty;
    }
}