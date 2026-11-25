import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:news_app_ui_setup/views/home_view.dart';
import 'package:news_app_ui_setup/widgets/news_serves.dart';

class SplashView extends StatefulWidget {
  const SplashView({super.key});

  @override
  State<SplashView> createState() => _SplashViewState();
}

class _SplashViewState extends State<SplashView> {
 @override
void initState() {
  super.initState();
  _loadData();
}

Future<void> _loadData() async {
  final service = NewsServices(Dio());
  const categories = [
    'general', 'technology', 'health',
    'science', 'entertainment', 'sports', 'business',
  ];


  await Future.wait([
    ...categories.map((c) => service.getNews(category: c)),
    Future.delayed(const Duration(seconds: 2)),
  ]);

  if (!mounted) return;


  for (final img in ['technology', 'health', 'science',
      'entertaiment', 'business']) {
    await precacheImage(AssetImage('assets/$img.jpeg'), context);
  }

  
  final general = await service.getNews(category: 'general');
  for (final a in general.take(8)) {
    if (a.imageUrl != null) {
      if (!mounted) return;
      await precacheImage(NetworkImage(a.imageUrl!), context)
          .catchError((_) {});
    }
  }

  if (!mounted) return;
  Navigator.of(context).pushReplacement(
    MaterialPageRoute(builder: (_) => const HomeView()),
  );
}
  @override
Widget build(BuildContext context) {
  return Scaffold(
    body: Stack(
      fit: StackFit.expand,
      children: [
        Image.asset('assets/splash_bg.png', fit: BoxFit.cover),
        const Positioned(
          bottom: 80,
          left: 0,
          right: 0,
          
          child: Center(
            child: CircularProgressIndicator(color: Colors.orange),
          ),
        ),
      ],
    ),
  );
}
}