import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:news_app_ui_setup/models/article_model.dart';
import 'package:news_app_ui_setup/widgets/news_serves.dart';
import 'package:news_app_ui_setup/widgets/newslistview.dart';

class NewsListviewbilder extends StatefulWidget {
  const NewsListviewbilder({
    super.key,
  });

  @override
  State<NewsListviewbilder> createState() => _NewsListviewbilderState();
}

List<ArticleModel> articles = [];

class _NewsListviewbilderState extends State<NewsListviewbilder> {
  @override
  void initState() {
    getGeneralNews();

    super.initState();
  }

  bool isLoading = true;

  Future<dynamic> getGeneralNews() async {
    articles = await NewsServices(Dio()).getNews();
    isLoading = false;
    setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    return isLoading
        ? const SliverFillRemaining(
            child: Center(
              child: CircularProgressIndicator(),
            ),
          )
        : articles.isNotEmpty
            ? NewsListView(
                articles: articles,
              )
            : const SliverToBoxAdapter(
                child: Center(
                  child: Text('No News Found'),
                ),
              );
  }
}
