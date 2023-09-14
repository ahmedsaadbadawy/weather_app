import 'package:flutter/material.dart';

class DefaulBody extends StatelessWidget {
  const DefaulBody({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return const Center(
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          Text(
            'There is no Weather 😶‍🌫️ start',
            style: TextStyle(fontSize: 30),
          ),
          Text(
            'Searching now 🔎',
            style: TextStyle(fontSize: 30),
          ),
        ],
      ),
    );
  }
}