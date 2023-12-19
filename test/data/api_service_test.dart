import 'package:flutter_test/flutter_test.dart';
import 'package:http/http.dart' as http;
import 'package:mockito/annotations.dart';
import 'package:mockito/mockito.dart';
import 'package:mylab/data/model/api_service.dart';
import 'package:mylab/data/model/article.dart';
import 'api_service_test.mocks.dart';

@GenerateMocks([http.Client, ApiService])
void main() {
  const _baseUrl = 'https://newsapi.org/v2/';
  const _apiKey =
      'e3379ab0f63a44a3b471cc22a2b801f6'; //Ganti ke API KEY yang sudah didapat
  const String _category = 'business';
  const String _country = 'us';

  late ApiService apiService;
  late MockClient mockClient;

  setUp(() {
    mockClient = MockClient();
    apiService = ApiService();
  });

  group('ApiService', () {
    test('fetchArticles returns a list of articles if response is successful',
        () async {
      when(mockClient.get(Uri.parse(
              '${_baseUrl}top-headlines?country=$_country&category=$_category&apiKey=$_apiKey')))
          .thenAnswer((_) async => http.Response('{"articles":[]}', 200));
      final articles = await apiService.fetchArticles();
// Expect the fetched data to be a list of Article objects
      expect(articles, isA<List<Article>>());
    });
    test('fetchArticles returns an empty list if response fails', () async {
// Mock the HTTP response for response failure
      when(mockClient.get(Uri.parse(
              '${_baseUrl}top-headlines?country=$_country&category=$_category&apiKey=$_apiKey')))
          .thenAnswer((_) async =>
              http.Response('Server error', 500)); // Mock the HTTP response
      final articles = await apiService.fetchArticles();
// Expect the fetched data to be an empty list
      expect(articles, isA<List<Article>>());
    });
    test('fetchArticles returns an empty list if an error occurs', () async {
// Mock an error response
      when(mockClient.get(Uri.parse(
              '${_baseUrl}top-headlines?country=$_country&category=$_category&apiKey=$_apiKey')))
          .thenThrow(Exception('Test error')); // Mock an error
      final articles = await apiService.fetchArticles();
// Expect the fetched data to be an empty list
      expect(articles, isA<List<Article>>());
    });
  });
}
