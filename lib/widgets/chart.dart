import 'package:flutter/material.dart';
import 'package:flutter_expense_app/models/transaction.dart';
import 'package:flutter_expense_app/widgets/chart_bar.dart';
import 'package:intl/intl.dart';

class Chart extends StatelessWidget {
  final List<Transaction> last7DaysTransactions;

  List<Map<String, Object>> get groupedTransactionValues {
    return List.generate(7, (index) {
      final weekDay = DateTime.now().subtract(Duration(days: index));

      var totalSum = 0.0;

      for (var i = 0; i < last7DaysTransactions.length; i++) {
        if (last7DaysTransactions[i].date.day == weekDay.day &&
            last7DaysTransactions[i].date.month == weekDay.month &&
            last7DaysTransactions[i].date.year == weekDay.year) {
          totalSum += last7DaysTransactions[i].amount;
        }
      }

      return {
        'day': DateFormat.E().format(weekDay),
        'amount': totalSum,
      };
    }).reversed.toList();
  }

  double get totalMaxSpending {
    return groupedTransactionValues.fold(0.0, (sum, item) {
      return sum + (item['amount'] as double);
    });
  }

  Chart(this.last7DaysTransactions);

  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 4,
      margin: EdgeInsets.all(8),
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: groupedTransactionValues.map((data) {
            return Flexible(
              fit: FlexFit.tight,
              child: ChartBar(
                (data['day'] as String),
                (data['amount'] as double),
                totalMaxSpending == 0?0.0:(data['amount'] as double) / totalMaxSpending,
              ),
            );
          }).toList(),
        ),
      ),
    );
  }
}
