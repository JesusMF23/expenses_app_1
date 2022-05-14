import 'package:flutter/material.dart';
import 'package:flutter/src/foundation/key.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:intl/intl.dart';
import '../models/transaction.dart';
import './user_transactions.dart';

class TransactionList extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Column(
      children: userTransactions.map((tx) {
        //dynamically build widgets mapping each transaction to a widget
        return Card(
          child: Row(
            children: <Widget>[
              Container(
                  margin: EdgeInsets.symmetric(
                    vertical: 10,
                    horizontal: 15,
                  ),
                  child: Text(
                    "\$ ${tx.amount}",
                    // \$ is a special character in dart
                    //interpolating string to call variables
                    style: TextStyle(
                      fontSize: 20,
                      fontWeight: FontWeight.bold,
                      color: Colors.purple[800],
                    ),
                  ),
                  decoration: BoxDecoration(
                      border: Border.all(
                    color: Color.fromARGB(255, 106, 27, 154),
                    width: 2,
                  )),
                  padding: EdgeInsets.all(10)),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget>[
                  Text(
                    tx.title,
                    style: TextStyle(
                      fontSize: 16,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  Text(
                    DateFormat.yMEd("es_ES").format(tx.date),
                    style: TextStyle(
                      fontSize: 12,
                      color: Colors.grey[600],
                    ),
                  )
                ],
              )
            ],
          ),
        );
      }).toList(),
      // width: double.infinity,
    );
  }
}
