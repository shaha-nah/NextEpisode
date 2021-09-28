import 'package:flutter/material.dart';
import 'package:next_episode/data/moor_database.dart';
import 'package:next_episode/pages/completed.dart';
import 'package:next_episode/pages/schedule.dart';
import 'package:next_episode/pages/today.dart';
import 'package:provider/provider.dart';

void main() => runApp(MyApp());

class MyApp extends StatefulWidget {
  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  int currentIndex = 0;

  final screens = [
    Today(),
    Schedule(),
    Completed()
  ];
  
  @override
  Widget build(BuildContext context) {
    return Provider(
      create: (_) => MyDatabase(),
      child: MaterialApp(
        title: 'Material App',
        home: Scaffold(
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
        ),
      ),
    );
  }
}
