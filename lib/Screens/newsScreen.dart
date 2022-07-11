// ignore_for_file: file_names, must_be_immutable, no_logic_in_create_state

import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';

import 'package:apptwo/modelData/article.dart';

class NewsList extends StatelessWidget {
  List<Article> articles;

  NewsList(this.articles, {Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(home: NewsListWidget(articles));
  }
}

class NewsListWidget extends StatefulWidget {
  List<Article> articles;

  NewsListWidget(this.articles, {Key? key}) : super(key: key);

  @override
  State<StatefulWidget> createState() => NewsListWidgetState(articles);
}

class NewsListWidgetState extends State<NewsListWidget> {
  List<Article> articles;

  NewsListWidgetState(this.articles);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("NEWS"),
        centerTitle: true,
      ),
      body: ListView.builder(
          itemCount: articles.length,
          itemBuilder: (context, index) {
            if (kDebugMode) {
              print(index);
            }
            return Container(
              padding: const EdgeInsets.all(10),
              margin: const EdgeInsets.all(5),
              color: Colors.black12,
              child: Column(
                children: [
                  Container(
                    padding: const EdgeInsets.all(10),
                    alignment: Alignment.center,
                    child: Image.network(
                      articles[index].urlToImage,
                      errorBuilder: (context, e, stackTrace) {
                        return Image.asset('assets/img.png');
                      },
                    ),
                  ),
                  Container(
                    padding: const EdgeInsets.all(8),
                    alignment: Alignment.centerLeft,
                    child: Text(
                      articles[index].title,
                      textScaleFactor: 1,
                      style: const TextStyle(
                        fontSize: 20,
                        color: Colors.black,
                      ),
                    ),
                  ),
                  Container(
                    padding: const EdgeInsets.all(8),
                    alignment: Alignment.centerLeft,
                    child: Text(
                      articles[index].description,
                      textScaleFactor: 1,
                      style: const TextStyle(
                        fontSize: 16,
                        color: Colors.black54,
                      ),
                    ),
                  ),
                ],
              ),
            );
          }),
    );
  }
}
