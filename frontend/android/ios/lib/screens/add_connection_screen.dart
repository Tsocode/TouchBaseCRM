import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'models/connection.dart';
import 'services/api_service.dart';

class AddConnectionScreen extends StatefulWidget {
  @override
  _AddConnectionScreenState createState() => _AddConnectionScreenState();
}

class _AddConnectionScreenState extends State<AddConnectionScreen> {
  final _formKey = GlobalKey<FormState>();
  final ApiService apiService = ApiService();

  String _firstName = '';
  String _lastName = '';
  String _whereMet = '';
  String _howMet = '';
  String _importantDetail = '';
  String _position = '';
  String _followUp = '';

  void _addConnection() async {
    if (_formKey.currentState!.validate()) {
      _formKey.currentState!.save();
      Connection newConnection = Connection(
        firstName: _firstName,
        lastName: _lastName,
        whereMet: _whereMet,
        howMet: _howMet,
        importantDetail: _importantDetail,
        position: _position,
        followUp: _followUp,
      );
      try {
        await apiService.addConnection(newConnection);
        Provider.of<ConnectionProvider>(context, listen: false)
            .addConnection(newConnection);
        Navigator.of(context).pop();
     
