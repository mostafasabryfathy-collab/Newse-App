// ignore: file_names
import 'package:flutter/material.dart';
import 'package:news_app_ui_setup/models/category_model.dart';
import 'package:news_app_ui_setup/widgets/category_card.dart';

// ignore: must_be_immutable
class CatrgoryListView extends StatelessWidget {
   CatrgoryListView({super.key,});
 

  
    List<CategoryModel> category =  const[
     CategoryModel(image: 'assets/technology.jpeg', categoryName: 'Technology'),
     CategoryModel(image: 'assets/health.jpeg', categoryName: 'Health'),
     CategoryModel(image: 'assets/science.jpeg', categoryName: 'Science'),
     CategoryModel(image: 'assets/entertaiment.jpeg', categoryName: 'Entertainment'),
     CategoryModel(image: 'assets/science.jpeg', categoryName: 'Sports'),
     CategoryModel(image: 'assets/technology.jpeg', categoryName: 'General'),
     CategoryModel(image: 'assets/business.jpeg', categoryName: 'Business'),


  ];


  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 90, 
      child: ListView.builder(
        physics: const BouncingScrollPhysics(),
        scrollDirection: Axis.horizontal,
        itemCount: category.length,
        itemBuilder: (context, index) {
          return CategoryCard(categoryModel: category[index]);
        },
      ),
    );
  }
}