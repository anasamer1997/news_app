import 'package:flutter/material.dart';
import 'package:dio/dio.dart';
import '../../Models/newsModel.dart';
import '../../constent/conistants.dart';

class NewsProvier with ChangeNotifier {
  final Dio client;
  NewsProvier(this.client);
  List<Article> searchArticles1 = [];
  List<Article> searchArticles2 = [];
  bool isloading = false;
  bool isloading2 = false;
  Future<void> getArticles(String? key1, String? key2) async {
    if (key1 != null && key1.isNotEmpty) {
      isloading = !isloading;
      notifyListeners();
      searchArticles1 = await searchArticals(key1);
      isloading = !isloading;
      notifyListeners();
    }
    if (key2 != null && key2.isNotEmpty) {
      isloading2 = !isloading2;
      notifyListeners();
      searchArticles2 = await searchArticals(key2);
      isloading2 = !isloading2;
      notifyListeners();
    }
  }

  Future<List<Article>> searchArticals(String title) async {
    try {
      final response = await client.get(baseUrlNewsApi, queryParameters: {
        'q': title,
        'sortBy': 'publishedAt',
        'apiKey': keyNewsApi
      });
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
