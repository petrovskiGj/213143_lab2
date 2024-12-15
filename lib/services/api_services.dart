import "package:http/http.dart" as http;

class ApiService {
  static const String JOKE_TYPES_URL = "https://official-joke-api.appspot.com/types";
  static const String RANDOM_JOKE_URL = "https://official-joke-api.appspot.com/random_joke";
  static const String BASE_CERTAIN_JOKES_URL = "https://official-joke-api.appspot.com/jokes";

  static Future<http.Response> getJokeTypesFromAPI() async {
    var response = await http.get(Uri.parse(JOKE_TYPES_URL));
    print("Response: ${response.body}");
    return response;
  }

  static Future<http.Response> getRandomJokeFromAPI() async {
    var response = await http.get(Uri.parse(RANDOM_JOKE_URL));
    print("Response: ${response.body}");
    return response;
  }

  static Future<http.Response> getAbilitiesForPokemon(String type) async{
    final response = await http.get(Uri.parse(BASE_CERTAIN_JOKES_URL + "/$type/ten"));
    if (response.statusCode == 200) {
      print("Success: ${response.body}");
      // var data = jsonDecode(response.body);
      // print("data $jsonDecode(response.body);");
      // return data;
      return response;
    }
    else{
      throw Exception("Failed to load data!");
    }
  }

}