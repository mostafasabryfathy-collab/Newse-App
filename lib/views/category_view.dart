import 'package:flutter/material.dart';
import 'package:news_app_ui_setup/widgets/news_list_view_bilder.dart';

class CategoryView extends StatelessWidget {
  const CategoryView({super.key});

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      body: Padding(
        padding: EdgeInsets.symmetric(horizontal: 16),

        child: CustomScrollView(
          physics:  BouncingScrollPhysics(),
          slivers: [
              SliverToBoxAdapter(
              child: SizedBox(
                height: 32,
              ),
            ),
                NewsListviewbilder(),
        
          ],
        ),

      ),
      
    );
        
}
}