import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:news_app_ui_setup/widgets/news_list_view_bilder.dart';
import 'package:news_app_ui_setup/widgets/news_serves.dart';

class CategoryView extends StatefulWidget {
  const CategoryView({super.key, required this.category});
  final String category;

  @override
  State<CategoryView> createState() => _CategoryViewState();
}

class _CategoryViewState extends State<CategoryView> {
  int refreshKey = 0;

  Future<void> _refresh() async {
    await NewsServices(Dio())
        .getNews(category: widget.category, forceRefresh: true);
    setState(() => refreshKey++);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text(widget.category)),
      body: RefreshIndicator(
        color: Colors.orange,
        onRefresh: _refresh,
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 16),
          child: CustomScrollView(
            physics: const BouncingScrollPhysics(
              parent: AlwaysScrollableScrollPhysics(),
            ),
            slivers: [
              const SliverToBoxAdapter(child: SizedBox(height: 32)),
              NewsListviewbilder(
                key: ValueKey(refreshKey),
                category: widget.category,
              ),
            ],
          ),
        ),
      ),
    );
  }
}