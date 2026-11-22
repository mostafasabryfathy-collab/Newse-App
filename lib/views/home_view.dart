import 'package:flutter/material.dart';
import 'package:news_app_ui_setup/views/search_bar.dart';
import 'package:news_app_ui_setup/widgets/category_ListView.dart';
import 'package:news_app_ui_setup/widgets/news_list_view_bilder.dart';



class HomeView extends StatelessWidget {
  const HomeView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        elevation: 0,
        backgroundColor: Colors.transparent,
        title: const Row(
          mainAxisSize: MainAxisSize.min,
          children: [
            Text(
              'News',
              style: TextStyle(color: Colors.black,   fontFamily: 'Inter', fontSize: 24),
            ),
            Text(
              'Cloud',
              style: TextStyle(color: Colors.orange, fontFamily: 'Inter', fontSize: 24),
            ),
          ],
        ),
      ),
      body: 
 Padding(
        padding: const EdgeInsets.symmetric(horizontal: 16),
         
        child: CustomScrollView(
          physics:  const BouncingScrollPhysics(),
          slivers: [
        SliverToBoxAdapter(
  child: TextField(
    textInputAction: TextInputAction.search,
    decoration: InputDecoration(
      hintText: 'Search news...',
      prefixIcon: const Icon(Icons.search),
      border: OutlineInputBorder(borderRadius: BorderRadius.circular(12)),
    ),
    onSubmitted: (q) {
      if (q.trim().isEmpty) return;
      Navigator.push(context, MaterialPageRoute(
        builder: (_) => SearchView(query: q.trim())));
    },
  ),
),
const SliverToBoxAdapter(child: SizedBox(height: 16)),
             SliverToBoxAdapter(child: CatrgoryListView()),
              const SliverToBoxAdapter(
              child: SizedBox(
                height: 32,
              ),
            ),
                const NewsListviewbilder(category: 'general',),

        
          ],
        ),

      ),
      
    );
  }
}

