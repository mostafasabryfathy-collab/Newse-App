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
  await Future.wait([
    Future.delayed(const Duration(seconds: 2)),  
    _preload().timeout(
      const Duration(seconds: 7),                 
      onTimeout: () {},
    ),
  ]);

  if (!mounted) return;
  Navigator.of(context).pushReplacement(
    MaterialPageRoute(builder: (_) => const HomeView()),
  );
}

Future<void> _preload() async {
  try {
    final service = NewsServices(Dio());
    const categories = [
      'general', 'technology', 'health',
      'science', 'entertainment', 'sports', 'business',
    ];

    await Future.wait(categories.map((c) => service.getNews(category: c)));
    if (!mounted) return;

    await Future.wait(
      ['technology', 'health', 'science', 'entertaiment', 'business']
          .map((img) => precacheImage(AssetImage('assets/$img.jpeg'), context)),
    );
    if (!mounted) return;

    final general = await service.getNews(category: 'general');
    await Future.wait(
      general
          .take(8)
          .where((a) => a.imageUrl != null)
          .map((a) => precacheImage(NetworkImage(a.imageUrl!), context)
              .catchError((_) {})),
    );
  } catch (_) {}
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