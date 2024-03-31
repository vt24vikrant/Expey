import 'package:expey/components/expense_summary.dart';
import 'package:expey/components/expense_tile.dart';
import 'package:expey/data/expense_data.dart';
import 'package:expey/models/expense_item.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  final newExpenseNameController = TextEditingController();
  final newExpenseAmountController = TextEditingController();

  void addNewExpense() {
    showDialog(
        context: context,
        builder: (context) => AlertDialog(
              title: Text('Add new Expense'),
              content: Column(
                mainAxisSize: MainAxisSize.min,
                children: [
                  TextField(
                    controller: newExpenseNameController,
                    decoration: const InputDecoration(
                      hintText:"Item Name" ,
                    ),
                  ),
                  TextField(
                    controller: newExpenseAmountController,
                    keyboardType: TextInputType.number,
                    decoration: const InputDecoration(
                      hintText:"Amount" ,
                    ),
                  ),
                ],
              ),
              actions: [
                MaterialButton(
                  onPressed: save,
                  child: Text('Save'),
                ),
                MaterialButton(
                  onPressed: cancel,
                  child: Text('Cancel'),
                )
              ],
            ));
  }

  void save() {
    ExpenseItem newExpense = ExpenseItem(
      name: newExpenseNameController.text,
      amount: newExpenseAmountController.text,
      dateTime: DateTime.now(),
    );
    Provider.of<ExpenseData>(context, listen: false).addNewExpense(newExpense);

    Navigator.pop(context);
  }

  void cancel() {
    Navigator.pop(context);
  }

  void clear() {
    newExpenseNameController.clear();
    newExpenseAmountController.clear();
  }

  @override
  Widget build(BuildContext context) {
    return Consumer<ExpenseData>(
        builder: (context, value, child) => Scaffold(
            backgroundColor: Color.fromARGB(255, 176, 176, 176),
            floatingActionButton: FloatingActionButton(
              onPressed: addNewExpense,
              child: Icon(Icons.add),
              backgroundColor: Color.fromARGB(255, 230, 56, 56),
            ),
            body: ListView(
              children: [
                const SizedBox(height: 50,),
                ExpenseSummary(startOfWeek: value.startOfWeekDate()),
                const SizedBox(height: 20,),

                ListView.builder(
                  shrinkWrap: true,
                  physics: const NeverScrollableScrollPhysics(),
                  itemCount: value.getAllExpenseList().length,
                  itemBuilder: ((context, index) => ExpenseTile(
                      name: value.getAllExpenseList()[index].name,
                      amount: value.getAllExpenseList()[index].amount,
                      dateTime: value.getAllExpenseList()[index].dateTime)),
                )
              ],
            )));
  }
}
