using Microsoft.EntityFrameworkCore;
using System.ComponentModel.DataAnnotations;

namespace UnderPantsApp.Models.User
{
    public class UserForCreationModel
    {
        [MaxLength(30)]
        [Required(ErrorMessage = "Você deve fornecer um valor para o login do usuário.")]
        public string Login { get; set; } = string.Empty;

        [MaxLength(20)]
        [Required(ErrorMessage = "Você deve fornecer um valor para a senha do usuário.")]
        public string Password { get; set; } = string.Empty;

        [MaxLength(100)]
        [Required(ErrorMessage = "Você deve fornecer um nome para o usuário.")]
        public string Name { get; set; } = string.Empty;

        [MaxLength(100)]
        [Required(ErrorMessage = "Você deve fornecer um email para o usuário.")]
        public string Email { get; set; } = string.Empty;
    }
}
