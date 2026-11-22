import 'package:dio/dio.dart';
import 'package:news_app_ui_setup/models/article_model.dart';


class NewsServices {
  final Dio dio;

  NewsServices(this.dio);

 Future<List<ArticleModel>> getNews({String? category, String? query}) async {
  try {
    var response = await dio.get(
      'https://newsapi.org/v2/top-headlines',
      queryParameters: {
        'country': 'us',
        'apiKey': '43efe50948374074a9883fcfa791d851',
        if (category != null) 'category': category,
        if (query != null) 'q': query,
      },
    );
    return (response.data['articles'] as List)
        .map((e) => ArticleModel.fromJson(e))
        .toList();
  } catch (e) {
    return [];
  }
}
}
