import 'package:flutter/material.dart';

import '../../data/model/expense.dart';

class CategoryDetailScreen extends StatelessWidget {
  final Expense expense;

  CategoryDetailScreen({required this.expense});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('${expense.categoryName} Details')),
      body: Padding(
        padding: EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text('Category: ${expense.categoryName}'),
            Text('SubCategory: ${expense.subCategoryName}'),
            if (expense.subSubCategoryName != null &&
                expense.subSubCategoryName!.isNotEmpty)
              Text('SubSubCategory: ${expense.subSubCategoryName}'),
            Text('Amount: \$${expense.amount.toStringAsFixed(2)}'),
            Text('Date: ${expense.date.toLocal()}'),
          ],
        ),
      ),
    );
  }
}
