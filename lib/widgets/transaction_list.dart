import 'package:flutter/material.dart';

import './no-transactions.dart';
import '../models/transaction.dart';
import '../widgets/transaction_details.dart';

class TransactionList extends StatelessWidget {
  const TransactionList(this.transactions, {Key? key}) : super(key: key);

  final List<Transaction> transactions;

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 300,
      child: transactions.isEmpty
          ? const NoTransactions()
          : ListView.builder(
              itemBuilder: (context, index) {
                return TransactionDetails(
                    title: transactions[index].title,
                    date: transactions[index].date,
                    amount: transactions[index].amount);
              },
              itemCount: transactions.length,
            ),
    );
  }
}
