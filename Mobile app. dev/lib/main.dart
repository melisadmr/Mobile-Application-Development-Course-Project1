import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'providers/country_provider.dart';
import 'screens/country_list_screen.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (ctx) => CountryProvider(),
      child: MaterialApp(
        title: 'Country App',
        theme: ThemeData(primarySwatch: Colors.blue),
        home: CountryListScreen(),
      ),
    );
  }
}