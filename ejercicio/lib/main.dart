import 'package:flutter/material.dart';
import 'pages/user_add.dart';
import 'pages/user_list.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      routes: {
        '/': (context) => const UserList(),
        '/add-user': (context) => const UserAddUI(),
      },
    );
  }
}
