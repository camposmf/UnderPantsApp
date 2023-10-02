using AutoMapper;
using UnderPantsApp.Models.Expense;

namespace UnderPantsApp.Profiles
{
    public class ExpenseProfile : Profile
    {
        public ExpenseProfile() {
            CreateMap<ExpenseProfile, ExpenseModel>();
        }
    }
}
