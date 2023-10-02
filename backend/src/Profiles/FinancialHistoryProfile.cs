using AutoMapper;
using UnderPantsApp.Entity;
using UnderPantsApp.Models.FinancialHistory;

namespace UnderPantsApp.Profiles
{
    public class FinancialHistoryProfile: Profile
    {
        public FinancialHistoryProfile()
        {
            CreateMap<FinancialHistory, FinancialHistoryModel>();
        }
    }
}
