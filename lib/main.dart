import 'package:flutter/material.dart';
import 'package:github_repos_demo/repos_list/repos_list_screen.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        title: 'Github repos list demo',
        theme: ThemeData(
          primarySwatch: Colors.blue,
        ),
        home: ReposListScreen());
  }
}
