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

        public async Task<User?> GetLoginAsync(string login, string password)
        {
            return await _context.Users.Where(u => u.Login.Equals(login) && u.Password.Equals(password))
                                       .FirstOrDefaultAsync();
        }

        public async Task<User?> GetUserAsync(int userId)
        {
            return await _context.Users.Where(u => u.Id.Equals(userId))
                                       .FirstOrDefaultAsync();
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
