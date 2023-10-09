using AutoMapper;
using UnderPantsApp.Entity;
using UnderPantsApp.Models.Expense;

namespace UnderPantsApp.Profiles
{
    public class ExpenseProfile : Profile
    {
        public ExpenseProfile() {
            CreateMap<Expense, ExpenseModel>();
            CreateMap<ExpenseForUpdateModel, Expense>();
            CreateMap<ExpenseForCreationModel, Expense>();
        }
    }
}