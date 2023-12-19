import 'dart:convert';

import 'package:get/get_rx/src/rx_types/rx_types.dart';
import 'package:get/get_state_manager/src/simple/get_controllers.dart';
import 'package:http/http.dart' as http;
import 'package:http/http.dart';
import 'package:mylab/data/model/article.dart';

class ApiService extends GetxController {
  static const String _baseUrl = 'https://newsapi.org/v2/';
  static const String _apiKey =
      'e3379ab0f63a44a3b471cc22a2b801f6'; //Ganti ke API KEY yang sudah didapat
  static const String _category = 'business';
  static const String _country = 'us';

  RxList<Article> articles = RxList<Article>([]);
  RxBool isLoading = false.obs;
  static final http.Client _client = http.Client();

  @override
  onInit() async {
    super.onInit();
    await fetchArticles();
  }

  Future<List<Article>> fetchArticles() async {
    try {
      isLoading.value = true; // Set loading state to true
      final response = await get(Uri.parse(
          '${_baseUrl}top-headlines?country=$_country&category=$_category&apiKey=$_apiKey'));
      if (response.statusCode == 200) {
        final jsonData = response.body;
        // var ArticleResult;
        final articlesResult = ArticlesResult.fromJson(json.decode(jsonData));
        articles.value = articlesResult.articles;
        return articlesResult.articles;
      } else {
        print('Request failed with status: ${response.statusCode}');
        return [];
      }
    } catch (e) {
      print('An error occurred: $e');
      return [];
    } finally {
      isLoading.value = false; // Set loading state to false when done
    }
  }
}
