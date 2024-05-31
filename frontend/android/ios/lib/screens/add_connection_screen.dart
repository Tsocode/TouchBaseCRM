import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:your_project_name/models/connection.dart';
import 'package:your_project_name/services/api_service.dart';

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
      } catch (error) {
        print('Error adding connection: $error');
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Add Connection'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Form(
          key: _formKey,
          child: ListView(
            children: <Widget>[
              TextFormField(
                decoration: InputDecoration(labelText: 'First Name'),
                onSaved: (value) => _firstName = value!,
              ),
              TextFormField(
                decoration: InputDecoration(labelText: 'Last Name'),
                onSaved: (value) => _lastName = value!,
              ),
              TextFormField(
                decoration: InputDecoration(labelText: 'Where Met'),
                onSaved: (value) => _whereMet = value!,
              ),
              TextFormField(
                decoration: InputDecoration(labelText: 'How Met'),
                onSaved: (value) => _howMet = value!,
              ),
              TextFormField(
                decoration: InputDecoration(labelText: 'Important Detail'),
                onSaved: (value) => _importantDetail = value!,
              ),
              TextFormField(
                decoration: InputDecoration(labelText: 'Position'),
                onSaved: (value) => _position = value!,
              ),
              TextFormField(
                decoration: InputDecoration(labelText: 'Follow-Up'),
                onSaved: (value) => _followUp = value!,
              ),
              SizedBox(height: 20),
              ElevatedButton(
                onPressed: _addConnection,
                child: Text('Add Connection'),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
