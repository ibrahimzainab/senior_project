import 'package:flutter/material.dart';

class Article {
  int id;
  String title, text, imagePath;

  Article(
      {@required this.id,
      @required this.title,
      @required this.text,
      this.imagePath = 'assets/images/article_img.png'});

  factory Article.fromJson(Map<String, dynamic> json) {
    var image;
    if (json['imagePath'] == null) {
      image = 'assets/images/article_img.png';
    } else
      image = json['imagePath'];
    return Article(
        id: json['idarticle'],
        title: json['title'],
        text: json['text'],
        imagePath: image);
  }

  static List<Article> getArticles(List json) {
    return json.map((item) => Article.fromJson(item)).toList();
  }
}
