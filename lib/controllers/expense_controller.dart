import 'package:get/get.dart';
import '../data/model/expense.dart';
import '../services/helper/db_helper.dart';


class ExpenseController extends GetxController {
  var expenses = <Expense>[].obs;

  @override
  void onInit() {
    loadExpenses();
    super.onInit();
  }

  void loadExpenses() async {
    expenses.value = await DBHelper().fetchExpenses();
  }

  void addExpense(Expense expense) async {
    await DBHelper().insertExpense(expense);
    loadExpenses();
  }

  void removeExpense(int id) async {
    await DBHelper().deleteExpense(id);
    loadExpenses();
  }
}
