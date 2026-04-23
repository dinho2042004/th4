import 'package:flutter/material.dart';
import '../services/rss_service.dart';
import '../widgets/news_item.dart';

class HomeTab extends StatelessWidget {
  const HomeTab({super.key});

  @override
  Widget build(BuildContext context) {
    return FutureBuilder(
      future: RssService.fetchNews(
        "https://vnexpress.net/rss/tin-moi-nhat.rss",
      ),
      builder: (context, snapshot) {
        if (!snapshot.hasData) {
          return const Center(child: CircularProgressIndicator());
        }

        final news = snapshot.data!;

        return ListView.builder(
          itemCount: news.length,
          itemBuilder: (context, index) {
            return NewsItem(news[index]);
          },
        );
      },
    );
  }
}
