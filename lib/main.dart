import 'package:flutter/material.dart';
import 'package:project_todo/screens/project_todo.dart';
import 'package:project_todo/screens/project_todo_screen.dart';
import 'package:project_todo/screens/todolist_widget.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData(scaffoldBackgroundColor: Colors.white),
      debugShowCheckedModeBanner: false,
      home: ProjectTodoScreen(),
    );
  }
}
