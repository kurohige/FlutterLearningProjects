import 'package:expense_tracker/models/expense.dart';
import 'package:expense_tracker/widgets/expenses_list/expenses_list.dart';
import 'package:expense_tracker/widgets/new_expense.dart';
import 'package:flutter/material.dart';

class Expenses extends StatefulWidget {
  const Expenses({super.key});

  @override
  State<Expenses> createState() {
    return _ExpensesState();
  }
}

class _ExpensesState extends State<Expenses> {
  final List<Expense> _registeredexpenses = [
    Expense(
      title: 'Groceries',
      amount: 100.0,
      date: DateTime.now(),
      category: Category.food,
    ),
    Expense(
      title: 'Electricity',
      amount: 50.0,
      date: DateTime.now(),
      category: Category.bills,
    ),
  ];

  void _addExpense(Expense expense) {
    setState(() {
      _registeredexpenses.add(expense);
    });
  }

  void _deleteExpense(Expense expense) {
    setState(() {
      _registeredexpenses.remove(expense);
    });
  }

  void _openAddExepenseOverlay() {
    showModalBottomSheet(
      isScrollControlled: true,
      context: context,
      builder: (ctx) => NewExpense(addExpense: _addExpense),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        actions: [
          IconButton(
            icon: const Icon(Icons.add),
            onPressed: _openAddExepenseOverlay,
          ),
        ],
      ),
      body: Column(
        children: [
          const Text('Expenses'),
          Expanded(
            child: ExpensesList(
              expenses: _registeredexpenses,
              removeExpense: _deleteExpense,
            ),
          ),
        ],
      ),
    );
  }
}
