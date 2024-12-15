class Joke {
  String type;
  String setup;
  String punchline;
  int id;

  Joke({required this.type, required this.setup, required this.punchline, required this.id});


  Joke.fromJson(Map<String, dynamic> data)
      : type = data['type'],
        setup = data['setup'],
        punchline = data['punchline'],
        id = data['id'];

  Map<String, dynamic> toJson() => {'type' : type, 'setup' : setup, 'punchline' : punchline, 'id' : id};

}