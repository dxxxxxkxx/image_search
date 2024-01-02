import 'dart:convert';

import 'package:http/http.dart' as http;

class ImageApi {
  Future<List<dynamic>> getImages({String query = ''}) async {
    final String url =
        'https://pixabay.com/api/?key=10711147-dc41758b93b263957026bdadb&q=$query';
    final http.Response response = await http.get(Uri.parse(url));

    return jsonDecode(response.body)['hits'] ?? [];
  }
}
