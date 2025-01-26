import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:project_todo/cubit/checkbox_cubit.dart';
import 'package:project_todo/screens/project_todo_screen.dart';

import 'bloc/checkbox_bloc.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider(create: (context) => CheckboxBloc()),
        BlocProvider(create: (context) => CheckboxCubit()),
      ],
      child: MaterialApp(
        theme: ThemeData(scaffoldBackgroundColor: Colors.white),
        debugShowCheckedModeBanner: false,
        home: ProjectTodoScreen(),
      ),
    );
  }
}

