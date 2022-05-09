import 'package:flutter/material.dart';

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
  @override
  Widget build(BuildContext context) {
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
            Container(
              child: Card(
                child: Text("List of texts"),
                color: Colors.blue,
              ),
              // width: double.infinity,
            ),
          ]),
    );
  }
}
