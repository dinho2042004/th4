import 'package:flutter/material.dart';
import '../services/rss_service.dart';
import '../widgets/news_item.dart';

class CategoryScreen extends StatelessWidget {
  const CategoryScreen({super.key});

  final Map<String, String> categories = const {
    "Thời sự": "https://vnexpress.net/rss/thoi-su.rss",
    "Thế giới": "https://vnexpress.net/rss/the-gioi.rss",
    "Công nghệ": "https://vnexpress.net/rss/so-hoa.rss",
  };

  @override
  Widget build(BuildContext context) {
    return ListView(
      children: categories.keys.map((key) {
        return ListTile(
          title: Text(key),
          onTap: () {
            Navigator.push(
              context,
              MaterialPageRoute(
                builder: (_) => CategoryDetail(categories[key]!),
              ),
            );
          },
        );
      }).toList(),
    );
  }
}

class CategoryDetail extends StatelessWidget {
  final String url;
  const CategoryDetail(this.url, {super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text("Chủ đề")),
      body: FutureBuilder(
        future: RssService.fetchNews(url),
        builder: (context, snapshot) {
          if (!snapshot.hasData) return const CircularProgressIndicator();

          final news = snapshot.data!;
          return ListView(children: news.map((e) => NewsItem(e)).toList());
        },
      ),
    );
  }
}
