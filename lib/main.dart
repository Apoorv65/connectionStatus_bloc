import 'package:bloc_mark1/bloc/connection_bloc.dart';
import 'package:bloc_mark1/screen/Index.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => ConnectionBloc(),
      child: MaterialApp(
        title: 'Bloc mark',
        theme: ThemeData(
          primarySwatch: Colors.blue,
        ),
        home: const Index(),
      ),
    );
  }
}

















