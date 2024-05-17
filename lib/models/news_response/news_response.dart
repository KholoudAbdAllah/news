import 'package:news/models/news_response/source.dart';

// ignore: unused_import
import 'article.dart';

class News {
  News({
    this.source,
    this.author,
    this.title,
    this.description,
    this.url,
    this.urlToImage,
    this.publishedAt,
    this.content,
  });

  News.fromJson(dynamic json) {
    source = json['source'] != null ? Source.fromJson(json['source']) : null;
    author = json['author'];
    title = json['title'];
    description = json['description'];
    url = json['url'];
    urlToImage = json['urlToImage'];
    publishedAt = json['publishedAt'];
    content = json['content'];
  }
  Source? source;
  String? author;
  String? title;
  String? description;
  String? url;
  String? urlToImage;
  String? publishedAt;
  String? content;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    if (source != null) {
      map['source'] = source?.toJson();
    }
    map['author'] = author;
    map['title'] = title;
    map['description'] = description;
    map['url'] = url;
    map['urlToImage'] = urlToImage;
    map['publishedAt'] = publishedAt;
    map['content'] = content;
    return map;
  }
}

/// id : null
/// name : "Gizmodo.com"



// class NewsResponse {
//   final String? status;
//   final int? totalResults;
//   final List<Article>? articles;

//   const NewsResponse({this.status, this.totalResults, this.articles});

//   @override
//   String toString() {
//     return 'NewsResponse(status: $status, totalResults: $totalResults, articles: $articles)';
//   }

//   factory NewsResponse.fromJson(Map<String, dynamic> json) => NewsResponse(
//         status: json['status'] as String?,
//         totalResults: json['totalResults'] as int?,
//         articles: (json['articles'] as List<dynamic>?)
//             ?.map((e) => Article.fromJson(e as Map<String, dynamic>))
//             .toList(),
//       );
//   Map<String, dynamic> toJson() => {
//         'status': status,
//         'totalResults': totalResults,
//         'articles': articles?.map((e) => e.toJson()).toList(),
//       };
// }
