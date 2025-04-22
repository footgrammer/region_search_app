import 'package:flutter/material.dart';
import 'package:flutter_inappwebview/flutter_inappwebview.dart';

class DetailPage extends StatelessWidget {
  String link;
  DetailPage(this.link, {super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('상세 페이지')),
      body: InAppWebView(
        initialUrlRequest: URLRequest(url: WebUri('https://www.naver.com')),
      ),
    );
  }
}
