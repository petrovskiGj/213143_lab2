import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:jokes/services/api_services.dart';

class MyHomePage extends StatefulWidget {
  final String navBarTitle;

  const MyHomePage({super.key, required this.navBarTitle});

  @override
  State<StatefulWidget> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  List<String> jokeTypes = [];

  String get navBarTitle => navBarTitle;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    getJokeTypesAPI();
  }

  void getJokeTypesAPI() async {
    ApiService.getJokeTypesFromAPI().then((response) {
      var data = json.decode(response.body) as List<dynamic>;
      setState(() {
        jokeTypes = data.cast<String>();
      });
    }).catchError((error) {
      print('Error fetching joke types: $error');
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.orange,
        leading: IconButton(
            onPressed: () {
              Navigator.pushNamed(context, '/random_joke');
            },
            icon: const Icon(Icons.add_box, color: Colors.white, size: 28)),
        title: const Text("+ for random joke",
            style: TextStyle(
                color: Colors.white,
                fontSize: 15,
                fontWeight: FontWeight.bold)),
        centerTitle: true,
      ),
      body: jokeTypes.isEmpty
          ? const Center(child: CircularProgressIndicator())
          : ListView.builder(
              itemCount: jokeTypes.length,
              itemBuilder: (context, index) {
                String jokeType = jokeTypes[index];
                return Card(
                  elevation: 5,
                  margin:
                      const EdgeInsets.symmetric(horizontal: 10, vertical: 5),
                  child: ListTile(
                    title: Text(
                      "$jokeType jokes",
                      style: const TextStyle(
                        fontWeight: FontWeight.bold,
                        fontSize: 16,
                      ),
                    ),
                    subtitle: Text("Tap to explore $jokeType jokes"),
                    onTap: () {
                      Navigator.pushNamed(
                        context,
                        '/details',
                        arguments: jokeTypes[index],
                      );
                    },
                  ),
                );
              },
            ),
    );
  }
}
