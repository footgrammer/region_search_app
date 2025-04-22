import 'package:flutter/material.dart';
import 'package:flutter_html/flutter_html.dart';

class HomeCard extends StatelessWidget {
  String title;
  String category;
  String roadAddress;

  HomeCard({
    required this.title,
    required this.category,
    required this.roadAddress,
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.symmetric(horizontal: 16, vertical: 8),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(10),
        color: Colors.white,
      ),
      child: Padding(
        padding: EdgeInsets.symmetric(horizontal: 16, vertical: 8),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Html(
              data: title,
              style: {
                "*": Style(fontSize: FontSize(20), fontWeight: FontWeight.bold),
                "body": Style(margin: Margins.zero, padding: HtmlPaddings.zero),
              },
            ),
            Text(category, style: categoryStyle()),
            Text(roadAddress, style: addressStyle()),
          ],
        ),
      ),
    );
  }

  TextStyle categoryStyle() {
    return TextStyle(fontSize: 12);
  }

  TextStyle addressStyle() {
    return TextStyle(fontSize: 14);
  }
}
