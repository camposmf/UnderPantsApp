using System.Text;
using System.Reflection;
using UnderPantsApp.Services;
using UnderPantsApp.DbContexts;
using UnderPantsApp.Repository;
using Microsoft.OpenApi.Models;
using Microsoft.EntityFrameworkCore;
using Microsoft.IdentityModel.Tokens;
using Microsoft.AspNetCore.StaticFiles;
using UnderPantsApp;

var builder = WebApplication.CreateBuilder(args);

builder.Services.AddControllers(options =>
{
    options.ReturnHttpNotAcceptable = true;
}).AddNewtonsoftJson()
  .AddXmlDataContractSerializerFormatters();

builder.Services.AddEndpointsApiExplorer();
builder.Services.AddSwaggerGen();
builder.Services.AddSingleton<FileExtensionContentTypeProvider>();

builder.Services.AddDbContext<UnderPantsContext>(
    dbContextOptions => dbContextOptions.UseSqlite(builder.Configuration["ConnectionStrings:UnderPantsDB"])
);

builder.Services.AddScoped<IUserRepository, UserService>();
builder.Services.AddScoped<IExpenseRepository, ExpenseService>();
builder.Services.AddScoped<IIncomeRepository, IncomeService>();

builder.Services.AddAutoMapper(AppDomain.CurrentDomain.GetAssemblies());

var app = builder.Build();

// Configure the HTTP request pipeline.
if (app.Environment.IsDevelopment())
{
    app.UseSwagger();
    app.UseSwaggerUI();
}

app.UseHttpsRedirection();

app.UseAuthorization();

app.MapControllers();

app.Run();
