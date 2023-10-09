using UnderPantsApp.Entity;

namespace UnderPantsApp.Repository
{
    public interface IUserRepository
    {
        Task<bool> SaveChangesAsync();
        Task CreateUserAsync(User user);
        void DeleteUserAsync(User user);
        Task<User> GetUserAsync(int userId);
        Task<IEnumerable<User>> GetUsersAsync();
        Task<User> GetLoginAsync(string login, string password);
    }
}