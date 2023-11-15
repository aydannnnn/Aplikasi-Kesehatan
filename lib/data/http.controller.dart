import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:get/get.dart';
import 'model/article.dart';

class HttpController extends GetxController {
  static const String _baseUrl = 'https://newsapi.org/v2/';
  static const String _apiKey =
      'e3379ab0f63a44a3b471cc22a2b801f6';
  static const String _category = 'business';
  static const String _country = 'us'; 
  static const String _pageSize = '5';
  RxList<Article> articles = RxList<Article>([]);
  RxBool isLoading = false.obs; // Observable boolean for loading state
  @override
  onInit() async {
    await fetchArticles();
  }

  Future<void> fetchArticles() async {
    try {
      isLoading.value = true; // Set loading state to true
      final response = await http.get(Uri.parse(
          '${_baseUrl}top-headlines?country=$_country&category=$_category&pageSize=$_pageSize&apiKey=$_apiKey'));
      if (response.statusCode == 200) {
        final jsonData = response.body;
        final articlesResult = welcomeFromJson(jsonData);
        // print('Data:: ${articlesResult}');
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
