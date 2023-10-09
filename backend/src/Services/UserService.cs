using AutoMapper;
using Microsoft.EntityFrameworkCore;
using UnderPantsApp.DbContexts;
using UnderPantsApp.Entity;
using UnderPantsApp.Repository;

namespace UnderPantsApp.Services
{
    public class UserService : IUserRepository
    {
        private readonly UnderPantsContext _context;

        public UserService(UnderPantsContext context)
        {
            _context = context ?? throw new ArgumentNullException(nameof(context));
        }

        public async Task CreateUserAsync(User user)
        {
            _context.Users.Add(user);
            await SaveChangesAsync();
        }

        public void DeleteUserAsync(User user)
        {
            _context.Users.Remove(user);
        }

        public async Task<User> GetLoginAsync(string login, string password)
        {
            return await _context.Users.Where(u => u.Login.Equals(login) && u.Password.Equals(password))
                                       .FirstOrDefaultAsync() ?? throw new Exception("Não foi possível fazer o login. Verifique seu nome de usuário e senha e tente novamente.");
        }

        public async Task<User> GetUserAsync(int userId)
        {
            return await _context.Users.Where(u => u.Id.Equals(userId))
                                       .FirstOrDefaultAsync() ?? throw new Exception("Usuário não encontrado.");
        }

        public async Task<IEnumerable<User>> GetUsersAsync()
        {
            return await _context.Users
                                 .ToListAsync();
        }

        public async Task<bool> SaveChangesAsync()
        {
            return (await _context.SaveChangesAsync() >= 0);
        }

    }
}
