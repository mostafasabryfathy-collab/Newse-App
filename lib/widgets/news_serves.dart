import 'package:dio/dio.dart';
import 'package:news_app_ui_setup/models/article_model.dart';


class NewsServices {
  final Dio dio;
  NewsServices(this.dio);

  static final Map<String, List<ArticleModel>> _cache = {};

  Future<List<ArticleModel>> getNews({bool forceRefresh = false, String? category, String? query}) async {
    final key = category?.toLowerCase() ?? '';
    if (query == null && _cache.containsKey(key)) return _cache[key]!;

    try {
      var response = await dio.get(
        'https://newsapi.org/v2/top-headlines',
        queryParameters: {
          'country': 'us',
          'apiKey': '43efe50948374074a9883fcfa791d851',
          if (category != null) 'category': category.toLowerCase(),
          if (query != null) 'q': query,
        },
      );
      final list = (response.data['articles'] as List)
          .map((e) => ArticleModel.fromJson(e))
          .toList();

      if (query == null && list.isNotEmpty) _cache[key] = list;
      return list;
    } catch (e) {
      return [];
    }
  }
}
