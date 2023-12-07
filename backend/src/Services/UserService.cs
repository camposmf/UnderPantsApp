using UnderPantsApp.Entity;
using UnderPantsApp.DbContexts;
using UnderPantsApp.Repository;
using Microsoft.EntityFrameworkCore;
using Microsoft.AspNetCore.Mvc;

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

        public async Task<User?> GetLoginAsync(string email, string password)
        {
            return await _context.Users.Where(u => u.Email.Equals(email) && u.Password.Equals(password))
                                       .FirstOrDefaultAsync();
        }

        public async Task<User?> GetUserAsync(int userId)
        {
            return await _context.Users.Where(u => u.Id.Equals(userId))
                                       .FirstOrDefaultAsync();
        }

        public async Task<User?> GetUserByCpf(string cpf)
        {
            return await _context.Users.Where(u => u.CpfNumber.Equals(cpf))
                                       .FirstOrDefaultAsync();
        }

        public async Task<bool> SaveChangesAsync()
        {
            return (await _context.SaveChangesAsync() >= 0);
        }

    }
}