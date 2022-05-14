import 'package:expenses_app/transaction.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:intl/date_symbol_data_local.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: MyHomePage(),
    );
  }
}

class MyHomePage extends StatelessWidget {
  final List<Transaction> transactions = [
    Transaction(
        id: "t1", title: "New Shoes", amount: 69.99, date: DateTime.now()),
    Transaction(
        id: "t2", title: "Groceries", amount: 14.99, date: DateTime.now()),
  ];

  @override
  Widget build(BuildContext context) {
    initializeDateFormatting("es_ES", null);
    //initialize locale formating
    return Scaffold(
      appBar: AppBar(
        title: Text("Flutter App"),
      ),
      body: Column(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          crossAxisAlignment: CrossAxisAlignment.end,
          children: <Widget>[
            Card(
              child: Container(
                child: Text(
                  "Chart",
                  textAlign: TextAlign.center,
                ),
                width: double.infinity,
                //double.infinity, to make the card as wide as the screen
              ),
              //a card size depends on the content widget
              //we need to wrap card widget inside a widget where we can change size
              color: Colors.green[600],
              elevation: 5,
            ),
            Column(
              children: transactions.map((tx) {
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
            ),
          ]),
    );
  }
}
