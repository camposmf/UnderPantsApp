using Microsoft.EntityFrameworkCore;
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

        [MaxLength(30)]
        [Required(ErrorMessage = "Você deve fornecer um valor para o login do usuário.")]
        public string Login { get; set; } = string.Empty;

        [MaxLength(20)]
        [Required(ErrorMessage = "Você deve fornecer um valor para a senha do usuário.")]
        public string Password { get; set; } = string.Empty;
    }
}
