import 'package:hive/hive.dart';

import '../models/expense_item.dart';

class HiveDataBase {
  // reference our box
  final _myBox = Hive.box('expense_database');
  // write data
  void saveData(List<ExpenseItem> allExpense) {
    List<List<dynamic>> allExpenseFormatted = [];

    for (var expense in allExpense) {
      // convert each expenseItem into a List of storable types (String, dateTime)
      List<dynamic> expenseFormatted = [
        expense.name,
        expense.amount,
        expense.datetime,
      ];
      allExpenseFormatted.add(expenseFormatted);
    }

    // finally lets store in our database;

    _myBox.put("ALL_EXPENSE", allExpenseFormatted);
  }

  // read data
  List<ExpenseItem> readData() {
    List savedExpense = _myBox.get("ALL_EXPENSE") ?? [];
    List<ExpenseItem> allExpense = [];

    for (int i = 0; i < savedExpense.length; i++) {
      // collect individual expense data
      String name = savedExpense[i][0];
      String amount = savedExpense[i][1];
      DateTime dateTime = savedExpense[i][2];

      // create expense item
      ExpenseItem expense = ExpenseItem(
        name: name,
        amount: amount,
        datetime: dateTime,
      );

      // add expense to overall list of expense
      allExpense.add(expense);
    }
    return allExpense;
  }
}
