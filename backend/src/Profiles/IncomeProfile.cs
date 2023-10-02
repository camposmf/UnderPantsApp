using AutoMapper;
using UnderPantsApp.Entity;
using UnderPantsApp.Models.Income;

namespace UnderPantsApp.Profiles
{
    public class IncomeProfile : Profile
    {
        public IncomeProfile() 
        {
            CreateMap<Income, IncomeModel>();
        }
    }
}
