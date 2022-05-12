import 'package:flutter/material.dart';

import './widgets/Chart.dart';
import './models/transaction.dart';
import './widgets/transaction_list.dart';
import './widgets/transaction_create.dart';

void main() => runApp(const MyApp());

class MyApp extends StatefulWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  final List<Transaction> _transactions = [];

  void _addNewTransaction(String title, double amount, DateTime date) {
    setState(() {
      _transactions.add(Transaction(
        id: DateTime.now().toString(),
        title: title,
        amount: amount,
        date: date,
      ));
    });
  }

  void _startAddNewTransaction(BuildContext context) {
    showModalBottomSheet(
        context: context,
        builder: (_) {
          return GestureDetector(
            onTap: () {},
            child: NewTransaction(_addNewTransaction),
            behavior: HitTestBehavior.opaque,
          );
        });
  }

  void _deleteTransaction(String id) {
    setState(() {
      _transactions.removeWhere((transaction) => transaction.id == id);
    });
  }

  @override
  Widget build(BuildContext context) {
    final appBar = AppBar(
      title: const Text('Personal Expenses'),
      actions: [
        IconButton(
          onPressed: () => _startAddNewTransaction(context),
          icon: const Icon(Icons.add),
        ),
      ],
    );

    return MaterialApp(
      home: Builder(
        builder: (BuildContext context) {
          return Scaffold(
            appBar: appBar,
            body: SingleChildScrollView(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.stretch,
                children: [
                  SizedBox(
                    height: (MediaQuery.of(context).size.height -
                            appBar.preferredSize.height -
                            MediaQuery.of(context).padding.top) *
                        0.3,
                    child: Chart(_transactions),
                  ),
                  SizedBox(
                      height: (MediaQuery.of(context).size.height -
                              appBar.preferredSize.height -
                              MediaQuery.of(context).padding.top) *
                          0.7,
                      child:
                          TransactionList(_transactions, _deleteTransaction)),
                ],
              ),
            ),
            floatingActionButtonLocation:
                FloatingActionButtonLocation.centerFloat,
            floatingActionButton: FloatingActionButton(
              child: const Icon(Icons.add),
              onPressed: () => _startAddNewTransaction(context),
            ),
          );
        },
      ),
      theme: ThemeData(
        fontFamily: 'Quicksand',
        primarySwatch: Colors.purple,
        accentColor: Colors.amber,
        appBarTheme: const AppBarTheme(
          titleTextStyle: TextStyle(
            fontSize: 20,
            fontFamily: 'OpenSans',
            fontWeight: FontWeight.bold,
          ),
        ),
        textTheme: ThemeData.light().textTheme.copyWith(
              headline6: const TextStyle(
                fontSize: 18,
                fontFamily: 'OpenSans',
                fontWeight: FontWeight.bold,
              ),
            ),
      ),
    );
  }
}
