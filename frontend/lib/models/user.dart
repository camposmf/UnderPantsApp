class User {
  int? id = 0;
  String name = "";
  String email = "";
  String password = "";
  String bornDate = "";
  String cpfNumber = "";

  User(
    this.name,
    this.email,
    this.password,
    this.bornDate,
    this.cpfNumber,
  );

  User.fromJson(Map<String, dynamic> json){
    id = json['id'];
    bornDate = json['bornDate'];
    name = json['name'];
    email = json['email'];
    password = json['password'];
    cpfNumber = json['cpfNumber'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};

    data['id'] = id;
    data['bornDate'] = bornDate;
    data['name'] = name;
    data['email'] = email;
    data['password'] = password;
    data['cpfNumber'] = cpfNumber;

    return data;
  }
}