import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

import './no_transactions.dart';
import '../models/transaction.dart';

class TransactionList extends StatelessWidget {
  const TransactionList(this.transactions, this.deleteTransaction, {Key? key})
      : super(key: key);

  final Function deleteTransaction;
  final List<Transaction> transactions;

  @override
  Widget build(BuildContext context) {
    return transactions.isEmpty
        ? const NoTransactions()
        : ListView.builder(
            itemBuilder: (context, index) {
              return Card(
                margin: const EdgeInsets.symmetric(
                  vertical: 8,
                  horizontal: 5,
                ),
                elevation: 5,
                child: ListTile(
                  leading: CircleAvatar(
                    radius: 30,
                    child: Padding(
                      padding: const EdgeInsets.all(6.0),
                      child: FittedBox(
                        child: Text(
                          '\$${transactions[index].amount}',
                        ),
                      ),
                    ),
                  ),
                  title: Text(
                    transactions[index].title,
                    style: Theme.of(context).textTheme.headline6,
                  ),
                  subtitle: Text(
                    DateFormat.yMMMd().format(transactions[index].date),
                  ),
                  trailing: IconButton(
                    icon: const Icon(Icons.delete),
                    color: Theme.of(context).errorColor,
                    onPressed: () => deleteTransaction(transactions[index].id),
                  ),
                ),
              );
            },
            itemCount: transactions.length,
          );
  }
}
