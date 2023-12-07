using UnderPantsApp.Entity;

namespace UnderPantsApp.Repository
{
    public interface IUserRepository
    {
        Task<bool> SaveChangesAsync();
        Task CreateUserAsync(User user);
        Task<User?> GetUserAsync(int userId);
        Task<User?> GetUserByCpf(string cpf);
        Task<User?> GetLoginAsync(string email, string password);
    }
}