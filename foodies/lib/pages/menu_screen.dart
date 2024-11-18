import "dart:convert";

import "package:flutter/cupertino.dart";
import "package:flutter/material.dart";
import "package:flutter/services.dart";
import "package:foodies/widgets/custom_card_widgets.dart";
import "package:foodies/widgets/custom_spacing_widgets.dart";
import "package:foodies/widgets/custom_text_widgets.dart";
import "package:lucide_icons/lucide_icons.dart";

class MenuScreen extends StatefulWidget {
  const MenuScreen({super.key});

  @override
  State<MenuScreen> createState() => _MenuScreenState();
}

class _MenuScreenState extends State<MenuScreen>
    with SingleTickerProviderStateMixin {
  var currentIndex = 0;
  late TabController _tabController;
  late List<dynamic> foodsData = [];
  late List<dynamic> beveragesData = [];
  late List<dynamic> dessertsData = [];
  late List<dynamic> alaCarteData = [];

  var offerTexts = [
    'Enjoy 20% off on our signature\nspicy chicken wings with\nspecial sauce combo!',
    'Save 30% on our premium\nbeef burger platters with\nextra cheese and fries.',
    'Get 25% discount on our fresh\nseafood pasta selection with\ngarlic bread on the side.',
  ];

  var offerImages = [
    'assets/teriyaki-burger.png',
    'assets/beef_burger.png',
    'assets/pasta.png',
  ];

  @override
  void initState() {
    super.initState();
    _tabController = TabController(length: 4, vsync: this);
    LoadFoodsData();
    LoadBeveragesData();
    LoadDessertsData();
    LoadAlaCarteData();
  }

  Future<void> LoadFoodsData() async {
    final String response = await rootBundle.loadString('assets/data.json');
    final jsonData = jsonDecode(response);
    setState(() {
      foodsData = jsonData;
    });
  }

  Future<void> LoadBeveragesData() async {
    final String response =
        await rootBundle.loadString('assets/beverages.json');
    final jsonData = jsonDecode(response);
    setState(() {
      beveragesData = jsonData;
    });
  }

  Future<void> LoadDessertsData() async {
    final String response = await rootBundle.loadString('assets/desserts.json');
    final jsonData = jsonDecode(response);
    setState(() {
      dessertsData = jsonData;
    });
  }

  Future<void> LoadAlaCarteData() async {
    final String response =
        await rootBundle.loadString('assets/ala_carte.json');
    final jsonData = jsonDecode(response);
    setState(() {
      alaCarteData = jsonData;
    });
  }

  @override
  void dispose() {
    _tabController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          automaticallyImplyLeading: false,
          backgroundColor: const Color.fromARGB(255, 39, 180, 112),
          title: const TextMedium(
            text: 'Menu Page',
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
        body: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Padding(
                padding: EdgeInsets.fromLTRB(20, 20, 20, 0),
                child: TextField(
                  decoration: InputDecoration(
                    hintText: 'Search for food...',
                    prefixIcon: const Icon(
                      LucideIcons.search,
                      color: Color.fromARGB(255, 39, 180, 112),
                    ),
                    filled: true,
                    fillColor: Colors.grey[200],
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(12),
                      borderSide: BorderSide.none,
                    ),
                    contentPadding: const EdgeInsets.symmetric(
                        horizontal: 20, vertical: 16),
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.fromLTRB(20, 10, 20, 10),
                child: MyCard(
                  height: 145,
                  color: const Color.fromARGB(255, 39, 180, 112),
                  width: double.infinity,
                  child: Stack(
                    children: [
                      Column(
                        mainAxisAlignment: MainAxisAlignment.start,
                        children: [
                          Padding(
                            padding: EdgeInsets.fromLTRB(15, 10, 0, 0),
                            child: TextMedium(
                              text: 'SPECIAL OFFERS !',
                              color: Colors.white,
                              fontWeight: FontWeight.w600,
                            ),
                          ),
                        ],
                      ),
                      const MySpacing(
                        height: 10,
                      ),
                      PageView.builder(
                        itemCount: 3,
                        itemBuilder: (context, index) {
                          return Row(
                            mainAxisAlignment: MainAxisAlignment.end,
                            children: [
                              Padding(
                                padding: EdgeInsets.fromLTRB(0, 25, 20, 0),
                                child: Image(
                                    fit: BoxFit.cover,
                                    image: AssetImage(offerImages[index])),
                              ),
                              Column(
                                mainAxisAlignment: MainAxisAlignment.end,
                                children: [
                                  Padding(
                                    padding: EdgeInsets.fromLTRB(0, 0, 20, 40),
                                    child: TextSmall(
                                      text: offerTexts[index],
                                      color: Colors.white,
                                      fontWeight: FontWeight.w600,
                                    ),
                                  ),
                                ],
                              ),
                            ],
                          );
                        },
                        onPageChanged: (index) {
                          setState(() {
                            currentIndex = index;
                          });
                        },
                      ),
                    ],
                  ),
                ),
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  for (int i = 0; i < 3; i++)
                    Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 4),
                      child: Icon(
                        CupertinoIcons.circle_fill,
                        size: 10,
                        color: Color.fromARGB(255, 39, 180, 112),
                      ),
                    )
                ],
              ),

              // Add TabBar
              Container(
                color: Colors.white,
                child: TabBar(
                  controller: _tabController,
                  labelColor: const Color.fromARGB(255, 39, 180, 112),
                  unselectedLabelColor: Colors.grey,
                  indicatorColor: const Color.fromARGB(255, 39, 180, 112),
                  tabs: const [
                    Tab(text: 'Foods'),
                    Tab(text: 'Beverages'),
                    Tab(text: 'Desserts'),
                    Tab(text: 'Ala Carte'),
                  ],
                ),
              ),

              SizedBox(
                height: 400,
                child: TabBarView(
                  controller: _tabController,
                  children: [
                    GridView.builder(
                      padding: const EdgeInsets.all(10),
                      gridDelegate:
                          const SliverGridDelegateWithFixedCrossAxisCount(
                        crossAxisCount: 2,
                        childAspectRatio: 0.8,
                        crossAxisSpacing: 10,
                        mainAxisSpacing: 10,
                      ),
                      itemCount: foodsData.length,
                      itemBuilder: (context, index) {
                        return MyCard(
                          color: Colors.white,
                          elevation: 2,
                          child: foodsData.isEmpty
                              ? Center(child: CircularProgressIndicator())
                              : Column(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children: [
                                    ClipRRect(
                                      borderRadius: BorderRadius.circular(8),
                                      child: Image(
                                        image: AssetImage(
                                            foodsData[index]['image']),
                                        height: 80,
                                        width: 80,
                                        fit: BoxFit.cover,
                                        loadingBuilder:
                                            (context, child, loadingProgress) {
                                          if (loadingProgress == null) {
                                            return child;
                                          }
                                          return const Center(
                                            child: CircularProgressIndicator(),
                                          );
                                        },
                                        errorBuilder:
                                            (context, error, stackTrace) {
                                          print('Error loading image: $error');
                                          return Container(
                                            height: 80,
                                            width: 80,
                                            color: Colors.grey[300],
                                            child: const Icon(
                                              Icons.image_not_supported,
                                              color: Colors.grey,
                                            ),
                                          );
                                        },
                                      ),
                                    ),
                                    const SizedBox(height: 8),
                                    TextSmall(
                                      text: foodsData[index]['name'] ??
                                          'Food Item Name',
                                      color: Colors.black,
                                    ),
                                    TextSmall(
                                      text:
                                          'RM ${foodsData[index]['price'] ?? '15.99'}',
                                      color: Color.fromARGB(255, 39, 180, 112),
                                    ),
                                    ElevatedButton(
                                      onPressed: () {},
                                      style: ElevatedButton.styleFrom(
                                        backgroundColor: const Color.fromARGB(
                                            255, 39, 180, 112),
                                        foregroundColor: Colors.white,
                                      ),
                                      child: const Text('Add to Cart'),
                                    ),
                                  ],
                                ),
                        );
                      },
                    ),

                    // Beverages Tab
                    GridView.builder(
                      padding: const EdgeInsets.all(10),
                      gridDelegate:
                          const SliverGridDelegateWithFixedCrossAxisCount(
                        crossAxisCount: 2,
                        childAspectRatio: 0.8,
                        crossAxisSpacing: 10,
                        mainAxisSpacing: 10,
                      ),
                      itemCount: beveragesData.length,
                      itemBuilder: (context, index) {
                        return MyCard(
                          color: Colors.white,
                          elevation: 2,
                          child: beveragesData.isEmpty
                              ? Center(child: CircularProgressIndicator())
                              : Column(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children: [
                                    ClipRRect(
                                      borderRadius: BorderRadius.circular(8),
                                      child: Image.network(
                                        beveragesData[index]['image'],
                                        height: 80,
                                        width: 80,
                                        fit: BoxFit.cover,
                                        loadingBuilder:
                                            (context, child, loadingProgress) {
                                          if (loadingProgress == null) {
                                            return child;
                                          }
                                          return const Center(
                                            child: CircularProgressIndicator(),
                                          );
                                        },
                                        errorBuilder:
                                            (context, error, stackTrace) {
                                          print('Error loading image: $error');
                                          return Container(
                                            height: 80,
                                            width: 80,
                                            color: Colors.grey[300],
                                            child: const Icon(
                                              Icons.image_not_supported,
                                              color: Colors.grey,
                                            ),
                                          );
                                        },
                                      ),
                                    ),
                                    const SizedBox(height: 8),
                                    TextSmall(
                                      text: beveragesData[index]['name'] ??
                                          'Food Item Name',
                                      color: Colors.black,
                                    ),
                                    TextSmall(
                                      text:
                                          'RM ${beveragesData[index]['price'] ?? '15.99'}',
                                      color: Color.fromARGB(255, 39, 180, 112),
                                    ),
                                    ElevatedButton(
                                      onPressed: () {},
                                      style: ElevatedButton.styleFrom(
                                        backgroundColor: const Color.fromARGB(
                                            255, 39, 180, 112),
                                        foregroundColor: Colors.white,
                                      ),
                                      child: const Text('Add to Cart'),
                                    ),
                                  ],
                                ),
                        );
                      },
                    ),

                    // Desserts Tab
                    GridView.builder(
                      padding: const EdgeInsets.all(10),
                      gridDelegate:
                          const SliverGridDelegateWithFixedCrossAxisCount(
                        crossAxisCount: 2,
                        childAspectRatio: 0.8,
                        crossAxisSpacing: 10,
                        mainAxisSpacing: 10,
                      ),
                      itemCount: dessertsData.length,
                      itemBuilder: (context, index) {
                        return MyCard(
                          color: Colors.white,
                          elevation: 2,
                          child: dessertsData.isEmpty
                              ? Center(child: CupertinoActivityIndicator())
                              : Column(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children: [
                                    ClipRRect(
                                      borderRadius: BorderRadius.circular(8),
                                      child: Image.network(
                                        dessertsData[index]['image'],
                                        height: 80,
                                        width: 80,
                                        fit: BoxFit.cover,
                                        loadingBuilder:
                                            (context, child, loadingProgress) {
                                          if (loadingProgress == null) {
                                            return child;
                                          }
                                          return const Center(
                                            child: CupertinoActivityIndicator(),
                                          );
                                        },
                                        errorBuilder:
                                            (context, error, stackTrace) {
                                          print('Error loading image: $error');
                                          return Container(
                                            height: 80,
                                            width: 80,
                                            color: Colors.grey[300],
                                            child: const Icon(
                                              Icons.image_not_supported,
                                              color: Colors.grey,
                                            ),
                                          );
                                        },
                                      ),
                                    ),
                                    const SizedBox(height: 8),
                                    TextSmall(
                                      text: dessertsData[index]['name'] ??
                                          'Food Item Name',
                                      color: Colors.black,
                                    ),
                                    TextSmall(
                                      text:
                                          'RM ${dessertsData[index]['price'] ?? '15.99'}',
                                      color: Color.fromARGB(255, 39, 180, 112),
                                    ),
                                    ElevatedButton(
                                      onPressed: () {},
                                      style: ElevatedButton.styleFrom(
                                        backgroundColor: const Color.fromARGB(
                                            255, 39, 180, 112),
                                        foregroundColor: Colors.white,
                                      ),
                                      child: const Text('Add to Cart'),
                                    ),
                                  ],
                                ),
                        );
                      },
                    ),

                    // Ala Carte Tab
                    GridView.builder(
                      padding: const EdgeInsets.all(10),
                      gridDelegate:
                          const SliverGridDelegateWithFixedCrossAxisCount(
                        crossAxisCount: 2,
                        childAspectRatio: 0.8,
                        crossAxisSpacing: 10,
                        mainAxisSpacing: 10,
                      ),
                      itemCount: alaCarteData.length,
                      itemBuilder: (context, index) {
                        return MyCard(
                          color: Colors.white,
                          elevation: 2,
                          child: alaCarteData.isEmpty
                              ? Center(child: CupertinoActivityIndicator())
                              : Column(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children: [
                                    ClipRRect(
                                      borderRadius: BorderRadius.circular(8),
                                      child: Image.network(
                                        alaCarteData[index]['image'],
                                        height: 80,
                                        width: 80,
                                        fit: BoxFit.cover,
                                        loadingBuilder:
                                            (context, child, loadingProgress) {
                                          if (loadingProgress == null) {
                                            return child;
                                          }
                                          return const Center(
                                            child: CupertinoActivityIndicator(),
                                          );
                                        },
                                        errorBuilder:
                                            (context, error, stackTrace) {
                                          print('Error loading image: $error');
                                          return Container(
                                            height: 80,
                                            width: 80,
                                            color: Colors.grey[300],
                                            child: const Icon(
                                              Icons.image_not_supported,
                                              color: Colors.grey,
                                            ),
                                          );
                                        },
                                      ),
                                    ),
                                    const SizedBox(height: 8),
                                    TextSmall(
                                      text: alaCarteData[index]['name'] ??
                                          'Food Item Name',
                                      color: Colors.black,
                                    ),
                                    TextSmall(
                                      text:
                                          'RM ${alaCarteData[index]['price'] ?? '15.99'}',
                                      color: Color.fromARGB(255, 39, 180, 112),
                                    ),
                                    ElevatedButton(
                                      onPressed: () {},
                                      style: ElevatedButton.styleFrom(
                                        backgroundColor: const Color.fromARGB(
                                            255, 39, 180, 112),
                                        foregroundColor: Colors.white,
                                      ),
                                      child: const Text('Add to Cart'),
                                    ),
                                  ],
                                ),
                        );
                      },
                    ),
                  ],
                ),
              ),
            ],
          ),
        ));
  }
}
