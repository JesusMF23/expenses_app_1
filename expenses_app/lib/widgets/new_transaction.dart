import 'package:flutter/material.dart';
import 'package:flutter/src/foundation/key.dart';
import 'package:flutter/src/widgets/framework.dart';
import './transaction_list.dart';

class NewTransaction extends StatefulWidget {
  final Function addNewTransaction;

  NewTransaction({required this.addNewTransaction});

  @override
  State<NewTransaction> createState() => _NewTransactionState();
}

class _NewTransactionState extends State<NewTransaction> {
  final titleController = TextEditingController();

  final amountController = TextEditingController();

  void submitData() {
    final enteredTitle = titleController.text;
    final enteredAmount = double.parse(amountController.text);

    if (enteredTitle.isEmpty || enteredAmount <= 0) {
      return;
      //return stops the function from running, we don't each the function to run
    }

    //with widget.addNewTransaction we can access the function from the other class
    widget.addNewTransaction(
      enteredTitle,
      enteredAmount,
    );

    Navigator.pop(context);
  }

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
            onSubmitted: (_) {
              submitData();
            },
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
            keyboardType: TextInputType.number,
            onSubmitted: (_) {
              submitData();
            },
            // we use _ when flutter needs a parameter but we don't need it
            // onChanged: (val) => amountInput = val,
          ),
          TextButton(
            onPressed: () {
              submitData();
            },
            child: Text("Add transaction",
                style: TextStyle(color: Colors.green[800])),
          )
        ]),
      ),
    );
  }
}
