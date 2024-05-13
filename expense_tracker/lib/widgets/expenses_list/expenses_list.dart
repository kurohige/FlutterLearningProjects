import 'package:expense_tracker/models/expense.dart';
import 'package:expense_tracker/widgets/expenses_list/expense_item.dart';
import 'package:flutter/material.dart';

class ExpensesList extends StatelessWidget {
  final List<Expense> expenses;
  final void Function(Expense) removeExpense;

  const ExpensesList({
    required this.expenses,
    required this.removeExpense,
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      itemCount: expenses.length,
      itemBuilder: (context, index) => Dismissible(
        // for dismissible to work, we need to provide a key that is related to
        // the item that is being dismissed
        key: ValueKey(expenses[index]),
        onDismissed: (_) => removeExpense(expenses[index]), // remove the item
        child: ExpenseItem(
          expense: expenses[index],
        ),
      ),
    );
  }
}
