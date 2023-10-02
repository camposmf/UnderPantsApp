using AutoMapper;
using UnderPantsApp.Entity;
using UnderPantsApp.Models.User;

namespace UnderPantsApp.Profiles
{
    public class UserProfile : Profile
    {
        public UserProfile() 
        {
            CreateMap<User, UserModel>();
            CreateMap<UserForUpdateModel, User>();
            CreateMap<UserForCreationModel, User>();
        }
    }
}
