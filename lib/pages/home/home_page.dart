import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:region_search_app/data/model/location.dart';
import 'package:region_search_app/pages/home/home_view_model.dart';
import 'package:region_search_app/pages/home/widgets/home_card.dart';

class HomePage extends ConsumerStatefulWidget {
  @override
  ConsumerState<HomePage> createState() {
    return _HomePageState();
  }
}

class _HomePageState extends ConsumerState<HomePage> {
  TextEditingController textController = TextEditingController();

  void search(String text) {
    ref.read(homeViewModelProvider.notifier).searchLocations(text);
  }

  @override
  void dispose() {
    textController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    HomeState homeState = ref.watch(homeViewModelProvider);

    return GestureDetector(
      onTap: () {
        FocusScope.of(context).unfocus();
      },
      child: Scaffold(appBar: getAppBar(), body: getListView(homeState)),
    );
  }

  ListView getListView(HomeState homeState) {
    return ListView.builder(
      itemCount: homeState.locations?.length ?? 0,
      itemBuilder: (context, index) {
        Location location = homeState.locations![index];
        return HomeCard(
          title: location.title,
          category: location.category,
          roadAddress: location.roadAddress,
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
          onTap: () {
            search(textController.text);
          },
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
}
