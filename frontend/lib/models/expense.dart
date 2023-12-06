class Expense{
  int? id = 0;
  String name = "";
  String date = "";
  double amount = 0;
  String description = "";
  int periodicityNumber = 0;

  Expense(
    this.name,
    this.date,
    this.amount,
    this.description,
    this.periodicityNumber
  );

  Expense.fromJson(Map<String, dynamic> json){
    id = json['id'];
    date = json['date'];
    name = json['name'];
    amount = json['amount'].toDouble();
    description = json['description'];
    periodicityNumber = json['periodicityNumber'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};

    data['id'] = id;
    data['date'] = date;
    data['name'] = name;
    data['amount'] = amount;
    data['description'] = description;
    data['periodicityNumber'] = periodicityNumber;

    return data;
  }
}