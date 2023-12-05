class Income {
  final int? id;
  final String name;
  final String date;
  final double amount;
  final String description;
  final int periodicityNumber;

  const Income({
    this.id,
    required this.date,
    required this.name,
    required this.amount,
    required this.description,
    required this.periodicityNumber,
  });

  Income.fromJson(Map<String, dynamic> json)
      : id = json['id'],
        date = json['date'],
        name = json['name'],
        amount = json['amount'].toDouble(),
        description = json['description'],
        periodicityNumber = json['periodicityNumber'];

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
