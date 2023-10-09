using Microsoft.EntityFrameworkCore;
using UnderPantsApp.Entity;

namespace UnderPantsApp.DbContexts
{
    public class UnderPantsContext : DbContext
    {
        public DbSet<User> Users { get; set; }
        public DbSet<Income> Incomes { get; set; }
        public DbSet<Expense> Expenses { get; set; }
        public DbSet<Account> Accounts { get; set; }
        public DbSet<SavingsGoal> SavingsGoals { get; set; }
        public DbSet<FinancialHistory> FinancialHistories { get; set; }

        public UnderPantsContext(DbContextOptions<UnderPantsContext> option) : base(option) { }
        
    }
}
