import 'package:flutter/material.dart';

class NoTransactions extends StatelessWidget {
  const NoTransactions({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        const Text('No content available'),
        const SizedBox(
          height: 10,
        ),
        SizedBox(
          height: 200,
          child: Image.asset(
            'assets/images/waiting.png',
            fit: BoxFit.cover,
          ),
        )
      ],
    );
  }
}
