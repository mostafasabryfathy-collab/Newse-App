import 'package:flutter/material.dart';
import 'package:news_app_ui_setup/widgets/news_list_view_bilder.dart';

class SearchView extends StatelessWidget {
  const SearchView({super.key, required this.query});
  final String query;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text(query)),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 16),
        child: CustomScrollView(
          slivers: [
            const SliverToBoxAdapter(child: SizedBox(height: 16)),
            NewsListviewbilder(query: query),
          ],
        ),
      ),
    );
  }
}