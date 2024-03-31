import 'package:hive_flutter/hive_flutter.dart';
import 'package:expey/models/expense_item.dart';

class HiveDataBase{
  final _myBox = Hive.box("expense_database");

  void saveData(List<ExpenseItem> allExpense){

    List<List<dynamic>> allExpensesFormatted =[];

    for (var expense in allExpense) 
    {
      List<dynamic> expenseFormatted =[
        expense.name,
        expense.amount,
        expense.dateTime,
      ];
      allExpensesFormatted.add(expenseFormatted);
      
    }
    
  }
}