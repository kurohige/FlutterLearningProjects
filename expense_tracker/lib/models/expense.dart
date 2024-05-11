import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:uuid/uuid.dart';

const uuid = Uuid();
final dateFormatter = DateFormat.yMd();

enum Category {
  food,
  bills,
  clothes,
  entertainment,
  transport,
  other,
}

const categoryIcons = {
  Category.food: Icons.lunch_dining,
  Category.bills: Icons.receipt_long,
  Category.clothes: Icons.shopping_bag,
  Category.entertainment: Icons.movie_edit,
  Category.transport: Icons.flight_takeoff,
  Category.other: Icons.category,
};

class Expense {
  Expense(
      {required this.title,
      required this.amount,
      required this.date,
      required this.category})
      : id = uuid.v4();

  final String id;
  final String title;
  final double amount;
  final DateTime date;
  final Category category;

  get formattedDate => dateFormatter.format(date);
}
