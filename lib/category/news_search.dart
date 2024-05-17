import 'package:flutter/material.dart';
import 'package:news/api/api_service.dart';
import 'package:news/app_theme.dart';
// ignore: unused_import
import 'package:news/models/news_response/news_response.dart';

import '../news/news_item.dart';

class NewsSearch extends SearchDelegate {
  @override
  ThemeData appBarTheme(BuildContext context) {
    return ThemeData(
      appBarTheme: AppBarTheme(
        color: AppTheme.primaryColor,
      ),
      inputDecorationTheme: const InputDecorationTheme(
        border: InputBorder.none,
      ),
    );
  }

  late Future<News> getNewsDataModel;

  NewsSearch() {
    getNewsDataModel = APIService.getNews(searchKeyword: "");
  }

  @override
  List<Widget>? buildActions(BuildContext context) {
    return [
      IconButton(
        onPressed: () {
          showResults(context);
        },
        icon: const Icon(Icons.search),
      ),
    ];
  }

  @override
  Widget? buildLeading(BuildContext context) {
    return IconButton(
      onPressed: () {
        Navigator.pop(context);
      },
      icon: const Icon(
        Icons.clear,
        size: 32,
      ),
    );
  }

  @override
  Widget buildResults(BuildContext context) {
    return FutureBuilder(
      future: APIService.getNews(query, searchKeyword: ''),
      builder: (context, snapshot) {
        if (snapshot.connectionState == ConnectionState.waiting) {
          return const Center(child: CircularProgressIndicator());
        }
        if (snapshot.hasError) {
          return const Center(child: Text("Something went wrong"));
        }
        var articles = snapshot.data?.articles ?? [];
        return Expanded(
          child: ListView.builder(
            itemBuilder: (context, index) {
              var newsItem = articles[index];
              return NewsItem(news: newsItem);
            },
            itemCount: articles.length,
          ),
        );
      },
    );
  }

  @override
  Widget buildSuggestions(BuildContext context) {
    return const Center(
      child: Text(
        'Search',
        style: TextStyle(color: Colors.black),
      ),
    );
  }
}
