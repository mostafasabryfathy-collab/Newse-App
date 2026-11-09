import 'package:dio/dio.dart';
import 'package:news_app_ui_setup/models/article_model.dart';


class NewsServices {
  final Dio dio;

  NewsServices(this.dio);

 Future<List<ArticleModel>> getNews() async {
    try {
      var response = await dio.get(
          'https://newsapi.org/v2/top-headlines?country=us&apiKey=43efe50948374074a9883fcfa791d851');
      Map<String, dynamic> jsondata = response.data;
      List<dynamic> articles = jsondata['articles'];
      
      List<ArticleModel> articlesList = [];
      for (var article in articles) {
        ArticleModel articleModel = ArticleModel(
          title: article['title'],
          description: article['description'],
          imageUrl: article['urlToImage'],
        );
        articlesList.add(articleModel);
      }
         
      return articlesList;
    }  catch (e) {
      return [];
    }
  }
}
