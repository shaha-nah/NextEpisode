import 'package:flutter/material.dart';

class Add extends StatefulWidget {
  const Add({Key? key}) : super(key: key);

  @override
  _AddState createState() => _AddState();
}

class _AddState extends State<Add> {
  @override
  Widget build(BuildContext context) {
    final _formKey = GlobalKey<FormState>();

    final controllerName = TextEditingController();

    String radioButtonItem = 'TV Show';
    int groupValue = 1;

    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        appBar: AppBar(
          title: Text("Add"),
        ),
        
      ),
    );
  }
}
