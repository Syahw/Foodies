import "dart:convert";

import "package:flutter/material.dart";
import "package:flutter/services.dart";
import "package:foodies/widgets/custom_button_widgets.dart";
import "package:foodies/widgets/custom_card_widgets.dart";
import "package:foodies/widgets/custom_text_widgets.dart";
import "package:lucide_icons/lucide_icons.dart";

class CartScreen extends StatefulWidget {
  const CartScreen({super.key});

  @override
  State<CartScreen> createState() => _CartScreenState();
}

class _CartScreenState extends State<CartScreen> {
  late List<dynamic> json5 = [];

  @override
  void initState() {
    super.initState();
    loadJson5(4);
  }

  Future<void> loadJson5(int startIndex) async {
    final String response = await rootBundle.loadString('assets/data.json');
    final jsonData = jsonDecode(response);

    setState(() {
      json5 = jsonData.sublist(4);
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: false,
        backgroundColor: const Color.fromARGB(255, 39, 180, 112),
        title: const TextMedium(
          text: 'Cart Page',
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
      body: Stack(
        children: [
          Column(
            children: [
              Expanded(
                child: ListView.builder(
                  itemCount: json5.length,
                  itemBuilder: (BuildContext context, int index) {
                    var foods = json5[index];
                    return Padding(
                      padding: const EdgeInsets.fromLTRB(20, 10, 20, 0),
                      child: ClipRRect(
                        borderRadius: BorderRadius.circular(8),
                        child: MyCard(
                          color: const Color.fromARGB(255, 39, 180, 112),
                          height: 80,
                          width: double.infinity,
                          child: Stack(
                            children: [
                              Padding(
                                padding:
                                    const EdgeInsets.fromLTRB(10, 10, 10, 0),
                                child: Row(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
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
                                                MainAxisAlignment.spaceBetween,
                                            children: [
                                              TextMedium(
                                                text:
                                                    '${foods['name']} - ${foods['quantity']}',
                                                fontWeight: FontWeight.w600,
                                                color: Colors.white,
                                                fontSize: 17,
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
                                bottom: 22,
                                right: 0,
                                child: InkWell(
                                  onTap: () {},
                                  child: Container(
                                    height: 35,
                                    width: 40,
                                    padding: const EdgeInsets.all(5),
                                    decoration: BoxDecoration(
                                      color: Colors.white,
                                      borderRadius: BorderRadius.circular(2),
                                    ),
                                    child: MyIconButton(
                                        color: const Color.fromARGB(255, 51, 51, 51),
                                        iconSize: 15,
                                        padding: EdgeInsets.all(0),
                                        onPressed: () {},
                                        icon: Icon(LucideIcons.edit)),
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
          Positioned(
            bottom: 0,
            right: 0,
            left: 0,
            child: Padding(
              padding: const EdgeInsets.all(12.0),
              child: MyButton(
                onPressed: () {},
                text: 'Check Out',
                child: TextSmall(
                  text: 'Add To Cart',
                  fontWeight: FontWeight.w500,
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
