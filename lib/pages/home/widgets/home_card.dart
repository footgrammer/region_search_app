import 'package:flutter/material.dart';

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
            Text(title, style: titleStyle()),
            Text(category, style: categoryStyle()),
            Text(roadAddress, style: addressStyle()),
          ],
        ),
      ),
    );
  }

  TextStyle titleStyle() {
    return TextStyle(fontSize: 18, fontWeight: FontWeight.bold);
  }

  TextStyle categoryStyle() {
    return TextStyle(fontSize: 12);
  }

  TextStyle addressStyle() {
    return TextStyle(fontSize: 14);
  }
}
