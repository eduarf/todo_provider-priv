import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:todo_provider/pages/home_page.dart';
import 'package:todo_provider/providers/task_prodiver.dart';




void main() async{
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});
  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (context) => TaskProvider(),
      child: MaterialApp(
        title: 'Flutter Demo',
        debugShowCheckedModeBanner: false,
        theme: ThemeData(
          textTheme: const TextTheme(
            titleMedium: TextStyle(
              color: Colors.white,
              fontSize: 18,
            ),
          ),
          primarySwatch: Colors.orange,
          floatingActionButtonTheme: const FloatingActionButtonThemeData(
            backgroundColor: Colors.deepOrange,
            iconSize: 34,
          ),
          iconTheme: const IconThemeData(
            size: 34,
            color: Colors.white,
          ),
        ),
        home: const HomePage(),
      ),
    );
  }
}
