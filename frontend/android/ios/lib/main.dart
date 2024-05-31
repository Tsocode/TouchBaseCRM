import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'models/connection.dart';
import 'screens/home_screen.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (_) => ConnectionProvider()),
      ],
      child: MaterialApp(
        title: 'CRMApp',
        theme: ThemeData(
          primarySwatch: Colors.blue,
          visualDensity: VisualDensity.adaptivePlatformDensity,
          brightness: Brightness.light,
        ),
        home: HomeScreen(),
        //APPLY MORE FOR THE STRUCTURE OF THE APP, FUNCTIONALITY BASED ON NAME AND WHERE THEY MET
        // USE THE NOTION CRM TEMPLATE TO RUN IT
      ),
    );
  }
}
