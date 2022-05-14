import 'package:expenses_app/widgets/user_transactions.dart';
import 'package:flutter/material.dart';
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
        primarySwatch: Colors.green,
      ),
      home: MyHomePage(),
    );
  }
}

class MyHomePage extends StatelessWidget {
  // late String titleInput;
  // late String amountInput;

  final titleController = TextEditingController();
  final amountController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    initializeDateFormatting("es_ES", null);
    //initialize locale formating
    return Scaffold(
      appBar: AppBar(
        title: Text("Flutter App"),
        actions: [IconButton(onPressed: () {}, icon: Icon(Icons.add))],
      ),
      body: SingleChildScrollView(
        child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.end,
            children: <Widget>[
              Container(
                child: Card(
                  child: Text(
                    "Chart",
                    textAlign: TextAlign.center,
                  ),
                  color: Colors.green[600],
                  elevation: 5,
                  //double.infinity, to make the card as wide as the screen
                ),
                width: double.infinity,
                //a card size depends on the content widget
                //we need to wrap card widget inside a widget where we can change size
              ),
              UserTransactions()
            ]),
      ),
      floatingActionButton: FloatingActionButton(
        child: Icon(Icons.add),
        onPressed: () {},
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat,
    );
  }
}
