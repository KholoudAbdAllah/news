import 'package:flutter/material.dart';
import 'package:news/api/api_service.dart';
import 'package:news/news/news_item.dart';
import 'package:news/widgets/error_indicator.dart';
import 'package:news/widgets/loading_indicator.dart';

class NewsList extends StatelessWidget {
  final String sourceId;

  const NewsList({super.key, required this.sourceId});
  @override
  Widget build(BuildContext context) {
    return FutureBuilder(
      future: APIService.getNews(sourceId),
      builder: (context, snapshot) {
        if (snapshot.connectionState == ConnectionState.waiting) {
          return const LoadingIndicator();
        } else if (snapshot.hasError || snapshot.data?.status != 'ok') {
          return const ErrorIndicator();
        }
        final newsList = snapshot.data?.articles ?? [];
        return ListView.builder(
          itemBuilder: (BuildContext _, int index) => NewsItem(
            newsList[index],
          ),
        );
      },
    );
  }
}
