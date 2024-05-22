import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'models/connection.dart';
import 'services/api_service.dart';
import 'widgets/connection_list.dart';

class HomeScreen extends StatefulWidget {
  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  final ApiService apiService = ApiService();

  @override
  void initState() {
    super.initState();
    _loadConnections();
  }

  Future<void> _loadConnections() async {
    try {
      List<Connection> connections = await apiService.fetchConnections();
      Provider.of<ConnectionProvider>(context, listen: false)
          .setConnections(connections);
    } catch (error) {
      print('Error loading connections: $error');
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Connections'),
      ),
      body: ConnectionList(),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          Navigator.of(context).push(MaterialPageRoute(
              builder: (context) => AddConnectionScreen()));
        },
        child: Icon(Icons.add),
      ),
    );
  }
}
