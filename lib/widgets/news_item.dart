import 'package:flutter/material.dart';
import '../models/news.dart';
import '../screens/detail_screen.dart';

class NewsItem extends StatelessWidget {
  final News news;
  const NewsItem(this.news, {super.key});

  @override
  Widget build(BuildContext context) {
    return ListTile(
      trailing: news.image.isNotEmpty
          ? ClipRRect(
              borderRadius: BorderRadius.circular(8),
              child: Image.network(
                news.image,
                width: 80,
                height: 80,
                fit: BoxFit.cover,
              ),
            )
          : const Icon(Icons.image, size: 60),

      title: Text(news.title, maxLines: 2, overflow: TextOverflow.ellipsis),

      subtitle: Text("VnExpress - ${news.pubDate}"),

      onTap: () {
        Navigator.push(
          context,
          MaterialPageRoute(builder: (_) => DetailScreen(news)),
        );
      },
    );
  }
}
