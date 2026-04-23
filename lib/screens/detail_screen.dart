import 'package:flutter/material.dart';
import 'package:webview_flutter/webview_flutter.dart';
import '../models/news.dart';

class DetailScreen extends StatefulWidget {
  final News news;

  const DetailScreen(this.news, {super.key});

  @override
  State<DetailScreen> createState() => _DetailScreenState();
}

class _DetailScreenState extends State<DetailScreen> {
  late final WebViewController controller;

  @override
  void initState() {
    super.initState();

    controller = WebViewController()
      ..setJavaScriptMode(JavaScriptMode.unrestricted)
      ..loadRequest(Uri.parse(widget.news.link));
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text(widget.news.title)),
      body: WebViewWidget(controller: controller),
    );
  }
}
