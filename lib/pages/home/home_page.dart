import 'package:flutter/material.dart';
import 'package:region_search_app/pages/home/widgets/home_card.dart';

class HomePage extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return _HomePageState();
  }
}

class _HomePageState extends State<HomePage> {
  TextEditingController textController = TextEditingController();

  @override
  void dispose() {
    textController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        FocusScope.of(context).unfocus();
      },
      child: Scaffold(appBar: getAppBar(), body: getListView()),
    );
  }

  ListView getListView() {
    return ListView.builder(
      itemCount: 10,
      itemBuilder: (context, index) {
        return HomeCard(
          title: 'title',
          category: 'category',
          roadAddress: 'roadAddress',
        );
      },
    );
  }

  AppBar getAppBar() {
    return AppBar(
      title: TextField(
        maxLines: 1,
        controller: textController,
        onSubmitted: search,
        decoration: InputDecoration(
          hintText: '검색어를 입력해 주세요',
          border: WidgetStateInputBorder.resolveWith((states) {
            if (states.contains(WidgetState.focused)) {
              return OutlineInputBorder(
                borderRadius: BorderRadius.circular(10),
                borderSide: BorderSide(color: Colors.black),
              );
            }
            return OutlineInputBorder(
              borderRadius: BorderRadius.circular(10),
              borderSide: BorderSide(color: Colors.grey),
            );
          }),
        ),
      ),
      actions: [
        GestureDetector(
          onTap: () {},
          child: Container(
            width: 50,
            height: 50,
            color: Colors.transparent,
            child: Icon(Icons.search),
          ),
        ),
      ],
    );
  }

  void search(String text) {
    print(text);
  }
}
