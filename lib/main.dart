import 'package:flutter/material.dart';
import 'package:flutter_expense_app/model/transaction.dart';

void main() {
  runApp(MyHomePage());
}

class MyHomePage extends StatelessWidget {
  final List<Transaction> transactions = [
    Transaction(
      id: 't1',
      title: 'New Shoes',
      amount: 69.99,
      date: DateTime.now(),
    ),
    Transaction(
      id: 't2',
      title: 'Weekly Groceries',
      amount: 50.5,
      date: DateTime.now(),
    ),
  ];

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
          appBar: AppBar(
            title: Text("My Expense App"),
            backgroundColor: Colors.redAccent,
            elevation: 0,
          ),
          body: Column(
            children: [
              Card(
                child: Container(
                  child: Text('CHART'),
                  width: double.infinity,
                ),
              ),
              Column(
                children: transactions.map((tx) {
                  return Card(
                    child: Row(
                      children: [
                        Container(
                          child: Text(
                            tx.amount.toString(),
                          ),
                          margin: EdgeInsets.symmetric(
                            vertical: 10,
                            horizontal: 15,
                          ),
                          decoration: BoxDecoration(
                            border: Border.all(
                              color: Colors.black,
                              width: 1.0,
                            ),
                          ),
                          padding: EdgeInsets.symmetric(vertical: 2,horizontal: 4),
                        ),
                        Column(
                          children: [
                            Text(tx.title),
                            Text(tx.date.toString()),
                          ],
                        )
                      ],
                    ),
                  );
                }).toList(),
              ),
            ],
          )),
    );
  }
}
