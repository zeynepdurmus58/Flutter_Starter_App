// ignore_for_file: prefer_const_constructors, prefer_const_literals_to_create_immutables

import 'package:animate_do/animate_do.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:iconsax/iconsax.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        actions: [
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
        child: Column(
          children: [
            FadeIn(
              child: Container(
                height: 100,
                width: double.infinity,
                margin: EdgeInsets.all(8),
                decoration: BoxDecoration(
                  color: Color.fromARGB(255, 34, 66, 35),
                  borderRadius: BorderRadius.circular(15),
                ),
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
           ],
        ),
      ),);
  }
}