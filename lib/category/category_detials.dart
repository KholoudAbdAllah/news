import 'package:flutter/material.dart';
import 'package:news/api/api_service.dart';
import 'package:news/tabs/sources_tabs.dart';
import 'package:news/widgets/error_indicator.dart';
import 'package:news/widgets/loading_indicator.dart';

class CategoryDetials extends StatelessWidget {
  const CategoryDetials(this.categoryId, {super.key, required category});
  //const CategoryDetials(this.categoryId, {super.key});
  final String categoryId;

  @override
  Widget build(BuildContext context) {
    return FutureBuilder(
      future: APIService.getSources(categoryId),
      builder: (context, snapshot) {
        if (snapshot.connectionState == ConnectionState.waiting) {
          return const LoadingIndicator();
        } else if (snapshot.hasError) {
          return const ErrorIndicator();
        } else if (snapshot.data?.status != 'ok') {
          return const Center(
            child: Text('retry plz'),
          );
        }

        // return ListView.builder(
        //   itemBuilder: (_, index) => Text(
        //     snapshot.data?.sources?[index].name ?? '',
        //     style: TextStyle(color: Colors.black),
        //   ),
        //   itemCount: snapshot.data?.sources?.length,
        // );
        final sources = snapshot.data?.sources ?? [];
        return SourcesTabs(sources);
      },
    );
  }
}
