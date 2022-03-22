import 'package:tugas_minggu4/model/source_model.dart';

class Article {
  late Source source;
  late String author;
  late String title;
  late String description;
  late String url;
  late String urlToImage;
  late String publisehdAt;
  late String content;

  Article({
    required this.source,
    required this.author,
    required this.title,
    required this.description,
    required this.url,
    required this.urlToImage,
    required this.publisehdAt,
    required this.content,
  });

  factory Article.fromMap(Map<String, dynamic> json) {
    return Article(
      source: Source.fromMap(json['source']),
      author: json['author'] as String,
      title: json['title'] as String,
      description: json['description'] as String,
      url: json['url'] as String,
      urlToImage: json['urlToImage'] as String,
      publisehdAt: json['publishedAt'] as String,
      content: json['content'] as String,
    );
  }
}
