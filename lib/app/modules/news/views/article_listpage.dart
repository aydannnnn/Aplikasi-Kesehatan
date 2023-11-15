import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:mylab/app/modules/news/views/card_article.dart';
import 'package:mylab/data/http.controller.dart';
// import 'package:mylab/data/model/api_service.dart';


class ArticlePage extends StatelessWidget {
  // final dioController = Get.find<DioController>();
  final httpController = Get.put(HttpController());
  // final httpController = Get.find<GetConnectController>();
  ArticlePage({super.key});
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Obx(() {
          if (httpController.isLoading.value) {
            return Center(
              child: CircularProgressIndicator(
                valueColor: AlwaysStoppedAnimation<Color>(
                    Theme.of(context).colorScheme.secondary),
              ),
            );
          } else {
            return Expanded(
              child: ListView.builder(
                shrinkWrap: true,
                itemCount: httpController.articles.length,
                itemBuilder: (context, index) {
                  var article = httpController.articles[index];
                  return CardArticle(article: article);
                },
              ),
            );
          }
        }),
      ],
    );
  }
}
