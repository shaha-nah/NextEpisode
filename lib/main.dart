import 'package:flutter/material.dart';
import 'package:next_episode/pages/completed.dart';
import 'package:next_episode/pages/schedule.dart';
import 'package:next_episode/pages/today.dart';

import 'pages/add.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return new MaterialApp(
        debugShowCheckedModeBanner: false,
        home: new HomeScreen());
  }
}


class HomeScreen extends StatefulWidget {

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  int currentIndex = 0;

  final screens = [Today(), Schedule(), Completed()];

  @override
  Widget build(BuildContext context) {
    return new Scaffold(
      appBar: AppBar(
            title: Text("Next Episode"),
          ),
          body: Center(
            child: screens[currentIndex],
          ),
          bottomNavigationBar: BottomNavigationBar(
            currentIndex: currentIndex,
            onTap: (index) => setState(() => currentIndex = index),
            items: [
              BottomNavigationBarItem(
                icon: Icon(Icons.access_time),
                label: 'Today',
              ),
              BottomNavigationBarItem(
                icon: Icon(Icons.calendar_today),
                label: 'Schedule',
              ),
              BottomNavigationBarItem(
                icon: Icon(Icons.task_alt),
                label: 'Completed',
              ),
            ],
          ),
          floatingActionButton: FloatingActionButton(
            onPressed: () {
              Navigator.push(context,
                  MaterialPageRoute(builder: (context) => Add()));
            },
            child: Icon(Icons.add),
          ),
        );
  }
}