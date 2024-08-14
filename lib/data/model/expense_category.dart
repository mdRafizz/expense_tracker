class ExpenseCategory {
  final String name;
  final List<SubCategory> subCategories;

  ExpenseCategory({required this.name, required this.subCategories});

  Map<String, dynamic> toMap() {
    return {
      'name': name,
      'subCategories': subCategories.map((sc) => sc.toMap()).toList(),
    };
  }

  factory ExpenseCategory.fromMap(Map<String, dynamic> map) {
    return ExpenseCategory(
      name: map['name'],
      subCategories: List<SubCategory>.from(
        map['subCategories']?.map((x) => SubCategory.fromMap(x)) ?? [],
      ),
    );
  }
}

class SubCategory {
  final String name;
  final List<String> subCategories;

  SubCategory({required this.name, this.subCategories = const []});

  Map<String, dynamic> toMap() {
    return {
      'name': name,
      'subCategories': subCategories,
    };
  }

  factory SubCategory.fromMap(Map<String, dynamic> map) {
    return SubCategory(
      name: map['name'],
      subCategories: List<String>.from(map['subCategories'] ?? []),
    );
  }
}
