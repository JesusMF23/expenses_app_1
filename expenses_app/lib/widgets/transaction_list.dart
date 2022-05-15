import 'package:flutter/material.dart';
import 'package:flutter/src/foundation/key.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:intl/intl.dart';
import '../models/transaction.dart';

class TransactionList extends StatelessWidget {
  final List<Transaction> transactions;

  TransactionList({required this.transactions});

  @override
  Widget build(BuildContext context) {
    return Container(
      alignment: Alignment.center,
      height: 400,
      child:
          //if statement to check if the list is empty
          transactions.isEmpty
              ? Column(
                  children: <Widget>[
                    Text(
                      "No Transactions",
                      style: Theme.of(context).textTheme.headline6,
                    ),
                    SizedBox(
                      height: 20,
                    ),
                    Container(
                      height: 300,
                      child: Image.asset(
                        "assets/images/waiting.png",
                        fit: BoxFit.cover,
                      ),
                    ),
                  ],
                )
              //if not empty, display the list
              : ListView.builder(
                  itemBuilder: (context, index) {
                    return Card(
                      child: Row(
                        children: <Widget>[
                          Container(
                              margin: EdgeInsets.symmetric(
                                vertical: 10,
                                horizontal: 15,
                              ),
                              child: Text(
                                "\$ ${transactions[index].amount.toStringAsFixed(2)}",
                                // \$ is a special character in dart
                                //interpolating string to call variables
                                style: TextStyle(
                                  fontSize: 20,
                                  fontWeight: FontWeight.bold,
                                  color: Theme.of(context).primaryColorDark,
                                ),
                              ),
                              decoration: BoxDecoration(
                                  border: Border.all(
                                color: Theme.of(context).primaryColorLight,
                                width: 2,
                              )),
                              padding: EdgeInsets.all(10)),
                          Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: <Widget>[
                              Text(
                                transactions[index].title,
                                style: Theme.of(context).textTheme.headline6,
                              ),
                              Text(
                                DateFormat.yMEd("es_ES")
                                    .format(transactions[index].date),
                                style: Theme.of(context).textTheme.bodyText2,
                              )
                            ],
                          )
                        ],
                      ),
                    );
                  },
                  itemCount: transactions.length,
                ),
    );
  }
}
