import 'package:objectbox/objectbox.dart';


@Entity()
@Sync()
class News{
  int id = 0;
  String title;
  String description;
  String url;
  String urlToImage;
  String publishedAt;
  String author;

  News(this.title, this.description, this.url, this.urlToImage, this.publishedAt, this.author);

  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'title': title,
      'description': description,
      'url': url,
      'urlToImage': urlToImage,
      'publishedAt': publishedAt,
      'author': author,
    };
  }
  factory News.fromJson(Map<String, dynamic> json) {
    return News(
      json['title'] as String,
      json['description'] as String,
      json['url'] as String,
      json['urlToImage'] as String,
      json['publishedAt'] as String,
      json['author'] as String,
    );
  }
}
