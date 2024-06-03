// lib/pages/connections_page.dart
import 'package:flutter/material.dart';
import '../widgets/connection_card.dart';

class ConnectionsPage extends StatelessWidget {
  const ConnectionsPage({super.key});

  @override
  Widget build(BuildContext context) {
    return ListView(
      padding: EdgeInsets.all(8),
      children: <Widget>[
        ConnectionCard(
          name: 'John Doe',
          meetingPlace: 'Conference',
        ),
        ConnectionCard(
          name: 'Jane Smith',
          meetingPlace: 'Office',
        ),
      ],
    );
  }

  ConnectionCard({required String name, required String meetingPlace}) {}
}
