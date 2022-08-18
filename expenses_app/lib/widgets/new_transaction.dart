import 'package:flutter/material.dart';
import 'package:flutter/src/foundation/key.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:intl/intl.dart';
import './transaction_list.dart';

class NewTransaction extends StatefulWidget {
  final Function addNewTransaction;

  NewTransaction({required this.addNewTransaction});

  @override
  State<NewTransaction> createState() => _NewTransactionState();
}

class _NewTransactionState extends State<NewTransaction> {
  final _titleController = TextEditingController();
  final _amountController = TextEditingController();
  DateTime? _selectedDate;

  void _submitData() {
    if (_amountController.text.isEmpty) {
      return;
    }
    final enteredTitle = _titleController.text;
    final enteredAmount = double.parse(_amountController.text);

    if (enteredTitle.isEmpty || enteredAmount <= 0 || _selectedDate == null) {
      return;
      //return stops the function from running, we don't each the function to run
    }

    //with widget.addNewTransaction we can access the function from the other class
    widget.addNewTransaction(
      enteredTitle,
      enteredAmount,
      _selectedDate,
    );

    Navigator.pop(context);
  }

  void _presentDatePicker() {
    showDatePicker(
            context: context,
            initialDate: DateTime.now(),
            firstDate: DateTime(2022),
            lastDate: DateTime.now())
        .then((pickedDate) {
      if (pickedDate == null) {
        return;
      }
      setState(() {
        _selectedDate = pickedDate;
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Card(
        elevation: 5,
        child: Container(
          padding: EdgeInsets.only(
              bottom: MediaQuery.of(context).viewInsets.bottom + 10,
              top: 10,
              left: 10,
              right: 10),
          child: Column(
              crossAxisAlignment: CrossAxisAlignment.end,
              children: <Widget>[
                TextField(
                  decoration: InputDecoration(
                      labelText: "Title",
                      labelStyle:
                          TextStyle(color: Theme.of(context).primaryColorDark),
                      enabledBorder: UnderlineInputBorder(
                          borderSide: BorderSide(
                              color: Theme.of(context).primaryColorLight)),
                      focusedBorder: UnderlineInputBorder(
                          borderSide: BorderSide(
                              color: Theme.of(context).primaryColorLight))),
                  cursorColor: ThemeData.light().textSelectionTheme.cursorColor,
                  controller: _titleController,
                  onSubmitted: (_) {
                    _submitData();
                  },
                  // onChanged: (val) {
                  //   titleInput = val;
                  // },
                ),
                TextField(
                  decoration: InputDecoration(
                      labelText: "Amount",
                      labelStyle:
                          TextStyle(color: Theme.of(context).primaryColorDark),
                      enabledBorder: UnderlineInputBorder(
                          borderSide: BorderSide(
                              color: Theme.of(context).primaryColorLight)),
                      focusedBorder: UnderlineInputBorder(
                          borderSide: BorderSide(
                              color: Theme.of(context).primaryColorLight))),
                  cursorColor: ThemeData.light().textSelectionTheme.cursorColor,
                  controller: _amountController,
                  keyboardType: TextInputType.number,
                  onSubmitted: (_) {
                    _submitData();
                  },
                  // we use _ when flutter needs a parameter but we don't need it
                  // onChanged: (val) => amountInput = val,
                ),
                Container(
                  height: 70,
                  child: Row(
                    children: <Widget>[
                      Expanded(
                        child: Text(_selectedDate == null
                            ? "No Date Chosen!"
                            : "Picked Date: ${DateFormat.yMMMd().format(_selectedDate!)}"),
                      ),
                      TextButton(
                          onPressed: _presentDatePicker,
                          child: Text(
                            "Choose Date",
                            style: TextStyle(
                                color: Theme.of(context).primaryColor,
                                fontWeight: FontWeight.bold),
                          )),
                    ],
                  ),
                ),
                ElevatedButton(
                  onPressed: () {
                    _submitData();
                  },
                  style: ButtonStyle(
                    backgroundColor: MaterialStateProperty.all(
                      Theme.of(context).primaryColor,
                    ),
                    foregroundColor: MaterialStateProperty.all(
                      Colors.white,
                    ),
                  ),
                  child: Text("Add transaction",
                      style: TextStyle(
                          color: Theme.of(context).textTheme.button!.color)),
                )
              ]),
        ),
      ),
    );
  }
}
