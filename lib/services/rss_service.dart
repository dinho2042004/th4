import 'package:http/http.dart' as http;
import 'package:webfeed/webfeed.dart';
import '../models/news.dart';

class RssService {
  static Future<List<News>> fetchNews(String url) async {
    final response = await http.get(Uri.parse(url));

    if (response.statusCode == 200) {
      final rss = RssFeed.parse(response.body);

      return rss.items!.map((item) {
        final description = item.description ?? "";
        final img =
            RegExp(
              r'<img[^>]+src="([^">]+)"',
            ).firstMatch(description)?.group(1) ??
            "";

        return News(
          title: item.title ?? "",
          link: item.link ?? "",
          pubDate: item.pubDate?.toString() ?? "",
          image: img,
        );
      }).toList();
    } else {
      throw Exception("Failed");
    }
  }
}
