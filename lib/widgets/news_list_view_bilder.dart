import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:news_app_ui_setup/models/article_model.dart';
import 'package:news_app_ui_setup/widgets/news_serves.dart';
import 'package:news_app_ui_setup/widgets/newslistview.dart';

class NewsListviewbilder extends StatefulWidget {
   const NewsListviewbilder({
    super.key, required this.category,
  });
 final String category ;

  @override
  State<NewsListviewbilder> createState() => _NewsListviewbilderState();
}

 var future;
class _NewsListviewbilderState extends State<NewsListviewbilder> {
  @override
  void initState() {
   
    super.initState();

  future =   NewsServices(Dio()).getNews(category:widget.category);

  }

  @override
  Widget build(BuildContext context) {
    return FutureBuilder<List<ArticleModel>>(
      future: future,
      builder: (context, snapshot) {
        if (snapshot.hasData) {
          return NewsListView(
            articles: snapshot.data!,
          );
        } else if (snapshot.hasError) {
      return const MessageError();
    } else {
      return const CircularIndicator();
    }
  });

 }
}

class CircularIndicator extends StatelessWidget {
  const CircularIndicator({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return const SliverFillRemaining(
      child: Center(
        child: CircularProgressIndicator(backgroundColor: Colors.orange,),
      ),
    );
  }
}

class MessageError extends StatelessWidget {
  const MessageError({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return const SliverToBoxAdapter(
      child: Center(
        child: Text('Error fetching news'),
      ),
    );
  }
}
