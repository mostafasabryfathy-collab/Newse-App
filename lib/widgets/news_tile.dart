import 'package:flutter/material.dart';
import 'package:news_app_ui_setup/models/article_model.dart';


// cached network image
class NewsTile extends StatelessWidget {
  const NewsTile({super.key, required this.articleModel,});
 final ArticleModel articleModel  ;
 
  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisSize: MainAxisSize.min,
      children: [
        ClipRRect(
            borderRadius: BorderRadius.circular(6),
            child: Image.network( articleModel.imageUrl ??
                'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcSS7Y7hX31uEKwma9W2grCWEMtZNSbkT7USEtdgMcR-dw&s',      
             height: 200,
              width: double.infinity,
              fit: BoxFit.cover,
            )),
        const SizedBox(
          height: 12,
        ),
         Text(
          articleModel.title ?? '',
          maxLines: 2,
          overflow: TextOverflow.ellipsis,
          style:  const TextStyle(
            color: Colors.black87,
            fontSize: 20,
            fontWeight: FontWeight.w500,
          ),
        ),
        const SizedBox(
          height: 8,
        ),
        Text(
          articleModel.description ?? '',
          maxLines: 2,
          overflow: TextOverflow.ellipsis,
          style: const TextStyle(color: Colors.grey, fontSize: 14),
        )
      ],
    );
  }
}
