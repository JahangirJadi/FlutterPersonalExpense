import 'package:flutter/material.dart';
import 'package:flutter_expense_app/models/transaction.dart';
import 'package:intl/intl.dart';

class TransactionList extends StatelessWidget {
  final List<Transaction> _userTransaction;

  TransactionList(this._userTransaction);

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.all(8),
      height: 350,
      child: ListView (
        children: _userTransaction.map((tx) {
          return Card(
            elevation: 4,
            margin: EdgeInsets.all(8),
            child: Row(
              children: [
                Container(
                  child: Text(
                    '\$${tx.amount}',
                    style: TextStyle(
                      fontWeight: FontWeight.bold,
                      fontSize: 20,
                      color: Colors.purple,
                    ),
                  ),
                  margin: EdgeInsets.symmetric(
                    vertical: 10,
                    horizontal: 15,
                  ),
                  decoration: BoxDecoration(
                    border: Border.all(
                      color: Colors.purple,
                      width: 1.0,
                    ),
                  ),
                  padding: EdgeInsets.symmetric(vertical: 2, horizontal: 4),
                  width: 80,
                  alignment: Alignment.center,
                ),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      tx.title,
                      style: TextStyle(
                          fontSize: 14, fontWeight: FontWeight.bold),
                      textAlign: TextAlign.start,
                    ),
                    Text(
                      DateFormat.yMMMEd().format(tx.date),
                      style: TextStyle(
                        color: Colors.grey,
                        fontSize: 11,
                      ),
                      textAlign: TextAlign.left,
                    ),
                  ],
                )
              ],
            ),
          );
        }).toList(),
      ),
    );
  }
}
