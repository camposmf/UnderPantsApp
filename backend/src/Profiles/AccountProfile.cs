using AutoMapper;
using UnderPantsApp.Entity;
using UnderPantsApp.Models.Account;

namespace UnderPantsApp.Profiles
{
    public class AccountProfile : Profile
    {
        public AccountProfile() 
        {
            CreateMap<Account, AccountModel>();
        }
    }
}
