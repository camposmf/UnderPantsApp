import 'dart:convert';
import '../models/expense.dart';
import 'package:http/http.dart' as http;
import 'package:flutter/foundation.dart';

const String url = "http://10.0.2.2:5088/expenses";

List<Expense> parseExpense(String responseBody){
  var list = json.decode(responseBody) as List<dynamic>;
  return list.map((e) => Expense.fromJson(e)).toList();
}

Future<List<Expense>> fetchExpenses() async {
  try{

    final http.Response response = await http.get(Uri.parse(url));
    print('Código de Status da Resposta: ${response.statusCode}');

    if(response.statusCode == 200){
      final List<Expense> expenses = await compute(parseExpense, response.body);
      print('Número de Expense Recebidos: ${expenses.length}');
      return expenses;

    } else {
      print('Erro na requisição: ${response.reasonPhrase}');
      throw Exception(response.statusCode);
    }
  }catch(e){
    print('Erro durante a requisição: $e');
    throw Exception('Erro durante a requisição: $e');
  }
}

Future<void> deleteExpense(int expenseId) async {
  try {
    final http.Response response = await http.delete(
      Uri.parse('$url/$expenseId'),
    );

    if (response.statusCode == 204) {
      print('Expense excluído com sucesso');
    } else {
      print('Erro na exclusão do Expense: ${response.reasonPhrase}');
      throw Exception(response.statusCode);
    }
  } catch (e) {
    print('Erro durante a exclusão do Expense: $e');
    throw Exception('Erro durante a exclusão do Expense: $e');
  }
}

Future<Expense> createExpense(Expense newExpense) async {
  try {
    final http.Response response = await http.post(
      Uri.parse(url),
      headers: {'Content-Type': 'application/json'},
      body: jsonEncode(newExpense.toJson()),
    );

    if (response.statusCode == 201 || response.statusCode == 200) {
      return Expense.fromJson(json.decode(response.body));
    } else {
      print('Erro na criação do Expense: ${response.reasonPhrase}');
      throw Exception(response.statusCode);
    }
  } catch (e) {
    print('Erro durante a criação do Expense: $e');
    throw Exception('Erro durante a criação do Expense: $e');
  }
}

Future<void> editExpense(int expenseId, Expense updatedExpense) async {
  try {
    final http.Response response = await http.put(
      Uri.parse('$url/$expenseId'),
      headers: {'Content-Type': 'application/json'},
      body: jsonEncode(updatedExpense.toJson()),
    );

    if (response.statusCode == 204) {
      print('Alteração do Expense realizada com sucesso.');
    } else {
      print('Erro na edição do Expense: ${response.reasonPhrase}');
      throw Exception(response.statusCode);
    }
  } catch (e) {
    print('Erro durante a edição do Expense: $e');
    throw Exception('Erro durante a edição do Expense: $e');
  }
}