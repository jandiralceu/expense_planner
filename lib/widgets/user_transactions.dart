import 'package:flutter/material.dart';

import '../models/transaction.dart';
import './transaction_create.dart';
import './transaction_list.dart';

class UserTransactions extends StatefulWidget {
  UserTransactions({Key? key}) : super(key: key);

  @override
  State<UserTransactions> createState() => _UserTransactionsState();
}

class _UserTransactionsState extends State<UserTransactions> {
  final List<Transaction> _transactions = [
    Transaction(
        id: '1', title: 'Nike Air Max 90', amount: 69.99, date: DateTime.now()),
    Transaction(
        id: '2',
        title: 'Adidas Superstar',
        amount: 69.99,
        date: DateTime.now()),
    Transaction(
        id: '3', title: 'Puma Suede', amount: 69.99, date: DateTime.now()),
  ];

  void _addNewTransaction(String title, double amount) {
    setState(() {
      _transactions.add(Transaction(
        id: DateTime.now().toString(),
        title: title,
        amount: amount,
        date: DateTime.now(),
      ));
    });
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        NewTransaction(_addNewTransaction),
        TransactionList(_transactions),
      ],
    );
  }
}
