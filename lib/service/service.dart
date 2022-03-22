import 'dart:convert';

import 'package:http/http.dart' as http;
import 'package:tugas_minggu4/model/article_model.dart';

class ApiService {
  final endPoint =
      "https://newsapi.org/v2/top-headlines?country=us&category=business&apiKey=1fdbf707faf443d3a564dc5f9635cc26";

  Future<Iterable<Article>> getArticle() async {
    http.Response res = await http.get(Uri.parse(endPoint));

    if (res.statusCode == 200) {
      Map<String, dynamic> json = jsonDecode(res.body);
      List<dynamic> body = json['articles'];
      List<Article> article =
          body.map((dynamic item) => Article.fromMap(item)).toList();

      return article;
    } else {
      throw ("Cant get the Article");
    }
  }
}
