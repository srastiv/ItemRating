import 'package:flutter/material.dart';
import 'package:item_rating/models/item_Provider.dart';
import 'package:provider/provider.dart';
import 'models/item_Provider.dart';
import 'login.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (_) => ListOfItems(),
      child: MaterialApp(
        theme: ThemeData(
          primarySwatch: Colors.deepPurple,
        ),
        home: Scaffold(
          body: Login(),
        ),
      ),
    );
  }
}
