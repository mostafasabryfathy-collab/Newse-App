import 'package:flutter/material.dart';
import 'package:news_app_ui_setup/widgets/news_list_view_bilder.dart';

class CategoryView extends StatelessWidget {
  const CategoryView({super.key, required this.category});
  final String category;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 16),

        child: CustomScrollView(
          physics:  const BouncingScrollPhysics(),
          slivers: [
              const SliverToBoxAdapter(
              child: SizedBox(
                height: 32,
              ),
            ),
                NewsListviewbilder(category: category),
        
          ],
        ),

      ),
      
    );
        
}
}