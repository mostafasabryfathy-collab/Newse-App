class ArticleModel {
 final String? title;
 final String? description;
 final String? imageUrl;
 final String? url;

  ArticleModel({
    required this.title,
    required this.description,
    required this.imageUrl,
    required this.url,
  });
   
  factory ArticleModel.fromJson(json){
    return ArticleModel(
      title: json['title'],
      description: json['description'],
      imageUrl: json['urlToImage'],
      url: json['url'],
    );
  }


}