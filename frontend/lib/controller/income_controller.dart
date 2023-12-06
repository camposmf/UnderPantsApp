import 'dart:convert';
import '../models/income.dart';
import 'package:http/http.dart' as http;
import 'package:flutter/foundation.dart';

const String url = "http://10.0.2.2:5088/incomes";

List<Income> parseIncome(String responseBody){
  var list = json.decode(responseBody) as List<dynamic>;
  return list.map((e) => Income.fromJson(e)).toList();
}

Future<List<Income>> fetchIncomes() async {
  try{

    final http.Response response = await http.get(Uri.parse(url));
    print('Código de Status da Resposta: ${response.statusCode}');

    if(response.statusCode == 200){
      final List<Income> incomes = await compute(parseIncome, response.body);
      print('Número de Incomes Recebidos: ${incomes.length}');
      return incomes;

    } else {
      print('Erro na requisição: ${response.reasonPhrase}');
      throw Exception(response.statusCode);
    }
  }catch(e){
    print('Erro durante a requisição: $e');
    throw Exception('Erro durante a requisição: $e');
  }
}

Future<void> deleteIncome(int incomeId) async {
  try {
    final http.Response response = await http.delete(
      Uri.parse('$url/$incomeId'),
    );

    if (response.statusCode == 204) {
      print('Income excluído com sucesso');
    } else {
      print('Erro na exclusão do Income: ${response.reasonPhrase}');
      throw Exception(response.statusCode);
    }
  } catch (e) {
    print('Erro durante a exclusão do Income: $e');
    throw Exception('Erro durante a exclusão do Income: $e');
  }
}

Future<Income> createIncome(Income newIncome) async {
  try {
    final http.Response response = await http.post(
      Uri.parse(url),
      headers: {'Content-Type': 'application/json'},
      body: jsonEncode(newIncome.toJson()),
    );

    if (response.statusCode == 201 || response.statusCode == 200) {
      return Income.fromJson(json.decode(response.body));
    } else {
      print('Erro na criação do Income: ${response.reasonPhrase}');
      throw Exception(response.statusCode);
    }
  } catch (e) {
    print('Erro durante a criação do Income: $e');
    throw Exception('Erro durante a criação do Income: $e');
  }
}

Future<void> editIncome(int incomeId, Income updatedIncome) async {
  try {
    final http.Response response = await http.put(
      Uri.parse('$url/$incomeId'),
      headers: {'Content-Type': 'application/json'},
      body: jsonEncode(updatedIncome.toJson()),
    );

    if (response.statusCode == 204) {
      print('Alteração do Income realizada com sucesso.');
    } else {
      print('Erro na edição do Income: ${response.reasonPhrase}');
      throw Exception(response.statusCode);
    }
  } catch (e) {
    print('Erro durante a edição do Income: $e');
    throw Exception('Erro durante a edição do Income: $e');
  }
}