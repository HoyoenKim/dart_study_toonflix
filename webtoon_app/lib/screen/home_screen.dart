import 'package:flutter/material.dart';
import 'package:webtoon_app/models/webtoon_model.dart';
import 'package:webtoon_app/service/api_service.dart';

import '../widget/webtoon_widget.dart';

// stateful data fetch
//List<WebtoonModel> webtoons = [];
//bool isLoading = true;
//
//void waitForWebToons() async {
//  webtoons = await ApiService.getTodaysToons();
//  isLoading = false;
//  setState(() {});
//}
//
//@override
//void initState() {
//  super.initState();
//  waitForWebToons();
//}

class HomeScreen extends StatelessWidget {
  HomeScreen({super.key});

  final Future<List<WebtoonModel>> webtoons = ApiService.getTodaysToons();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        elevation: 2,
        foregroundColor: Colors.green,
        backgroundColor: Colors.white,
        title: const Text(
          "오늘의 웹툰",
          style: TextStyle(
            fontSize: 24,
          ),
        ),
      ),
      body: FutureBuilder(
          future: webtoons,
          builder: (context, snapshot) {
            // snapshot: future stateb(get data or error)
            if (snapshot.hasData) {
              return Column(
                children: [
                  const SizedBox(
                    height: 50,
                  ),
                  Expanded(
                    child: makeList(snapshot),
                  ),
                ],
              );
            }
            return const Center(
              child: CircularProgressIndicator(),
            );
          }),
    );
  }

  ListView makeList(AsyncSnapshot<List<WebtoonModel>> snapshot) {
    return ListView.separated(
      scrollDirection: Axis.horizontal,
      itemCount: snapshot.data!.length,
      padding: const EdgeInsets.symmetric(vertical: 10, horizontal: 20),
      itemBuilder: (context, index) {
        // 사용자가 보고 있는 것만 build
        var webtoon = snapshot.data![index];
        return Webtoon(
            title: webtoon.title, thumb: webtoon.thumb, id: webtoon.id);
      },
      separatorBuilder: (context, index) => const SizedBox(
        width: 40,
      ),
    );
  }
}
