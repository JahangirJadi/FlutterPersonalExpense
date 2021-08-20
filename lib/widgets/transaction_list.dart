
import 'package:flutter/material.dart';
import 'package:flutter_expense_app/models/transaction.dart';
import 'package:intl/intl.dart';

class TransactionList extends StatelessWidget {
  final List<Transaction> _userTransaction;
  final Function deleteTx;

  TransactionList(
    this._userTransaction,
    this.deleteTx,
  );

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.all(8),
      child: _userTransaction.isEmpty
          ? LayoutBuilder(builder: (ctx,constraints){
            return Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(
                  'No transactions added yet',
                  style: Theme.of(context).textTheme.title,
                ),
                SizedBox(
                  height: 40,
                ),
                Container(
                  child: Image.asset(
                    'assets/images/waiting.png',
                    fit: BoxFit.cover,
                  ),
                  height: constraints.maxHeight * 0.6,
                )
              ],
            );
      })
          : ListView.builder(
              itemCount: _userTransaction.length,
              itemBuilder: (context, index) {
                return Card(
                  elevation: 5,
                  child: ListTile(
                    leading: CircleAvatar(
                      child: Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: FittedBox(
                          child: Text('\$${_userTransaction[index].amount}'),
                        ),
                      ),
                      radius: 30,
                    ),
                    title: Text(
                      _userTransaction[index].title,
                      style: Theme.of(context).textTheme.title,
                    ),
                    trailing: IconButton(
                      onPressed: () => deleteTx( _userTransaction[index].id),
                      color: Theme.of(context).errorColor,
                      icon: Icon(Icons.delete),
                    ),
                    subtitle: Text(DateFormat.yMMMEd()
                        .format(_userTransaction[index].date)),
                  ),
                );
              },
            ),
    );
  }
}
