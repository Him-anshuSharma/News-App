
import 'package:apptwo/Dio/http_service.dart';
import 'package:apptwo/modelData/article.dart';
import 'package:flutter/material.dart';

import 'Screens/loadingScreen.dart';
import 'Screens/newsScreen.dart';

List<Article> articlesList = [];
bool newsLoaded = false;

void main() {
  runApp(const MyApp());
  HttpService h = HttpService();
  h.getRequest().then((value) async {
    var articles = List<Map<String, dynamic>>.from((value.data['articles']));
    for (var article in articles) {
      articlesList.add(Article(
          author: article["author"].toString(),
          title: article["title"].toString(),
          description: article["description"].toString(),
          url: article["url"].toString(),
          urlToImage: article["urlToImage"].toString(),
          publishedAt: article["publishedAt"].toString(),
          content: article["content"].toString()));
    }
    await Future.delayed(const Duration(seconds: 4), () {});
    runApp(NewsList(articlesList));
  });
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return const MaterialApp(home: MyAppWidget());
  }
}

class MyAppWidget extends StatefulWidget {
  const MyAppWidget({Key? key}) : super(key: key);

  @override
  State<StatefulWidget> createState() => MyAppWidgetState();
}

class MyAppWidgetState extends State<MyAppWidget> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("NEWS"),
        centerTitle: true,
      ),
      body: const Loading(),
    );
  }
}
