import 'package:flutter/material.dart';
import 'package:mylab/data/model/article.dart';

class CardArticle extends StatelessWidget {

  final Article article;
  const CardArticle({Key? key, required this.article}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    article.urlToImage ??= 'https://wawasanproklamator.com/wp-content/uploads/2022/03/Pentingnya-Menjaga-Kesehatan-dengan-Pola-Hidup-Sehat.jpg';
    return Material(
      color: Theme.of(context).primaryColor,
      child: ListTile(
        contentPadding:
            const EdgeInsets.symmetric(horizontal: 16.0, vertical: 8.0),
        leading: Hero(
          tag: article.urlToImage!,
          child: SizedBox(
            width: 150,
            height: 150,
            child: Image.network(
              article.urlToImage!,
            ),
          ),
        ),
        title: Text(
          article.title,
        ),
        subtitle: Text(article.author ?? ''),
        // onTap: () => Navigator.pushNamed(
        //   context,
        //   ArticleDetailPage.routeName,
        //   arguments: article,
        // ),
      ),
    );
  }
}
