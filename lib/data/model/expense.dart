class Expense {
  final int? id;
  final String categoryName;
  final String subCategoryName;
  final String? subSubCategoryName;
  final double amount;
  final DateTime date;

  Expense({
    this.id,
    required this.categoryName,
    required this.subCategoryName,
    this.subSubCategoryName,
    required this.amount,
    required this.date,
  });

  Map<String, dynamic> toMap() {
    return {
      'id': id,
      'categoryName': categoryName,
      'subCategoryName': subCategoryName,
      'subSubCategoryName': subSubCategoryName,
      'amount': amount,
      'date': date.toIso8601String(),
    };
  }

  factory Expense.fromMap(Map<String, dynamic> map) {
    return Expense(
      id: map['id'],
      categoryName: map['categoryName'],
      subCategoryName: map['subCategoryName'],
      subSubCategoryName: map['subSubCategoryName'],
      amount: map['amount'],
      date: DateTime.parse(map['date']),
    );
  }
}
