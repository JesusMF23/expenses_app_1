import 'package:flutter/material.dart';
import 'package:flutter/src/foundation/key.dart';
import 'package:flutter/src/widgets/framework.dart';
import './transaction_list.dart';

class NewTransaction extends StatelessWidget {
  final titleController = TextEditingController();
  final amountController = TextEditingController();

  get addNewTransaction => addNewTransaction;

  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 5,
      child: Container(
        padding: EdgeInsets.all(10),
        child: Column(crossAxisAlignment: CrossAxisAlignment.end, children: <
            Widget>[
          TextField(
            decoration: InputDecoration(
                labelText: "Title",
                labelStyle: TextStyle(color: Colors.green[800]),
                enabledBorder: UnderlineInputBorder(
                    borderSide:
                        BorderSide(color: Color.fromARGB(255, 46, 125, 50))),
                focusedBorder: UnderlineInputBorder(
                    borderSide:
                        BorderSide(color: Color.fromARGB(255, 46, 125, 50)))),
            cursorColor: Colors.green[600],
            controller: titleController,
            // onChanged: (val) {
            //   titleInput = val;
            // },
          ),
          TextField(
            decoration: InputDecoration(
                labelText: "Amount",
                labelStyle: TextStyle(color: Colors.green[800]),
                enabledBorder: UnderlineInputBorder(
                    borderSide:
                        BorderSide(color: Color.fromARGB(255, 46, 125, 50))),
                focusedBorder: UnderlineInputBorder(
                    borderSide:
                        BorderSide(color: Color.fromARGB(255, 46, 125, 50)))),
            cursorColor: Colors.green[600],
            controller: amountController,
            // onChanged: (val) => amountInput = val,
          ),
          TextButton(
            onPressed: () {
              addNewTransaction;
              print(amountController.text);
              print(titleController.text);
              // transactions.add(Transaction(
              //     id: DateTime.now().toString(),
              //     title: titleController.text,
              //     amount: double.parse(amountController.text),
              //     date: DateTime.now()));
            },
            child: Text("Add transaction",
                style: TextStyle(color: Colors.green[800])),
          )
        ]),
      ),
    );
  }
}
