import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:news_app_ui_setup/views/search_bar.dart';
import 'package:news_app_ui_setup/widgets/category_ListView.dart';
import 'package:news_app_ui_setup/widgets/news_list_view_bilder.dart';
import 'package:news_app_ui_setup/widgets/news_serves.dart';

class HomeView extends StatefulWidget {
  const HomeView({super.key});

  @override
  State<HomeView> createState() => _HomeViewState();
}

class _HomeViewState extends State<HomeView> {
  int refreshKey = 0;

  Future<void> _refresh() async {
    await NewsServices(Dio())
        .getNews(category: 'general', forceRefresh: true);
    setState(() => refreshKey++);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        elevation: 0,
        scrolledUnderElevation: 0,
        backgroundColor: Colors.white,
        title: const Row(
          mainAxisSize: MainAxisSize.min,
          children: [
            Text(
              'News',
              style: TextStyle(color: Colors.black, fontSize: 24),
            ),
            Text(
              'Cloud',
              style: TextStyle(color: Colors.orange, fontSize: 24),
            ),
          ],
        ),
      ),
      body:
      
       RefreshIndicator(
        color: Colors.orange,
        onRefresh: _refresh,
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 16),
          child: CustomScrollView(
            physics: const BouncingScrollPhysics(
              parent: AlwaysScrollableScrollPhysics(),
            ),
          slivers: [
            SliverToBoxAdapter(
              child: TextField(
                textInputAction: TextInputAction.search,
                decoration: InputDecoration(
                  hintText: 'Search news...',
                  hintStyle: TextStyle(color: Colors.grey.shade500),
                  prefixIcon: Icon(Icons.search, color: Colors.grey.shade600),
                  filled: true,
                  fillColor: Colors.grey.shade100,
                  contentPadding: const EdgeInsets.symmetric(vertical: 0),
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(14),
                    borderSide: BorderSide.none,
                  ),
                ),
                onSubmitted: (q) {
                  if (q.trim().isEmpty) return;
                  Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (_) => SearchView(query: q.trim())));
                },
              ),
            ),
            const SliverToBoxAdapter(child: SizedBox(height: 16)),
            SliverToBoxAdapter(child: CatrgoryListView()),
            const SliverToBoxAdapter(
              child: SizedBox(
                height: 20,
              ),
            ),
            const NewsListviewbilder(
              category: 'general',
            ),
          ],
        ),
      ),
    ),
    );
  }
}
