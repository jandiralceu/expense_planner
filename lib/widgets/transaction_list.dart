import 'package:flutter/material.dart';

import '../models/transaction.dart';
import '../widgets/transaction_details.dart';

class TransactionList extends StatelessWidget {
  const TransactionList(this.transactions, {Key? key}) : super(key: key);

  final List<Transaction> transactions;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: transactions.map((transaction) {
        return TransactionDetails(
            title: transaction.title,
            date: transaction.date,
            amount: transaction.amount);
      }).toList(),
    );
  }
}
