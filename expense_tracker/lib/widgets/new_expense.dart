import 'package:flutter/material.dart';
import 'package:expense_tracker/models/expense.dart';
import 'package:intl/intl.dart';

class NewExpense extends StatefulWidget {
  final Function addExpense;

  const NewExpense({required this.addExpense, super.key});

  @override
  State<NewExpense> createState() => _NewExpenseState();
}

class _NewExpenseState extends State<NewExpense> {
  final _titleController = TextEditingController();
  final _amountController = TextEditingController();
  DateTime? _selectedDate;
  Category? _category;

  void _submitData() {
    final enteredTitle = _titleController.text;
    final enteredAmountString = _amountController.text;

    // try parsing amount to double
    final enteredAmount = double.tryParse(enteredAmountString);

    // validate data:
    if (enteredTitle.isEmpty ||
        enteredAmount == null ||
        enteredAmount == 0 ||
        _category == null) {
      showDialog(
        context: context,
        builder: (ctx) => AlertDialog(
          title: const Text('Empty or Invalid input'),
          content:
              const Text('Please enter a valid title, amount and category.'),
          actions: [
            TextButton(
              onPressed: () => Navigator.of(ctx).pop(),
              child: const Text('Okay'),
            ),
          ],
        ),
      );
      return;
    }

    widget.addExpense(
      Expense(
        title: enteredTitle,
        amount: enteredAmount,
        date: _selectedDate!, // we are sure that the value is not null
        category: _category!,
      ),
    );

    Navigator.of(context).pop();
  }

  Future<void> _presentDatePicker() async {
    final now = DateTime.now();
    final fistDate = DateTime(now.year - 1, now.month, now.day);
    final pickedDate = await showDatePicker(
      context: context,
      initialDate: now,
      firstDate: fistDate,
      lastDate: now,
    );
    setState(() {
      _selectedDate = pickedDate;
    });

    // the following is very similar to for comprehension in Scala
    /* showDatePicker(
      context: context,
      initialDate: DateTime.now(),
      firstDate: DateTime(2000),
      lastDate: DateTime(2100),
    ).then((pickedDate) {
      if (pickedDate == null) {
        return;
      }
      setState(() {
        _dateController.text = DateFormat('yyyy-MM-dd')
            .format(pickedDate); // Set formatted date to controller
      });
    }); */
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(16),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.end,
        children: [
          TextField(
            controller: _titleController,
            maxLength: 50,
            decoration: const InputDecoration(labelText: 'Title'),
            keyboardType: TextInputType.text,
          ),
          amountAndDate(),
          categorySelection(),
          addAndCancelButton(),
        ],
      ),
    );
  }

  Row amountAndDate() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Expanded(
          child: TextField(
              controller: _amountController,
              decoration:
                  const InputDecoration(prefixText: '\$ ', labelText: 'Amount'),
              keyboardType: TextInputType.number),
        ),
        const SizedBox(width: 8),
        Expanded(
          child: Row(
            mainAxisAlignment: MainAxisAlignment.end,
            children: [
              Text(
                _selectedDate == null
                    ? 'No Date Chosen'
                    : DateFormat.yMd().format(_selectedDate!),
                textAlign: TextAlign.right,
              ),
              // with exclamation mark we are telling the compiler that we are sure that the value is not null
              const SizedBox(width: 8),
              IconButton(
                onPressed: _presentDatePicker,
                icon: const Icon(Icons.calendar_today),
              ),
            ],
          ),
        )
      ],
    );
  }

  Row addAndCancelButton() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        ElevatedButton(
          style: ButtonStyle(
            backgroundColor: MaterialStateProperty.all(
                const Color.fromARGB(255, 254, 254, 255)),
          ),
          onPressed: _submitData,
          child: const Text(
              style: TextStyle(color: Color.fromARGB(255, 16, 16, 17)),
              'Add Expense'),
        ),
        ElevatedButton(
          onPressed: () => Navigator.of(context).pop(),
          child: const Text(
            style: TextStyle(color: Color.fromARGB(255, 7, 7, 7)),
            'Cancel',
          ),
        ),
      ],
    );
  }

  DropdownButton<Category> categorySelection() {
    return DropdownButton<Category>(
      isExpanded: true,
      value: _category,
      onChanged: (Category? newValue) {
        setState(() {
          _category = newValue;
        });
      },
      items: Category.values.map((Category category) {
        return DropdownMenuItem<Category>(
          value: category,
          child: Row(
            children: [
              Icon(categoryIcons[category]),
              const SizedBox(width: 8),
              Text(category.toString().split('.').last),
            ],
          ),
        );
      }).toList(),
      hint: const Text('Select Category'),
      underline: Container(
        height: 2,
        color: const Color.fromARGB(255, 21, 21, 21),
      ),
    );
  }
}
