class User {
  final int? cpf;
  final String name;
  final String email;
  final String login;
  final String password;
  final String bornDate;

  const User({
    this.cpf,
    required  this.name,
    required  this.email,
    required  this.login,
    required  this.password,
    required  this.bornDate
  });
}