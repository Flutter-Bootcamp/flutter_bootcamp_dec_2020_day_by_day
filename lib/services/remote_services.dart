import 'package:flutter_bootcamp_2020/models/article_model.dart';
import 'package:http/http.dart' as http;

class RemoteService {
  static var client = http.Client();
  static Future<List<Article>> fetchArticles () async {
    var response = await client.get(
        'https://api.flutterbootcamp.com/article');
    if (response.statusCode == 200) {
      var jsonString = response.body;
      return articlesFromJson(jsonString);
    } else {
      // show error message
      return null;
    }
  }
}