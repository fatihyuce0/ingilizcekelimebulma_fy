import 'dart:convert';

import 'package:http/http.dart' as http;
import 'package:ingilizcekelimebulma_fy/models/article.dart';
import 'package:ingilizcekelimebulma_fy/models/news.dart';

class NewsService {
  static NewsService _singleton = NewsService._internal();
  NewsService._internal();

  factory NewsService() {
    return _singleton;
  }

  static Future<List<Articles>> getNews() async {
    String url =
        'https://newsapi.org/v2/top-headlines?country=us&category=business&apiKey=0e4661a599cf4c58838d19d3aefc9a1a';

    final response = await http.get(url);

    if (response.body.isNotEmpty) {
      final responseJson = json.decode(response.body);
      News news = News.fromJson(responseJson);
      return news.articles;
    }
    return null;
  }
}