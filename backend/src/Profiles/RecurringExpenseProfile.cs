using AutoMapper;
using UnderPantsApp.Entity;
using UnderPantsApp.Models.RecurringExpense;

namespace UnderPantsApp.Profiles
{
    public class RecurringExpenseProfile : Profile
    {
        public RecurringExpenseProfile() 
        {
            CreateMap<RecurringExpense, RecurringExpenseModel>();
        }
    }
}
