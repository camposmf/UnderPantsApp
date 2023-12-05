class SavingGoal{
  final int? id;
  final String name;
  final String date;
  final double amount;
  final double totalValue;
  final double currentValue;
  final String description;

  const SavingGoal({
    this.id,
    required this.name,
    required this.date,
    required this.amount,
    required this.totalValue,
    required this.currentValue,
    required this.description
  });
}