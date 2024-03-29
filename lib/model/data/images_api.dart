import 'dart:convert';

import 'package:http/http.dart' as http;

class ImagesApi {
  Future<List<dynamic>> getJsonImages({String query = ''}) async {
    final String url =
        'https://pixabay.com/api/?key=10711147-dc41758b93b263957026bdadb&q=$query';
    final http.Response response = await http.get(Uri.parse(url));

    return List.unmodifiable(jsonDecode(response.body)['hits'] ?? []);
  }
}
