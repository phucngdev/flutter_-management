import 'package:flutter/material.dart';
import 'views/categoryView.dart'; // Import ItemListScreen

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: ItemListScreen(), // Use ItemListScreen as home
    );
  }
}
