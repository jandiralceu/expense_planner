import 'package:intl/intl.dart';
import 'package:flutter/material.dart';

import './chart_bar.dart';
import '../models/transaction.dart';

class Chart extends StatelessWidget {
  const Chart(this.recentTransactions, {Key? key}) : super(key: key);

  final List<Transaction> recentTransactions;

  List<Map<String, Object>> get groupedTransactionValues {
    return List.generate(
      7,
      (index) {
        final weekDay = DateTime.now().subtract(
          Duration(days: index),
        );
        var totalSum = 0.0;

        for (var transaction in recentTransactions) {
          if (transaction.date.day == weekDay.day &&
              transaction.date.month == weekDay.month &&
              transaction.date.year == weekDay.year) {
            totalSum += transaction.amount;
          }
        }

        return {
          'day': DateFormat.E().format(weekDay).substring(0, 1),
          'amount': totalSum
        };
      },
    ).reversed.toList();
  }

  double get totalSpending {
    return groupedTransactionValues.fold(
        0.0,
        (previousValue, element) =>
            previousValue + (element['amount'] as double));
  }

  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 6,
      margin: const EdgeInsets.all(20),
      child: Padding(
        padding: const EdgeInsets.all(10.0),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: groupedTransactionValues.map(
                (transaction) {
              return Flexible(
                fit: FlexFit.tight,
                child: ChartBar(
                    transaction['day'] as String,
                    transaction['amount'] as double,
                    totalSpending == 0.0
                        ? 0.0
                        : (transaction['amount'] as double) / totalSpending),
              );
            },
          ).toList(),
        ),
      ),
    );
  }
}
