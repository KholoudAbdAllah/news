// ignore: file_names
// ignore_for_file: deprecated_member_use, depend_on_referenced_packages, unused_import

import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:news/app_theme.dart';
import 'package:news/models/news_response/news_response.dart';
import 'package:provider/provider.dart';
import 'dart:io';
import 'package:url_launcher/url_launcher.dart';

// ignore: must_be_immutable
class DetailsNews extends StatelessWidget {
  News news;

  DetailsNews({super.key, required this.news});

  DateFormat dateFormat = DateFormat('dd-MM-yyyy (HH:mm)');
  @override
  Widget build(BuildContext context) {
    //var provider = Provider.of<AppConfigProvider>(context);

    return Scaffold(
      backgroundColor: Colors.black,
      appBar: AppBar(
        toolbarHeight: MediaQuery.of(context).size.height / 9,
        title: Text(
          news.author ?? "",
          style: Theme.of(context).textTheme.titleLarge,
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: SizedBox(
                width: double.infinity,
                height: MediaQuery.of(context).size.height * 0.3,
                child: ClipRRect(
                  borderRadius: BorderRadius.circular(20),
                  child: CachedNetworkImage(
                    imageUrl: news.urlToImage ?? '',
                    width: double.infinity,
                    fit: BoxFit.fill,
                    height: MediaQuery.of(context).size.height * 0.3,
                    placeholder: (context, url) =>
                        const Center(child: CircularProgressIndicator()),
                    errorWidget: (context, url, error) =>
                        const Icon(Icons.error),
                  ),
                ),
              ),
            ),
            const SizedBox(
              height: 5,
            ),
            Center(
              child: Text(
                news.author ?? "",
              ),
            ),
            const SizedBox(
              height: 5,
            ),
            Text(
              news.title ?? "",
            ),
            const SizedBox(
              height: 5,
            ),
            Text(
              news.publishedAt != null
                  ? dateFormat.format(DateTime.parse(news.publishedAt!))
                  : "",
              textAlign: TextAlign.right,
            ),
            const SizedBox(
              height: 20,
            ),
            Text(
              news.description ?? "",
            ),
            const SizedBox(
              height: 50,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                InkWell(
                  onTap: () async {
                    final url = news.url;
                    if (url != null && await canLaunch(url)) {
                      await launch(url);
                    } else {}
                  },
                  child: const Text(
                    'View Full Article',
                    style: TextStyle(
                      fontSize: 14,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
                const Icon(
                  Icons.arrow_right_sharp,
                  size: 40,
                )
              ],
            ),
          ],
        ),
      ),
    );
  }
}

launch(String url) {}

canLaunch(String url) {}

void openUrl(String url) async {
  try {
    await Process.run('cmd', ['/c', 'start', url]);
  } catch (e) {
    // ignore: avoid_print
    print('Error: $e');
  }
}
