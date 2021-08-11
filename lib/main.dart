import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_expense_app/widgets/new_transaction.dart';
import 'package:flutter_expense_app/widgets/transaction_list.dart';
import 'package:flutter_expense_app/widgets/user_transaction.dart';
import 'package:intl/intl.dart';

void main() {
  runApp(MyHomePage());
}

class MyHomePage extends StatelessWidget {
  var titleController = TextEditingController();
  var amountController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
          appBar: AppBar(
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
                UserTransactions(),
              ],
            ),
          )),
    );
  }
}
