import "package:flutter/material.dart";
import "package:foodies/widgets/custom_container_widgets.dart";
import "package:foodies/widgets/custom_spacing_widgets.dart";
import "package:foodies/widgets/custom_text_widgets.dart";
import "package:lucide_icons/lucide_icons.dart";

class ProfileScreen extends StatefulWidget {
  const ProfileScreen({super.key});

  @override
  State<ProfileScreen> createState() => _ProfileScreenState();
}

class _ProfileScreenState extends State<ProfileScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          automaticallyImplyLeading: false,
          backgroundColor: const Color.fromARGB(255, 39, 180, 112),
          title: const TextMedium(
            text: 'Profile Page',
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
            Positioned(
              top: 0,
              left: 0,
              right: 0,
              child: Center(
                child: MyTopContainer(
                  child: Padding(
                    padding: const EdgeInsets.fromLTRB(20, 20, 20, 10),
                    child: Stack(
                      clipBehavior: Clip.none,
                      children: [
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            TextTitle(
                              text: 'Muhd Syahir',
                              fontSize: 20,
                              color: Colors.black,
                            ),
                            MySpacing(
                              height: 2,
                            ),
                            TextMedium(
                              text: 'Syahirdev@gmail.com',
                              fontSize: 13,
                              color: Colors.black,
                            ),
                          ],
                        ),
                        Positioned(
                          bottom: 0,
                          right: 0,
                          child: TextSmall(text: 'Hot Points : 259'),
                        ),
                        Positioned(
                          left: 0,
                          bottom: -35,
                          child: ClipRRect(
                              borderRadius: BorderRadius.circular(50),
                              child: Container(
                                  width: 70,
                                  height: 70,
                                  color:
                                      const Color.fromARGB(255, 39, 180, 112),
                                  child: Icon(
                                    LucideIcons.user2,
                                    color: Colors.white,
                                    size: 50,
                                  ))),
                        ),
                      ],
                    ),
                  ),
                ),
              ),
            ),
            Positioned(
              top: 200,
              left: 0,
              right: 0,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  Row(
                    children: [
                      MySpacing(
                        width: 20,
                      ),
                      TextMedium(text: 'My Rewards', fontSize: 14),
                    ],
                  ),
                  Sentences(LucideIcons.gift, 'Claim My Rewards',
                      LucideIcons.chevronRight),
                  Sentences(LucideIcons.badgeDollarSign, 'Collect Rewards',
                      LucideIcons.chevronRight),
                  Divider(
                    thickness: 1,
                    color: Colors.grey.shade500,
                    indent: 20,
                    endIndent: 20,
                  ),
                  MySpacing(
                    height: 19,
                  ),
                  Row(
                    children: [
                      MySpacing(
                        width: 20,
                      ),
                      TextMedium(text: 'Vouchers', fontSize: 14),
                    ],
                  ),
                  Sentences(LucideIcons.ticket, 'Vouchers Collection',
                      LucideIcons.chevronRight),
                  Sentences(LucideIcons.helpingHand, 'Give Vouchers',
                      LucideIcons.chevronRight),
                  Sentences(LucideIcons.receipt, 'Collect More Vouchers',
                      LucideIcons.chevronRight),
                  Divider(
                    thickness: 1,
                    color: Colors.grey.shade500,
                    indent: 20,
                    endIndent: 20,
                  ),
                ],
              ),
            )
          ],
        ));
  }
}

Widget Sentences(IconData leadingIcon, String string, IconData endingIcon) {
  return Column(
    mainAxisAlignment: MainAxisAlignment.center,
    children: [
      Divider(
        thickness: 1,
        color: Colors.grey.shade500,
        indent: 20,
        endIndent: 20,
      ),
      Row(
        children: [
          MySpacing(
            width: 20,
          ),
          Icon(leadingIcon),
          MySpacing(
            width: 20,
          ),
          Expanded(
            child: Padding(
              padding: const EdgeInsets.fromLTRB(0, 0, 20, 0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  TextSmall(text: string),
                  Icon(endingIcon),
                ],
              ),
            ),
          ),
        ],
      ),
    ],
  );
}
