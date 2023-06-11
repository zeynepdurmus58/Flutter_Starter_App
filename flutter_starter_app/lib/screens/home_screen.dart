// ignore_for_file: prefer_const_constructors, prefer_const_literals_to_create_immutables, unused_local_variable, use_build_context_synchronously, avoid_print, unnecessary_null_comparison, avoid_unnecessary_containers, unused_import, non_constant_identifier_names

import 'package:animate_do/animate_do.dart';
import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:iconsax/iconsax.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  List<dynamic> news = [];
  int current_page = 1;
  late ScrollController controller;
  bool loading = false;

  loadNews({int page = 1}) async {
    setState(() {
      loading = true;
    }); 
    if(page != 1) {
      controller.jumpTo(controller.offset + 50);
    }
    
    Dio dio = Dio();
    var response =
        await dio.get("https://www.nginx.com/wp-json/wp/v2/posts?page$page");

    if (response.statusCode == 200) {
      print(response.data);
      if (page == 1) {
        news = response.data;
      } else {
        news.addAll(response.data);
      }
      current_page = page;
      loading = false;
      setState(() {});
    } else {
      ScaffoldMessenger.of(context)
          .showSnackBar(SnackBar(content: Text("Hata oluştu")));
          setState(() {
            loading = false;
          });
    }
  }

  Widget getNews() {
    if (news != null) {
      var haberler = news
          .map((e) => Container(
                margin: EdgeInsets.all(5),
                padding: EdgeInsets.all(5),
                decoration: BoxDecoration(
                  border: Border.all(),
                  borderRadius: BorderRadius.circular(10),
                ),
                child: Column(
                  children: [
                    AspectRatio(aspectRatio: 16/9, child: e["yoast_head_json"]["twitter_image"] != null
                        ? Image.network(e["yoast_head_json"]["twitter_image"])
                        : Image.network("https://upload.wikimedia.org/wikipedia/commons/thumb/a/ac/No_image_available.svg/1024px-No_image_available.svg.png"),),
                    e["yoast_head_json"]["twitter_image"] != null
                        ? Image.network(e["yoast_head_json"]["twitter_image"])
                        : SizedBox(),
                    Text(e["yoast_head_json"]["title"]),
                    Divider(),
                    Text(e["yoast_head_json"]["description"]),
                  ],
                ),
              ))
          .toList();
      return Column(children: haberler);
    } else {
      return Text("Loading");
    }
  }

  _scrollListener() {
    if (controller.offset >= controller.position.maxScrollExtent &&
        !controller.position.outOfRange) {
      // sayfanın sonuna geldi
      loadNews(page: current_page + 1);
    }
    if (controller.offset <= controller.position.minScrollExtent &&
        !controller.position.outOfRange) {
      // sayfanın başına geldi
    } else {}
  }

  @override
  void initState() {
    super.initState();
    loadNews();
    controller = ScrollController();
    controller.addListener(_scrollListener);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        actions: [
          Padding(
            padding: const EdgeInsets.only(right: 20.0),
            child: InkWell(
              child: Icon(Iconsax.support),
              onTap: () => GoRouter.of(context).push('/support'),
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(right: 20.0),
            child: InkWell(
              child: Icon(Iconsax.setting),
              onTap: () => GoRouter.of(context).push('/settings'),
            ),
          ),
        ],
        title: Text('Home'),
      ),
      body: SingleChildScrollView(
        controller: controller,
        child: Column(
          children: [
            Text(
              "News",
              style: TextStyle(
                fontSize: 20,
                color: Colors.black,
                fontStyle: FontStyle.italic,
                fontWeight: FontWeight.bold,
                
              ),
            ),
            getNews(),
            loading ? Container(height: 50, margin: EdgeInsets.only(bottom: 10) ,child: const CircularProgressIndicator()) : const SizedBox(),
            /* FadeIn(
              child: Container(
                //height: 100,
                //width: double.infinity,
                margin: EdgeInsets.all(8),
                decoration: BoxDecoration(
                  color: Color.fromARGB(255, 34, 66, 35),
                  borderRadius: BorderRadius.circular(15),
                ),
                //child: getNews(),
              ),
            ),
            Row(
              children: [
                Expanded(
                  child: FadeInLeft(
                    child: Container(
                      margin: EdgeInsets.all(8),
                      width: double.infinity,
                      height: 100,
                      decoration: BoxDecoration(
                        color: const Color.fromARGB(255, 104, 243, 109),
                        borderRadius: BorderRadius.circular(15),
                      ),
                    ),
                  ),
                ),
                Expanded(
                  child: FadeInDown(
                    child: Container(
                      margin: EdgeInsets.all(8),
                      width: double.infinity,
                      height: 100,
                      decoration: BoxDecoration(
                        color: Color.fromARGB(255, 9, 221, 16),
                        borderRadius: BorderRadius.circular(15),
                      ),
                    ),
                  ),
                ),
                Expanded(
                  child: FadeInRight(
                    child: Container(
                      margin: EdgeInsets.all(8),
                      width: double.infinity,
                      height: 100,
                      decoration: BoxDecoration(
                        color: Colors.greenAccent,
                        borderRadius: BorderRadius.circular(15),
                      ),
                    ),
                  ),
                ),
              ],
            ),
            Row(
              children: [
                Expanded(
                  child: ElasticIn(
                    child: Container(
                      margin: EdgeInsets.all(8),
                      width: double.infinity,
                      height: 100,
                      decoration: BoxDecoration(
                        color: Color.fromARGB(255, 9, 221, 16),
                        borderRadius: BorderRadius.circular(15),
                      ),
                    ),
                  ),
                ),
                Expanded(
                  child: BounceInRight(
                    child: Container(
                      margin: EdgeInsets.all(8),
                      width: double.infinity,
                      height: 100,
                      decoration: BoxDecoration(
                        color: Colors.greenAccent,
                        borderRadius: BorderRadius.circular(15),
                      ),
                    ),
                  ),
                ),
                Expanded(
                  child: BounceInDown(
                    child: Container(
                      margin: EdgeInsets.all(8),
                      width: double.infinity,
                      height: 100,
                      decoration: BoxDecoration(
                        color: const Color.fromARGB(255, 104, 243, 109),
                        borderRadius: BorderRadius.circular(15),
                      ),
                    ),
                  ),
                ),
              ],
            ),
            Row(
              children: [
                Expanded(
                  child: SlideInLeft(
                    child: Container(
                      margin: EdgeInsets.all(8),
                      width: double.infinity,
                      height: 100,
                      decoration: BoxDecoration(
                        color: Colors.greenAccent,
                        borderRadius: BorderRadius.circular(15),
                      ),
                    ),
                  ),
                ),
                Expanded(
                  child: SlideInRight(
                    child: Container(
                      margin: EdgeInsets.all(8),
                      width: double.infinity,
                      height: 100,
                      decoration: BoxDecoration(
                        color: const Color.fromARGB(255, 104, 243, 109),
                        borderRadius: BorderRadius.circular(15),
                      ),
                    ),
                  ),
                ),
                Expanded(
                  child: SlideInDown(
                    child: Container(
                      margin: EdgeInsets.all(8),
                      width: double.infinity,
                      height: 100,
                      decoration: BoxDecoration(
                        color: Color.fromARGB(255, 9, 221, 16),
                        borderRadius: BorderRadius.circular(15),
                      ),
                    ),
                  ),
                ),
              ],
            ),
            Row(
              children: [
                Expanded(
                  child: FlipInX(
                    child: Container(
                      margin: EdgeInsets.all(8),
                      width: double.infinity,
                      height: 100,
                      decoration: BoxDecoration(
                        color: Color.fromARGB(255, 10, 205, 143),
                        borderRadius: BorderRadius.circular(15),
                      ),
                    ),
                  ),
                ),
                Expanded(
                  child: FlipInY(
                    child: Container(
                      margin: EdgeInsets.all(8),
                      width: double.infinity,
                      height: 100,
                      decoration: BoxDecoration(
                        color: Color.fromARGB(255, 9, 221, 16),
                        borderRadius: BorderRadius.circular(15),
                      ),
                    ),
                  ),
                ),
                Expanded(
                  child: ZoomIn(
                    child: Container(
                      margin: EdgeInsets.all(8),
                      width: double.infinity,
                      height: 100,
                      decoration: BoxDecoration(
                        color: Colors.greenAccent,
                        borderRadius: BorderRadius.circular(15),
                      ),
                    ),
                  ),
                ),
              ],
            ),
            Row(
              children: [
                Expanded(
                  child: FadeInLeft(
                    child: Container(
                      margin: EdgeInsets.all(8),
                      width: double.infinity,
                      height: 100,
                      decoration: BoxDecoration(
                        color: Color.fromARGB(255, 203, 217, 204),
                        borderRadius: BorderRadius.circular(15),
                      ),
                    ),
                  ),
                ),
                Expanded(
                  child: FadeInLeft(
                    child: Container(
                      margin: EdgeInsets.all(8),
                      width: double.infinity,
                      height: 100,
                      decoration: BoxDecoration(
                        color: Color.fromARGB(255, 10, 205, 143),
                        borderRadius: BorderRadius.circular(15),
                      ),
                    ),
                  ),
                ),
                Expanded(
                  child: FadeInLeft(
                    child: Container(
                      margin: EdgeInsets.all(8),
                      width: double.infinity,
                      height: 100,
                      decoration: BoxDecoration(
                        color: Color.fromARGB(255, 53, 125, 140),
                        borderRadius: BorderRadius.circular(15),
                      ),
                    ),
                  ),
                ),
              ],
            ),
           */],
        ),
      ),
    );
  }
}
