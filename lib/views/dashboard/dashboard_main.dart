import 'package:expense_tracker/views/addExpense/add_new_expense.dart';
import 'package:fl_chart/fl_chart.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../controllers/expense_controller.dart';
import '../../data/model/expense.dart';
import '../details/category_details.dart';

class DashboardScreen extends StatelessWidget {
  DashboardScreen({super.key});

  final List<Color> colors = [
    Colors.redAccent,
    Colors.blueAccent,
    Colors.greenAccent,
    Colors.orangeAccent,
    Colors.purpleAccent,
    Colors.yellowAccent,
  ];

  @override
  Widget build(BuildContext context) {
    final controller = Get.put<ExpenseController>(ExpenseController());

    return Scaffold(
      appBar: AppBar(title: Text('Dashboard')),
      body: Obx(() {
        if (controller.expenses.isEmpty) {
          return Center(child: Text('No expenses yet.'));
        } else {
          return Column(
            children: [
              Expanded(child: _buildPieChart(controller.expenses)),
              _buildCategoryDetails(controller.expenses),
            ],
          );
        }
      }),
      floatingActionButton: FloatingActionButton(
        onPressed: () => Get.to(() => AddNewExpense()),
        child: Icon(Icons.add),
      ),
    );
  }

  Widget _buildPieChart(List<Expense> expenses) {
    Map<String, double> dataMap = {};
    int colorIndex = 0;

    for (var expense in expenses) {
      if (dataMap.containsKey(expense.categoryName)) {
        dataMap[expense.categoryName] =
            dataMap[expense.categoryName]! + expense.amount;
      } else {
        dataMap[expense.categoryName] = expense.amount;
      }
    }

    return Padding(
      padding: const EdgeInsets.all(16.0),
      child: PieChart(
        PieChartData(
          sections: dataMap.entries.map((entry) {
            final color = colors[colorIndex % colors.length];
            colorIndex++;

            return PieChartSectionData(
              title: '${entry.key}: \$${entry.value.toStringAsFixed(2)}',
              value: entry.value,
              radius: 60,
              titleStyle: TextStyle(fontSize: 12, color: Colors.black),
              color: color,
              badgeWidget: GestureDetector(
                onTap: () {
                  debugPrint(entry.key);
                  // _onCategoryClick(entry.key);
                },
                child: CircleAvatar(
                  backgroundColor: color,
                  child: Text(
                    entry.key[0],
                    style: TextStyle(color: Colors.white),
                  ),
                ),
              ),
              badgePositionPercentageOffset: 1.3,
            );
          }).toList(),
        ),
      ),
    );
  }

  Widget _buildCategoryDetails(List<Expense> expenses) {
    return Expanded(
      child: ListView(
        children: expenses.map((expense) {
          return ListTile(
            title: Text(expense.categoryName),
            subtitle: Text(
                '${expense.subCategoryName} - ${expense.subSubCategoryName ?? ''}'),
            trailing: Text('\$${expense.amount.toStringAsFixed(2)}'),
            onTap: () {
              Get.to(() => CategoryDetailScreen(expense: expense));
            },
          );
        }).toList(),
      ),
    );
  }

}
