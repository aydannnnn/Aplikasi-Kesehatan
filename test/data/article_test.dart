import 'package:flutter_test/flutter_test.dart';
import 'package:mylab/data/model/article.dart';

void main() {
  group('Article Model Test', () {
    test('Article should be created from JSON', () {
      // Arrange
      Map<String, dynamic> jsonData = {
        "source": {"id": "source_id", "name": "source_name"},
        "author": "author_name",
        "title": "article_title",
        "description": "article_description",
        "url": "article_url",
        "urlToImage": "article_image_url",
        "publishedAt": "2023-01-01T12:00:00Z",
        "content": "article_content",
      };

      // Act
      Article article = Article.fromJson(jsonData);

      // Assert
      expect(article.source.id, "source_id");
      expect(article.source.name, "source_name");
      expect(article.author, "author_name");
      expect(article.title, "article_title");
      expect(article.description, "article_description");
      expect(article.url, "article_url");
      expect(article.urlToImage, "article_image_url");
      expect(article.publishedAt, DateTime.parse("2023-01-01T12:00:00Z"));
      expect(article.content, "article_content");
    });

    test('Article should be converted to JSON', () {
      // Arrange
      Article article = Article(
        source: Source(id: "source_id", name: "source_name"),
        author: "author_name",
        title: "article_title",
        description: "article_description",
        url: "article_url",
        urlToImage: "article_image_url",
        publishedAt: DateTime.parse("2023-01-01T12:00:00Z"),
        content: "article_content",
      );

      // Act
      Map<String, dynamic> jsonData = article.toJson();

      // Assert
      expect(jsonData["source"]["id"], "source_id");
      expect(jsonData["source"]["name"], "source_name");
      expect(jsonData["author"], "author_name");
      expect(jsonData["title"], "article_title");
      expect(jsonData["description"], "article_description");
      expect(jsonData["url"], "article_url");
      expect(jsonData["urlToImage"], "article_image_url");
      expect(jsonData["publishedAt"], "2023-01-01T12:00:00.000Z");
      expect(jsonData["content"], "article_content");
    });
  });
}
