// To parse this JSON data, do
//
//     final data = dataFromJson(jsonString);



class Article {
  Article({
    required this.author,
    required this.title,
    required this.description,
    required this.url,
    required this.urlToImage,
    required this.publishedAt,
    required this.content,
  });
  String author;
  String title;
  String description;
  String url;
  String urlToImage;
  String publishedAt;
  String content;
}

