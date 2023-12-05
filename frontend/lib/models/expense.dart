class Expense{
  final int? id;
  final String name;
  final String date;
  final double amount;
  final String description;
  final int periodicityNumber;

  const Expense({
    this.id,
    required this.name,
    required this.date,
    required this.amount,
    required this.description,
    required this.periodicityNumber
  });
}