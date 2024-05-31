import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'models/connection.dart';
import 'widgets/connection_list.dart';

class HomeScreen extends StatefulWidget {
  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('CRMApp'),
      ),
      body: ConnectionList(),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          // Navigate to Add Connection Screen
          Navigator.of(context).push(MaterialPageRoute(
              builder: (context) => AddConnectionScreen()));
        },
        child: Icon(Icons.add),
      ),
    );
  }
}
