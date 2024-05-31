import 'package:flutter/foundation.dart';

class Connection {
  final String firstName;
  final String lastName;
  final String whereMet;
  final String howMet;
  final String importantDetail;
  final String position;
  final String followUp;

  Connection({
    required this.firstName,
    required this.lastName,
    required this.whereMet,
    required this.howMet,
    required this.importantDetail,
    required this.position,
    required this.followUp,
  });

  factory Connection.fromJson(Map<String, dynamic> json) {
    return Connection(
      firstName: json['firstName'],
      lastName: json['lastName'],
      whereMet: json['whereMet'],
      howMet: json['howMet'],
      importantDetail: json['importantDetail'],
      position: json['position'],
      followUp: json['followUp'],
    );
  }

  Map<String, dynamic> toJson() => {
        'firstName': firstName,
        'lastName': lastName,
        'whereMet': whereMet,
        'howMet': howMet,
        'importantDetail': importantDetail,
        'position': position,
        'followUp': followUp,
      };
}

class ConnectionProvider with ChangeNotifier {
  List<Connection> _connections = [];

  List<Connection> get connections => _connections;

  void addConnection(Connection connection) {
    _connections.add(connection);
    notifyListeners();
  }

  void setConnections(List<Connection> connections) {
    _connections = connections;
    notifyListeners();
  }
}
