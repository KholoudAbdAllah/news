import 'package:flutter/material.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:news/app_theme.dart';
import 'package:news/models/news_response/news_response.dart';
import 'package:timeago/timeago.dart' as timeago;

// ignore: must_be_immutable
class NewsItem extends StatelessWidget {
  News news;

  NewsItem({super.key, required this.news});

  //DateFormat dateFormat = DateFormat('dd-MM-yyyy (HH:mm)');

  // ignore: prefer_typing_uninitialized_variables

  @override
  Widget build(BuildContext context) {
    //final titlesmall = Theme.of(context).textTheme.titleSmall;
    return Container(
      padding: const EdgeInsets.all(16),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          ClipRRect(
            borderRadius: BorderRadius.circular(8),
            child: CachedNetworkImage(
              imageUrl: news.urlToImage ?? '',
              progressIndicatorBuilder: (context, url, downloadProgress) =>
                  CircularProgressIndicator(value: downloadProgress.progress),
              errorWidget: (context, url, error) => const Icon(Icons.error),
            ),
          ),
          Text(
            news.source?.name ?? '',
            style: Theme.of(context).textTheme.titleSmall?.copyWith(
                  fontWeight: FontWeight.w400,
                  fontSize: 10,
                  color: AppTheme.greyColor,
                ),
          ),
          const SizedBox(
            height: 4,
          ),
          Text(
            news.title ?? '',
            style: Theme.of(context).textTheme.titleSmall,
          ),
          const SizedBox(
            height: 4,
          ),
          Align(
            alignment: AlignmentDirectional.centerEnd,
            child: Text(
              timeago.format(news.publishedAt! as DateTime),
              style: Theme.of(context)
                  .textTheme
                  .titleSmall
                  ?.copyWith(color: AppTheme.greyColor),
            ),
          ),
        ],
      ),
    );
  }
}
