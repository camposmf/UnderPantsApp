﻿using AutoMapper;
using System.Text.Json;
using Microsoft.AspNetCore.Mvc;
using UnderPantsApp.Models.User;
using UnderPantsApp.Repository;
using UnderPantsApp.Entity;

namespace UnderPantsApp.Controllers
{
    [ApiController]
    [Route("users")]
    public class UserController : ControllerBase
    {
        private readonly IUserRepository _userRepository;
        private readonly IMapper _mapper;

        public UserController(IUserRepository userRepository, IMapper mapper)
        {
            _userRepository = userRepository ?? throw new ArgumentNullException(nameof(userRepository));
            _mapper = mapper ?? throw new ArgumentNullException(nameof(mapper));
        }

        [HttpGet("login")]
        [ProducesResponseType(StatusCodes.Status200OK)]
        [ProducesResponseType(StatusCodes.Status404NotFound)]
        public async Task<IActionResult> GetLogin(string login, string password)
        {
            var userEntity = await _userRepository.GetLoginAsync(login, password);

            if(userEntity == null)
                return NotFound();

            return Ok(_mapper.Map<UserModel>(userEntity));
        }

        [HttpGet("{userId}", Name = "GetUser")]
        [ProducesResponseType(StatusCodes.Status200OK)]
        [ProducesResponseType(StatusCodes.Status404NotFound)]
        public async Task<ActionResult<UserModel>> GetUser(int userId)
        {
            var userEntity = await _userRepository.GetUserAsync(userId);

            if(userEntity == null)
                return NotFound();

            return Ok(_mapper.Map<UserModel>(userEntity));
        }

        [HttpGet()]
        [ProducesResponseType(StatusCodes.Status200OK)]
        public async Task<ActionResult<IEnumerable<UserModel>>> GetUsers()
        {
            var usersEntity = await _userRepository.GetUsersAsync();

            if (!usersEntity.Any())
                return NotFound();

            return Ok(_mapper.Map<IEnumerable<UserModel>>(usersEntity));
        }


        [HttpPost]
        [ProducesResponseType(StatusCodes.Status200OK)]
        [ProducesResponseType(StatusCodes.Status404NotFound)]
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
        public async Task<ActionResult> UpdateUser(int userId, UserForUpdateModel user)
        {
            var userEntity = await _userRepository.GetUserAsync(userId);

            if(userEntity == null) 
                return NotFound();

            _mapper.Map(user, userEntity);
            await _userRepository.SaveChangesAsync();

            return NoContent();
        }

        [HttpDelete("{userId}")]
        [ProducesResponseType(StatusCodes.Status200OK)]
        [ProducesResponseType(StatusCodes.Status404NotFound)]
        public async Task<IActionResult> DeleteUser(int userId)
        {
            var userEntity = await _userRepository.GetUserAsync(userId);

            if(userEntity == null) 
                return NotFound();

            _userRepository.DeleteUserAsync(userEntity);
            await _userRepository.SaveChangesAsync();

            return NoContent();
        }

    }
}
