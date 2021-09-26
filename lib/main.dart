import 'package:flutter/material.dart';
import 'package:next_episode/data/moor_database.dart';
import 'package:provider/provider.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Provider(
      create: (_) => MyDatabase(),
      child: MaterialApp(
        title: 'Material App',
        home: Text("Hello World")
      ),
    );
  }
}
