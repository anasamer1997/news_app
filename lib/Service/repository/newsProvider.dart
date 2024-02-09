import 'package:flutter/material.dart';
import 'package:dio/dio.dart';
import '../../Models/newsModel.dart';
import '../../constent/conistants.dart';

class NewsProvier with ChangeNotifier {
  final Dio client;
  NewsProvier(this.client);
  List<Article> searchArticles1 = [];
  List<Article> searchArticles2 = [];

  Future<void> getArticles(String? key1, String? key2) async {
    if (key1 != null) {
      searchArticles1 = await searchArticals(key1);
      notifyListeners();
    }
    if (key2 != null) {
      searchArticles2 = await searchArticals(key2);
      notifyListeners();
    }
  }

  Future<List<Article>> searchArticals(String title) async {
    try {
      final response = await client.get(baseUrlNewsApi,
          queryParameters: {'sortBy': 'publishedAt', 'apiKey': keyNewsApi});
      final newsData = List<Article>.from(
        response.data['articles'].map<Article>(
          (json) => Article.fromJson(json),
        ),
      ).toList();
      return newsData;
    } catch (e) {
      rethrow;
    }
  }
}
