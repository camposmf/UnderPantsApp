namespace UnderPantsApp.Models.User
{
    public class UserModel
    {
        public int Id { get; set; }
        public DateTime BornDate { get; set; }
        public string Name { get; set; } = string.Empty;
        public string Email { get; set; } = string.Empty;
        public string Password { get; set; } = string.Empty;
        public string CpfNumber { get; set; } = string.Empty;
    }
}