import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_expense_app/widgets/chart.dart';
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
      theme: ThemeData(
          textTheme: ThemeData.light().textTheme.copyWith(
              title: TextStyle(
                  fontFamily: 'OpenSans',
                  fontSize: 18.0,
                  fontWeight: FontWeight.bold),
              button: TextStyle(
                color: Colors.white,
              )),
          appBarTheme: AppBarTheme(
              textTheme: ThemeData.light().textTheme.copyWith(
                  title: TextStyle(fontFamily: 'OpenSans', fontSize: 20.0))),
          primarySwatch: Colors.purple,
          errorColor: Colors.red,
          accentColor: Colors.amber,
          fontFamily: 'QuickSand'),
      title: 'Personal Expenses',
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
      id: 't2',
      title: 'Tuition Fees',
      amount: 85.00,
      date: DateTime.now(),
    ),
    Transaction(
      id: 't3',
      title: 'University Fees',
      amount: 250.00,
      date: DateTime.now(),
    ),
    Transaction(
      id: 't4',
      title: 'Breakfast',
      amount: 39.49,
      date: DateTime.now(),
    ),
    Transaction(
      id: 't5',
      title: 'Lunch with friends',
      amount: 45.50,
      date: DateTime.now(),
    ),
    Transaction(
      id: 't6',
      title: 'Dinner with family',
      amount: 55.00,
      date: DateTime.now(),
    ),
    Transaction(
      id: 't7',
      title: 'Shopping',
      amount: 72.35,
      date: DateTime.now(),
    ),
    Transaction(
      id: 't8',
      title: 'New Shoes',
      amount: 69.99,
      date: DateTime.now(),
    ),
    Transaction(
      id: 't9',
      title: 'Weekly Groceries',
      amount: 50.5,
      date: DateTime.now(),
    ),
  ];

  bool _switchChart = false;

  List<Transaction> trans = [];

  List<Transaction> get _recentTransaction {
    return _userTransaction.where((tx) {
      return tx.date.isAfter(
        DateTime.now().subtract(
          Duration(days: 7),
        ),
      );
    }).toList();
  }

  void _deleteUserTransaction(String tId) {
    setState(() {
      _userTransaction.removeWhere((element) => element.id == tId);
    });
  }

  void _addNewTransaction(String title, double amount, DateTime selectedDate) {
    final newTx = Transaction(
      id: DateTime.now().toString(),
      title: title,
      amount: amount,
      date: selectedDate,
    );

    setState(() {
      _userTransaction.add(newTx);
    });
  }

  void _showTransactionModal(BuildContext ctx) {
    showModalBottomSheet(
      context: ctx,
      builder: (_) {
        return NewTransaction(_addNewTransaction);
      },
    );
  }

  @override
  Widget build(BuildContext context) {

    final isLandscape = MediaQuery.of(context).orientation == Orientation.landscape;

    final appBar = AppBar(
      actions: [
        IconButton(
            onPressed: () {
              _showTransactionModal(context);
            },
            icon: Icon(Icons.add))
      ],
      title: Text("Personal Expenses"),
      elevation: 0,
    );

    final txListWidget = Container(
      child: TransactionList(
          _userTransaction, _deleteUserTransaction),
      height: (MediaQuery.of(context).size.height -
          appBar.preferredSize.height -
          MediaQuery.of(context).padding.top) *
          0.7,
    );

    return Scaffold(
        floatingActionButton: FloatingActionButton(
          onPressed: () {
            _showTransactionModal(context);
          },
          child: Icon(Icons.add),
        ),
        appBar: appBar,
        body: SingleChildScrollView(
          child: Column(
            children: [
            if(isLandscape)  Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text('Show Chart'),
                  Switch(
                      value: _switchChart,
                      onChanged: (val) {
                        setState(() {
                          _switchChart = val;
                        });
                      }),
                ],
              ),
           if(!isLandscape) Container(
             child: Chart(_recentTransaction),
             height: (MediaQuery.of(context).size.height -
                 appBar.preferredSize.height -
                 MediaQuery.of(context).padding.top) *
                 0.3,
           ),
              if(!isLandscape) txListWidget,
              if(isLandscape) _switchChart ? Container(
                      child: Chart(_recentTransaction),
                      height: (MediaQuery.of(context).size.height -
                              appBar.preferredSize.height -
                              MediaQuery.of(context).padding.top) *
                          0.7,
                    )
                  : txListWidget
            ],
          ),
        ));
  }
}
