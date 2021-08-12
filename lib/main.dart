import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_expense_app/widgets/new_transaction.dart';
import 'package:flutter_expense_app/widgets/transaction_list.dart';

import 'models/transaction.dart';

void main() {
  runApp(MyApp());
}
class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter App',
      home: MyHomePage(),
    );
  }
}


class MyHomePage extends StatefulWidget {
  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {


  final List<Transaction> _userTransaction = [
    Transaction(
      id: 't1',
      title: 'Monthly business committee',
      amount: 50.00,
      date: DateTime.now(),
    ),
    Transaction(
      id: 't1',
      title: 'Tuition Fees',
      amount: 85.00,
      date: DateTime.now(),
    ),
    Transaction(
      id: 't1',
      title: 'University Fees',
      amount: 250.00,
      date: DateTime.now(),
    ),
    Transaction(
      id: 't1',
      title: 'Breakfast',
      amount: 39.49,
      date: DateTime.now(),
    ),
    Transaction(
      id: 't1',
      title: 'Lunch with friends',
      amount: 45.50,
      date: DateTime.now(),
    ),
    Transaction(
      id: 't1',
      title: 'Dinner with family',
      amount: 55.00,
      date: DateTime.now(),
    ),
    Transaction(
      id: 't1',
      title: 'Shopping',
      amount: 72.35,
      date: DateTime.now(),
    ),
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

  void _addNewTransaction(String title, double amount) {
    final newTx = Transaction(
      id: DateTime.now().toString(),
      title: title,
      amount: amount,
      date: DateTime.now(),
    );

    setState(() {
      _userTransaction.add(newTx);
    });
  }

  void _showTransactionModal(BuildContext ctx){
    showModalBottomSheet(context: ctx, builder: (_) {

return NewTransaction(_addNewTransaction);
    },);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(

        floatingActionButton: FloatingActionButton(
          backgroundColor: Colors.purple,
          onPressed: (){
            _showTransactionModal(context);
          },
          child: Icon(Icons.add),
        ),
          appBar: AppBar(
            actions: [
              IconButton(onPressed: (){
                _showTransactionModal(context);
              }, icon: Icon(Icons.add))
            ],
            title: Text("My Expense App"),
            backgroundColor: Colors.purple,
            elevation: 0,
          ),
          body: SingleChildScrollView(
            child: Column(
              children: [
                Card(
                  child: Container(
                    child: Text('CHART'),
                    width: double.infinity,
                  ),
                ),
                TransactionList(_userTransaction),
              ],
            ),
          ));

  }
}
