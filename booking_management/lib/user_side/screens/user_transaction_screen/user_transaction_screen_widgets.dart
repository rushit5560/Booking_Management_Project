import 'package:flutter/material.dart';

class TransactionListModule extends StatelessWidget {
  const TransactionListModule({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      itemCount: 5,
      itemBuilder: (context, i) {
        return Container();
      },
    );
  }
}
