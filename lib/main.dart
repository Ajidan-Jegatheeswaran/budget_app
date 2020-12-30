import 'package:budget_app/widgets/transaction_list.dart';
import 'package:flutter/material.dart';
import 'models/transaction.dart';
import 'widgets/new_transactions.dart';

//Main Code
void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Budget App',
      home: MyHomePage(),
      theme: ThemeData(primaryColor: Colors.purple),
    );
  }
}

class MyHomePage extends StatefulWidget {
  @override
  _MyHomePageState createState() => _MyHomePageState();
}

//HomePage
class _MyHomePageState extends State<MyHomePage> {

  //Transaktionsliste
  final List<Transaction> _userTransactions = [
    Transaction(
      id: 't1',
      title: 'Neue Schuhe',
      amount: 69.95,
      date: DateTime.now(),
    ),
    Transaction(
      id: 't2',
      title: 'Kaffee',
      amount: 2.95,
      date: DateTime.now(),
    ),
  ];

  //Methode zum Hinzufügen von neuen Transaktionen
  void _addNewTransaction(String txTitle, double txAmount) {
    final newTx = Transaction(
      title: txTitle,
      amount: txAmount,
      date: DateTime.now(),
      id: DateTime.now().toString(),
    );
    setState(() {
      _userTransactions.add(newTx);
    });
  }

  //ModalBottomSheet
  void startAddNewTransaction(BuildContext context) {
    showModalBottomSheet(
        context: context,
        builder: (_) {
          return NewTransaction(_addNewTransaction);
        });
  }

  //Widget Build
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.purple,
        title: Text('Meine Budget'),
        actions: <Widget>[
          IconButton(
            icon: const Icon(Icons.add),
            onPressed: () => startAddNewTransaction(context),
          )
        ],
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          Container(
            child: Card(
              color: Colors.blue,
              child: Center(
                child: Text('Hier kommt später ein Chart rein'), //Chart
              ),
              elevation: 10,
            ),
          ),
          TransactionList(_userTransactions) //Transactionsliste
        ],
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat,
      floatingActionButton: FloatingActionButton(
        child: Icon(Icons.add),
        onPressed: () => startAddNewTransaction(context),
        backgroundColor: Colors.purple,
      ),
    );
  }
}
