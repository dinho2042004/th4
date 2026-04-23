import 'package:flutter/material.dart';
import '../services/rss_service.dart';
import '../widgets/news_item.dart';

class LatestScreen extends StatelessWidget {
  const LatestScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return FutureBuilder(
      future: RssService.fetchNews(
        "https://vnexpress.net/rss/tin-moi-nhat.rss",
      ),
      builder: (context, snapshot) {
        if (!snapshot.hasData) return const CircularProgressIndicator();

        final news = snapshot.data!.take(10).toList();

        return ListView(children: news.map((e) => NewsItem(e)).toList());
      },
    );
  }
}
