using AutoMapper;
using UnderPantsApp.Entity;
using UnderPantsApp.Repository;
using Microsoft.AspNetCore.Mvc;
using UnderPantsApp.Models.User;

namespace UnderPantsApp.Controllers
{
    [ApiController]
    [Route("users")]
    public class UsersController : ControllerBase
    {
        private readonly IMapper _mapper;
        private readonly IUserRepository _userRepository;

        public UsersController(IUserRepository userRepository, IMapper mapper)
        {
            _mapper = mapper ?? throw new ArgumentNullException(nameof(mapper));
            _userRepository = userRepository ?? throw new ArgumentNullException(nameof(userRepository));
        }

        [HttpGet("login")]
        [ProducesResponseType(StatusCodes.Status200OK)]
        [ProducesResponseType(StatusCodes.Status404NotFound)]
        public async Task<IActionResult> GetLogin(string email, string password)
        {
            var userEntity = await _userRepository.GetLoginAsync(email, password);

            if(userEntity == null)
                return NotFound("Não foi possível fazer o login. Verifique seu nome de usuário e senha e tente novamente.");

            return Ok(_mapper.Map<UserModel>(userEntity));
        }

        [HttpGet("get-by-cpf/{cpf}")]
        [ProducesResponseType(StatusCodes.Status200OK)]
        [ProducesResponseType(StatusCodes.Status404NotFound)]
        public async Task<IActionResult> GetUserByCpf(string cpf)
        {
            var userEntity = await _userRepository.GetUserByCpf(cpf);

            if (userEntity == null)
                return NotFound("Não foi possível encontrar o usúario através do email e o cpf passado. Verifique seu nome de usuário e senha e tente novamente.");

            return Ok(_mapper.Map<UserModel>(userEntity));
        }

        [HttpPost]
        [ProducesResponseType(StatusCodes.Status200OK)]
        public async Task<IActionResult> CreateUser(UserForCreationModel user)
        {
            var userResult = _mapper.Map<User>(user);
            await _userRepository.CreateUserAsync(userResult);
            
            var userToReturn = _mapper.Map<UserModel>(userResult);
            return CreatedAtRoute(
                "GetUser",
                new
                {
                    userID = userToReturn.Id
                },
                userToReturn
            );
        }

        [HttpPut("{userId}")]
        [ProducesResponseType(StatusCodes.Status200OK)]
        [ProducesResponseType(StatusCodes.Status404NotFound)]
        public async Task<IActionResult> UpdateUser(int userId, UserForUpdateModel user)
        {
            var userEntity = await _userRepository.GetUserAsync(userId);

            if(userEntity == null) 
                return NotFound("Usuário não encontrado no sistema.");

            _mapper.Map(user, userEntity);
            await _userRepository.SaveChangesAsync();

            return NoContent();
        }

    }
}