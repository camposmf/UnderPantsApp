import 'dart:convert';
import '../models/income.dart';
import 'package:http/http.dart' as http;
import 'package:flutter/foundation.dart';

const String url = "http://127.0.0.1:5088/incomes";

List<Income> parseIncome(String responseBody){
  var list = json.decode(responseBody) as List<dynamic>;
  var incomes = list.map((e) => Income.fromJson(e)).toList();
  return incomes;
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