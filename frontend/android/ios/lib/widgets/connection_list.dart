import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:your_project_name/models/connection.dart';

class ConnectionList extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final connections = Provider.of<ConnectionProvider>(context).connections;
    return ListView.builder(
      itemCount: connections.length,
      itemBuilder: (context, index) {
        final connection = connections[index];
        return ListTile(
          title: Text('${connection.firstName} ${connection.lastName}'),
          subtitle: Text('${connection.position} - ${connection.importantDetail}'),
        );
      },
    );
  }
}
