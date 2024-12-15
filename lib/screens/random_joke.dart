import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:jokes/models/joke.dart';
import 'package:jokes/services/api_services.dart';

class MyRandomJokePage extends StatefulWidget {
  const MyRandomJokePage({super.key});

  @override
  State<StatefulWidget> createState() => _MyRandomPageState();
}

class _MyRandomPageState extends State<MyRandomJokePage> {
  Joke joke = Joke(type: "type", setup: "setup", punchline: "punchline", id: -1);

  @override
  void didChangeDependencies() {
    super.didChangeDependencies();
    loadRandomJokeApi();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.lightBlue[100],
        title: const Text(
          "Random Joke",
          style: TextStyle(
            color: Colors.white,
            fontWeight: FontWeight.bold,
          ),
        ),
      ),
      body: joke.id == -1
          ? const Center(
        child: CircularProgressIndicator(),
      )
          : Padding(
        padding: const EdgeInsets.all(16.0),
        child: Container(
          decoration: BoxDecoration(
            color: Colors.lightBlue[50],
            borderRadius: BorderRadius.circular(8),
            boxShadow: [
              BoxShadow(
                color: Colors.grey.withOpacity(0.5),
                spreadRadius: 1,
                blurRadius: 3,
                offset: const Offset(0, 2),
              ),
            ],
          ),
          padding: const EdgeInsets.all(16.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                joke.setup,
                style: const TextStyle(
                  fontSize: 18,
                  fontWeight: FontWeight.bold,
                ),
              ),
              const SizedBox(height: 10),
              Text(
                joke.punchline,
                style: const TextStyle(
                  fontSize: 16,
                  color: Colors.black87,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  void loadRandomJokeApi() {
    ApiService.getRandomJokeFromAPI().then((response) {
      var data = json.decode(response.body);
      setState(() {
        joke = Joke.fromJson(data);
      });
    }).catchError((error) {
      print("Error fetching joke: $error");
    });
  }
}
