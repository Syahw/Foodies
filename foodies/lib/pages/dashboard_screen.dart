import 'dart:convert';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:foodies/widgets/custom_card_widgets.dart';
import 'package:foodies/widgets/custom_spacing_widgets.dart';
import 'package:foodies/widgets/custom_text_widgets.dart';
import 'package:lucide_icons/lucide_icons.dart';

class DashboardScreen extends StatefulWidget {
  const DashboardScreen({super.key});

  @override
  State<DashboardScreen> createState() => _DashboardScreenState();
}

class _DashboardScreenState extends State<DashboardScreen> {
  late List<dynamic> jsonData = [];
  late List<dynamic> json5 = [];

  @override
  void initState() {
    super.initState();
    loadJsonData();
    loadJson5(5);
  }

  Future<void> loadJsonData() async {
    final String response = await rootBundle.loadString('assets/data.json');
    final data = jsonDecode(response);
    setState(() {
      jsonData = data;
    });
  }

  Future<void> loadJson5(int startIndex) async {
    final String response = await rootBundle.loadString('assets/data.json');
    final data5 = jsonDecode(response);
    setState(() {
      json5 = data5.sublist(4);
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: false,
        backgroundColor: const Color.fromARGB(255, 39, 180, 112),
        title: const TextMedium(
          text: 'Welcome back , Syahir',
          color: Colors.white,
          fontSize: 20,
        ),
        actions: [
          IconButton(
              onPressed: () {},
              icon: const Icon(
                LucideIcons.bell,
                color: Colors.white,
                size: 20,
              )),
          IconButton(
              onPressed: () {
                Navigator.pop(context);
              },
              icon: const Icon(
                LucideIcons.logOut,
                color: Colors.red,
                size: 20,
              ))
        ],
      ),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          const Padding(
            padding: EdgeInsets.fromLTRB(20, 20, 20, 10),
            child: MyCard(
              height: 145,
              color: Color.fromARGB(255, 39, 180, 112),
              width: double.infinity,
              child: Stack(
                children: [
                  Column(
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      Padding(
                        padding: EdgeInsets.fromLTRB(15, 20, 0, 0),
                        child: TextMedium(
                          text: 'SPECIAL OFFERS !',
                          color: Colors.white,
                          fontWeight: FontWeight.w600,
                        ),
                      ),
                    ],
                  ),
                  MySpacing(
                    height: 10,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.end,
                    children: [
                      Padding(
                        padding: EdgeInsets.fromLTRB(0, 10, 5, 0),
                        child: Image(
                            image: AssetImage('assets/teriyaki-burger.png')),
                      )
                    ],
                  ),
                  Column(
                    mainAxisAlignment: MainAxisAlignment.end,
                    children: [
                      Padding(
                        padding: EdgeInsets.fromLTRB(15, 0, 0, 40),
                        child: TextSmall(
                          text:
                              'Get 20% off on our delectable\nfamily-sized buckets of \ncrispy chicken burger.',
                          color: Colors.white,
                          fontWeight: FontWeight.w600,
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ),
          ),
          const Row(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Icon(
                CupertinoIcons.ellipsis,
                size: 40,
                color: Color.fromARGB(255, 39, 180, 112),
              )
            ],
          ),
          const Row(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              Padding(
                padding: EdgeInsets.fromLTRB(20, 0, 0, 0),
                child: Icon(
                  LucideIcons.star,
                  size: 20,
                ),
              ),
              MySpacing(
                width: 10,
              ),
              TextMedium(text: 'Today\'s Hot Item'),
            ],
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              Expanded(
                child: Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: SizedBox(
                    width: 250,
                    height: 150,
                    child: jsonData.isEmpty
                        ? Center(child: CircularProgressIndicator())
                        : ListView.builder(
                            scrollDirection: Axis.horizontal,
                            itemCount: jsonData.length,
                            itemBuilder: (BuildContext context, int index) {
                              var item = jsonData[index];
                              return MyCard(
                                color: const Color.fromARGB(255, 39, 180, 112),
                                height: 120,
                                shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(10),
                                ),
                                width: 120,
                                child: Center(
                                  child: Column(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.center,
                                    children: [
                                      SizedBox(
                                        height: 90,
                                        width: 120,
                                        child: Image(
                                            image: AssetImage(item['image'])),
                                      ),
                                      Padding(
                                        padding: const EdgeInsets.fromLTRB(
                                            10, 0, 10, 0),
                                        child: TextSmall(
                                          text: item['name'],
                                          color: Colors.white,
                                        ),
                                      )
                                    ],
                                  ),
                                ),
                              );
                            },
                          ),
                  ),
                ),
              ),
            ],
          ),
          MySpacing(
            height: 10,
          ),
          const Row(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              MySpacing(
                width: 20,
              ),
              TextMedium(text: 'Your Recent Purchase'),
            ],
          ),
          Expanded(
            child: Column(
              children: [
                Expanded(
                  child: ListView.builder(
                    itemCount: json5.length,
                    itemBuilder: (BuildContext context, int index) {
                      var foods = json5[index];
                      return Padding(
                        padding: const EdgeInsets.fromLTRB(20, 10, 20, 0),
                        child: ClipRRect(
                          borderRadius: BorderRadius.circular(
                              8), // Adjust radius as needed
                          child: MyCard(
                            color: const Color.fromARGB(255, 39, 180, 112),
                            height: 80, // Increase height for demo purposes
                            width: double.infinity,
                            child: Stack(
                              children: [
                                Padding(
                                  padding:
                                      const EdgeInsets.fromLTRB(10, 10, 10, 0),
                                  child: Row(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: [
                                      // Image Section
                                      Image(
                                        image: AssetImage(foods['image']),
                                        width: 60,
                                        height: 60,
                                        fit: BoxFit.cover,
                                      ),
                                      const SizedBox(width: 10),

                                      Expanded(
                                        child: Column(
                                          crossAxisAlignment:
                                              CrossAxisAlignment.start,
                                          children: [
                                            Row(
                                              mainAxisAlignment:
                                                  MainAxisAlignment
                                                      .spaceBetween,
                                              children: [
                                                TextMedium(
                                                  text: foods['name'],
                                                  fontWeight: FontWeight.w600,
                                                  color: Colors.white,
                                                  fontSize: 17,
                                                ),
                                                Icon(
                                                  LucideIcons.heart,
                                                  size: 20,
                                                  color: Colors.white,
                                                ),
                                              ],
                                            ),
                                            TextSmall(
                                              text: foods['description'],
                                              color: Colors.white,
                                            ),
                                          ],
                                        ),
                                      ),
                                    ],
                                  ),
                                ),
                                Positioned(
                                  bottom: 0,
                                  right: 0,
                                  child: InkWell(
                                    onTap: () {},
                                    child: Container(
                                      height: 35,
                                      padding: const EdgeInsets.all(8),
                                      decoration: BoxDecoration(
                                        color: Colors.white,
                                        borderRadius: BorderRadius.circular(6),
                                      ),
                                      child: TextSmall(
                                        text: 'Add To Cart',
                                        fontWeight: FontWeight.w500,
                                      ),
                                    ),
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ),
                      );
                    },
                  ),
                ),
              ],
            ),
          )
        ],
      ),
    );
  }
}
