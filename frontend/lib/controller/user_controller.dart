import 'dart:convert';
import '../models/user.dart';
import 'package:http/http.dart' as http;
import 'package:flutter/foundation.dart';

const String url = "http://10.0.2.2:5088/users";

Future<User?> getUserByCpf(String cpf) async {
  try {
    final http.Response response = await http.get(
      Uri.parse('$url/get-by-cpf/$cpf'),
    );

    if (response.statusCode == 200) {
      return User.fromJson(json.decode(response.body));
    } else {
      print('Erro na busca do User: ${response.reasonPhrase}');
      throw Exception(response.statusCode);
    }
  } catch (e) {
    print('Erro durante a busca do User: $e');
    return null;
  }
}

Future<User> createUser(User newUser) async {
  try {
    final http.Response response = await http.post(
      Uri.parse(url),
      headers: {'Content-Type': 'application/json'},
      body: jsonEncode(newUser.toJson()),
    );
    print(response.body);

    if (response.statusCode == 201 || response.statusCode == 200) {
      return User.fromJson(json.decode(response.body));
    } else {
      print('Erro na criação do User: ${response.reasonPhrase}');
      throw Exception(response.statusCode);
    }
  } catch (e) {
    print('Erro durante a criação do User: $e');
    throw Exception('Erro durante a criação do User: $e');
  }
}

Future<void> editUser(int userId, User? updatedUser) async {
  try {
    final http.Response response = await http.put(
      Uri.parse('$url/$userId'),
      headers: {'Content-Type': 'application/json'},
      body: jsonEncode(updatedUser?.toJson()),
    );

    if (response.statusCode == 204) {
      print('Alteração do User realizada com sucesso.');
    } else {
      print('Erro na edição do User: ${response.reasonPhrase}');
      throw Exception(response.statusCode);
    }
  } catch (e) {
    print('Erro durante a edição do User: $e');
    throw Exception('Erro durante a edição do User: $e');
  }
}

Future<User> getUserByEmailAndPassword(String email, String password) async {

  try {
    final http.Response response = await http.get(
      Uri.parse('$url/login?email=$email&password=$password'),
    );

    if (response.statusCode == 200) {
      return User.fromJson(json.decode(response.body));
    } else {
      print('Erro na busca do Login do User: ${response.reasonPhrase}');
      throw Exception(response.statusCode);
    }
  } catch (e) {
    print('Erro durante a busca do Login do User: $e');
    throw Exception('Erro durante a busca do Login do User: $e');
  }
}