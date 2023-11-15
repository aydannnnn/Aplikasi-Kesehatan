// import 'dart:html';

import 'dart:convert';

import 'package:get/get.dart';
import 'package:http/http.dart';
import 'package:mylab/data/model/article.dart';
// import 'package:http/http.dart';

class GetConnectController extends GetxController {
  static const String _baseUrl = 'https://newsapi.org/v2/';
  static const String _apiKey =
      'e3379ab0f63a44a3b471cc22a2b801f6'; //Ganti ke API KEY yang sudah didapat
  static const String _category = 'business';
  static const String _country = 'us';

  RxList<Article> articles = RxList<Article>([]);
  RxBool isLoading = false.obs;

  @override
  onInit() async {
    await fetchArticles();
  }

  Future<void> fetchArticles() async {
    try {
      isLoading.value = true; // Set loading state to true
      final response = await get(Uri.parse(
          '${_baseUrl}top-headlines?country=$_country&category=$_category&apiKey=$_apiKey'));
      if (response.statusCode == 200) {
        final jsonData = response.body;
        var ArticleResult;
        final articlesResult = ArticleResult.fromJson(json.decode(jsonData));
        articles.value = articlesResult.articles;
      } else {
        print('Request failed with status: ${response.statusCode}');
      }
    } catch (e) {
      print('An error occurred: $e');
    } finally {
      isLoading.value = false; // Set loading state to false when done
    }
  }
}
