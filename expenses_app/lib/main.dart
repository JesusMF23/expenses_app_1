import 'package:expenses_app/widgets/chart.dart';
import 'package:expenses_app/widgets/new_transaction.dart';
import 'package:expenses_app/widgets/transaction_list.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:intl/date_symbol_data_local.dart';
import './models/transaction.dart';
import './widgets/chart.dart';

void main() {
  // WidgetsFlutterBinding.ensureInitialized();
  // SystemChrome.setPreferredOrientations(
  //     [DeviceOrientation.portraitDown, DeviceOrientation.portraitUp]);
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Expenses App',
      theme: ThemeData(
        primarySwatch: Colors.blueGrey,
        colorScheme: ColorScheme(
          primary: Colors.blueGrey,
          primaryContainer: Colors.blueGrey[800],
          secondary: Color.fromARGB(255, 144, 202, 249),
          secondaryContainer: Colors.blueGrey[900],
          surface: Color.fromARGB(255, 38, 50, 56),
          background: Color.fromARGB(255, 38, 50, 56),
          error: Colors.red,
          onPrimary: Colors.white,
          onSecondary: Colors.blueGrey,
          onSurface: Colors.blueGrey,
          onBackground: Colors.white,
          onError: Colors.white,
          brightness: Brightness.light,
        ),
        fontFamily: 'Quicksand',
        textSelectionTheme: TextSelectionThemeData(
          cursorColor: Color.fromARGB(255, 38, 56, 39),
          selectionColor: Colors.white,
        ),
        textTheme: ThemeData.light().textTheme.copyWith(
            headline6: TextStyle(
              fontFamily: "OpenSans",
              fontWeight: FontWeight.bold,
              fontSize: 15,
            ),
            bodyText2: TextStyle(
              fontFamily: "OpenSans",
              fontWeight: FontWeight.w500,
              fontSize: 10,
              color: Colors.grey[600],
            ),
            button: TextStyle(color: Colors.white)),
        appBarTheme: AppBarTheme(
          titleTextStyle: ThemeData.light()
              .textTheme
              .copyWith(
                headline6: TextStyle(
                    fontFamily: 'OpenSans',
                    fontSize: 20,
                    fontWeight: FontWeight.bold,
                    color: Colors.white),
              )
              .headline6,
        ),
      ),
      home: MyHomePage(),
    );
  }
}

class MyHomePage extends StatefulWidget {
  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  // late String titleInput;

  final List<Transaction> _userTransactions = [
    // Transaction(
    //   id: 't1',
    //   title: 'New Shoes',
    //   amount: 69.99,
    //   date: DateTime.now(),
    // ),
    // Transaction(
    //   id: 't2',
    //   title: 'Weekly Groceries',
    //   amount: 16.53,
    //   date: DateTime.now(),
    // ),
  ];

  List<Transaction> get _recentTransactions {
    return _userTransactions.where((tx) {
      return tx.date.isAfter(DateTime.now().subtract(Duration(days: 7)));
    }).toList();
  }

  void _addNewTransaction(
      String txTitle, double txAmount, DateTime chosenDate) {
    final newTx = Transaction(
      title: txTitle,
      amount: txAmount,
      date: chosenDate,
      id: DateTime.now().toString(),
    );

    setState(() {
      _userTransactions.add(newTx);
    });
  }

  void _deleteTransaction(String id) {
    setState(() {
      _userTransactions.removeWhere((tx) {
        return tx.id == id;
      });
    });
  }

  void _startAddNewTransaction(BuildContext ctx) {
    showModalBottomSheet(
        context: ctx,
        builder: (_) {
          return NewTransaction(addNewTransaction: _addNewTransaction);
        });
  }

  @override
  Widget build(BuildContext context) {
    initializeDateFormatting("es_ES", null);
    final appBar = AppBar(
      title: Text(
        "Expenses App",
      ),
      actions: [
        IconButton(
            onPressed: () => _startAddNewTransaction(context),
            icon: Icon(Icons.add))
      ],
    );
    //initialize locale formating
    return Scaffold(
      appBar: appBar,
      body: SingleChildScrollView(
        child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.end,
            children: <Widget>[
              Container(
                  height: (MediaQuery.of(context).size.height -
                          appBar.preferredSize.height -
                          MediaQuery.of(context).padding.top) *
                      0.3,
                  child: Chart(_recentTransactions)),
              Container(
                  height: (MediaQuery.of(context).size.height -
                          appBar.preferredSize.height -
                          MediaQuery.of(context).padding.top) *
                      0.7,
                  child:
                      TransactionList(_userTransactions, _deleteTransaction)),
            ]),
      ),
      floatingActionButton: FloatingActionButton(
        child: Icon(Icons.add),
        onPressed: () => _startAddNewTransaction(context),
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat,
    );
  }
}
