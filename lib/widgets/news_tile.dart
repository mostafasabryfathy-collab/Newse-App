import 'package:flutter/material.dart';
import 'package:news_app_ui_setup/models/article_model.dart';
import 'package:news_app_ui_setup/widgets/wepview.dart';

// cached network image
class NewsTile extends StatelessWidget {
  const NewsTile({
    super.key,
    required this.articleModel,
  });
  final ArticleModel articleModel;
  @override
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
              onTap: () {
                Navigator.of(context).push(MaterialPageRoute(
                  builder: (_) => WebViewPage(articleModel: articleModel),
                ));
              },
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          ClipRRect(
            borderRadius: BorderRadius.circular(14),
           

              child: AspectRatio(
                aspectRatio: 16 / 9,
                child: Image.network(
                  articleModel.imageUrl ?? '',
                  width: double.infinity,
                  fit: BoxFit.cover,
                  loadingBuilder: (context, child, loadingProgress) {
                    if (loadingProgress == null) return child; 
                    return Container(
                      color: Colors.grey.shade200,
                      child: Center(
                        child: CircularProgressIndicator(
                          value: loadingProgress.expectedTotalBytes != null
                              ? loadingProgress.cumulativeBytesLoaded /
                                  loadingProgress.expectedTotalBytes!
                              : null,
                          color: Colors.orange,
                        ),
                      ),
                    );
                  },
                  errorBuilder: (context, child, error) => Container(
                    color: Colors.grey.shade200,
                    child: Image.asset(
                      'assets/No_Image_Available.png',
                      fit: BoxFit.cover,
                    ),
                  ),
                ),
              ),
            ),
          
          const SizedBox(height: 10),
          Text(
            articleModel.title ?? '',
            maxLines: 2,
            overflow: TextOverflow.ellipsis,
            style: const TextStyle(
              color: Colors.black87,
              fontSize: 17,
              fontWeight: FontWeight.w600,
              height: 1.3,
            ),
          ),
          const SizedBox(height: 6),
          Text(
            articleModel.description ?? '',
            maxLines: 2,
            overflow: TextOverflow.ellipsis,
            style: TextStyle(
              color: Colors.grey.shade600,
              fontSize: 13,
              height: 1.4,
            ),
          ),
        ],
      ),
    );
  }
}
