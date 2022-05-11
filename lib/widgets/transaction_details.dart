import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

class TransactionDetails extends StatelessWidget {
  const TransactionDetails(
      {Key? key, required this.title, required this.date, required this.amount})
      : super(key: key);

  final String title;
  final DateTime date;
  final double amount;

  @override
  Widget build(BuildContext context) {
    return Card(
      child: Row(
        children: [
          Container(
            margin: const EdgeInsets.symmetric(vertical: 10, horizontal: 15),
            decoration: BoxDecoration(
              border: Border.all(color: Colors.purple, width: 2),
            ),
            padding: const EdgeInsets.all(10),
            child: Text(
              '\$${amount.toStringAsFixed(2)}',
              style: const TextStyle(
                  fontWeight: FontWeight.bold,
                  fontSize: 18,
                  color: Colors.purple),
            ),
          ),
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                title,
                style:
                    const TextStyle(fontWeight: FontWeight.bold, fontSize: 16),
              ),
              Text(DateFormat().format(date), style: const TextStyle(color: Colors
                  .grey),),
            ],
          ),
        ],
      ),
    );
  }
}
