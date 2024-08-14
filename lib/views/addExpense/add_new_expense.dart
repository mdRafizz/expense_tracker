import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../controllers/expense_controller.dart';
import '../../data/get_categories.dart';
import '../../data/model/expense.dart';


class AddNewExpense extends StatefulWidget {
  @override
   createState() => _AddNewExpenseState();
}

class _AddNewExpenseState extends State<AddNewExpense> {

  String? selectedCategory;
  String? selectedSubCategory;
  String? selectedSubSubCategory;
  double? amount;
  DateTime selectedDate = DateTime.now();

  @override
  Widget build(BuildContext context) {
    var categories = getCategories();

    return Scaffold(
      appBar: AppBar(title: Text('Select Category')),
      body: Column(
        children: [
          DropdownButton<String>(
            hint: Text('Select Category'),
            value: selectedCategory,
            items: categories.map((category) {
              return DropdownMenuItem<String>(
                value: category.name,
                child: Text(category.name),
              );
            }).toList(),
            onChanged: (value) {
              setState(() {
                selectedCategory = value;
                selectedSubCategory = null;
                selectedSubSubCategory = null;
              });
            },
          ),
          if (selectedCategory != null)
            DropdownButton<String>(
              hint: Text('Select SubCategory'),
              value: selectedSubCategory,
              items: categories
                  .firstWhere((c) => c.name == selectedCategory!)
                  .subCategories
                  .map((subCategory) {
                return DropdownMenuItem<String>(
                  value: subCategory.name,
                  child: Text(subCategory.name),
                );
              }).toList(),
              onChanged: (value) {
                setState(() {
                  selectedSubCategory = value;
                  selectedSubSubCategory = null;
                });
              },
            ),
          if (selectedSubCategory != null && categories
              .firstWhere((c) => c.name == selectedCategory!)
              .subCategories
              .firstWhere((sc) => sc.name == selectedSubCategory!)
              .subCategories.isNotEmpty)
            DropdownButton<String>(
              hint: Text('Select SubSubCategory'),
              value: selectedSubSubCategory,
              items: categories
                  .firstWhere((c) => c.name == selectedCategory!)
                  .subCategories
                  .firstWhere((sc) => sc.name == selectedSubCategory!)
                  .subCategories
                  .map((subSubCategory) {
                return DropdownMenuItem<String>(
                  value: subSubCategory,
                  child: Text(subSubCategory),
                );
              }).toList(),
              onChanged: (value) {
                setState(() {
                  selectedSubSubCategory = value;
                });
              },
            ),
          TextField(
            keyboardType: TextInputType.number,
            decoration: InputDecoration(labelText: 'Enter Amount'),
            onChanged: (value) {
              amount = double.tryParse(value);
            },
          ),
          ListTile(
            title: Text('Select Date'),
            subtitle: Text(
              _formatDate(selectedDate),
            ),
            trailing: Icon(Icons.calendar_today),
            onTap: _selectDate,
          ),
          ElevatedButton(
            onPressed: () {
              if (selectedCategory != null &&
                  selectedSubCategory != null &&
                  amount != null) {
                _saveExpense();
                Get.back(); // Navigate back to the dashboard
              }
            },
            child: Text('OK'),
          ),
        ],
      ),
    );
  }


  void _selectDate() async {
    DateTime? picked = await showDatePicker(
      context: context,
      initialDate: selectedDate,
      firstDate: DateTime(2000),
      lastDate: DateTime.now(),
    );
    if (picked != null && picked != selectedDate) {
      setState(() {
        selectedDate = picked;
      });
    }
  }

  String _formatDate(DateTime date) {
    return '${date.day}${_getDaySuffix(date.day)} ${_getMonthName(date.month)}, ${date.year}';
  }

  String _getDaySuffix(int day) {
    if (day >= 11 && day <= 13) return 'th';
    switch (day % 10) {
      case 1:
        return 'st';
      case 2:
        return 'nd';
      case 3:
        return 'rd';
      default:
        return 'th';
    }
  }

  String _getMonthName(int month) {
    const months = [
      'January', 'February', 'March', 'April', 'May', 'June',
      'July', 'August', 'September', 'October', 'November', 'December'
    ];
    return months[month - 1];
  }

  void _saveExpense() {
    final expense = Expense(
      categoryName: selectedCategory!,
      subCategoryName: selectedSubCategory!,
      subSubCategoryName: selectedSubSubCategory ?? '',
      amount: amount!,
      date: selectedDate,
    );

    final controller = Get.find<ExpenseController>();
    controller.addExpense(expense);
  }
}
