import 'package:expense_tracker_app_responsive/models/expense.dart';
import 'package:expense_tracker_app_responsive/widgets/expenses_list/expense_item.dart';
import 'package:flutter/material.dart';

class ExpenesesList extends StatelessWidget {
  const ExpenesesList({
    super.key,
    required this.expenses,
    required this.onRemoveExpense,
  });

  final List<Expense> expenses;
  final Function(Expense expense) onRemoveExpense;

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      itemCount: expenses.length,
      itemBuilder: (ctx, index) => Dismissible(
        key: ValueKey(expenses[index]),
        background: Container(
          color: Theme.of(context).colorScheme.error.withOpacity(.75),
          margin: EdgeInsets.symmetric(
              horizontal: Theme.of(context).cardTheme.margin!.horizontal),
        ),
        onDismissed: (direction) => {
          onRemoveExpense(expenses[index]),
        },
        child: ExpenseItem(expenses[index]),
      ),
    );
  }
}
