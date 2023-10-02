using AutoMapper;
using UnderPantsApp.Entity;
using UnderPantsApp.Models.SavingsGoal;

namespace UnderPantsApp.Profiles
{
    public class SavingsGoalProfile : Profile
    {
        public SavingsGoalProfile() 
        {
            CreateMap<SavingsGoal, SavingsGoalModel>();
        }
    }
}
