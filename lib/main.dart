import 'package:flutter/material.dart';
import 'package:jokes/screens/details_page.dart';
import 'package:jokes/screens/home_page.dart';
import 'package:jokes/screens/random_joke.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
      ),
      initialRoute: "/",
      routes: {
        "/": (context) =>  const MyHomePage(navBarTitle: 'Lab 2 213143'),
        "/details": (context) => const MyDetailsPage(),
        "/random_joke": (context) => const MyRandomJokePage()
      },
    );
  }
}

