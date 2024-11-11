import 'package:flutter/material.dart';
import 'package:foodies/navbar.dart';
import 'package:foodies/pages/dashboard_screen.dart';
import 'package:foodies/pages/forgot_password_screen.dart';
import 'package:foodies/widgets/custom_button_widgets.dart';
import 'package:foodies/widgets/custom_spacing_widgets.dart';
import 'package:foodies/widgets/custom_text_widgets.dart';
import 'package:foodies/widgets/custom_container_widgets.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:page_animation_transition/animations/left_to_right_faded_transition.dart';
import 'package:page_animation_transition/animations/right_to_left_transition.dart';
import 'package:page_animation_transition/page_animation_transition.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key});

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        decoration: const BoxDecoration(
          gradient: LinearGradient(
            colors: [
              Color.fromARGB(255, 36, 174, 199),
              Color.fromARGB(220, 12, 255, 133),
            ],
            begin: Alignment.topLeft,
            end: Alignment.bottomRight,
          ),
        ),
        child: Stack(
          children: [
            const Center(
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Padding(
                    padding: EdgeInsets.fromLTRB(0, 0, 0, 600),
                    child: TextTitle(text: 'Foodies'),
                  )
                ],
              ),
            ),
            const Align(
                alignment: Alignment.center,
                child: Padding(
                  padding: EdgeInsets.fromLTRB(0, 0, 0, 240),
                  child: SizedBox(
                      height: 250,
                      width: 250,
                      child:
                          Image(image: AssetImage('assets/Foodies_logo.png'))),
                )),
            Positioned(
              bottom: 0,
              left: 0,
              right: 0,
              child: MyBottomContainer(
                height: 400,
                child: Center(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      const Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Padding(
                            padding: EdgeInsets.fromLTRB(0, 20, 0, 0),
                            child: TextTitle(
                              text: 'Login',
                              color: Colors.black,
                              fontSize: 24.0,
                            ),
                          ),
                        ],
                      ),
                      const Row(
                        mainAxisAlignment: MainAxisAlignment.start,
                        children: [
                          Padding(
                            padding: EdgeInsets.fromLTRB(40, 10, 0, 0),
                            child: TextMedium(
                              text: 'Username',
                            ),
                          ),
                        ],
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.start,
                        children: [
                          Padding(
                            padding: const EdgeInsets.fromLTRB(40, 5, 0, 0),
                            child: SizedBox(
                              width: 340,
                              height: 40,
                              child: TextField(
                                style: GoogleFonts.montserrat(),
                                decoration: const InputDecoration(
                                  border: OutlineInputBorder(
                                    borderSide: BorderSide(color: Colors.black),
                                    borderRadius: BorderRadius.all(
                                      Radius.circular(5),
                                    ),
                                  ),
                                  focusedBorder: OutlineInputBorder(
                                    borderSide: BorderSide(color: Colors.black),
                                    borderRadius: BorderRadius.all(
                                      Radius.circular(5),
                                    ),
                                  ),
                                  contentPadding:
                                      EdgeInsets.fromLTRB(10, 0, 0, 0),
                                ),
                              ),
                            ),
                          ),
                        ],
                      ),
                      const Row(
                        mainAxisAlignment: MainAxisAlignment.start,
                        children: [
                          Padding(
                            padding: EdgeInsets.fromLTRB(40, 10, 0, 0),
                            child: TextMedium(
                              text: 'Password',
                            ),
                          ),
                        ],
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.start,
                        children: [
                          Padding(
                            padding: const EdgeInsets.fromLTRB(40, 5, 0, 0),
                            child: SizedBox(
                              width: 340,
                              height: 40,
                              child: TextField(
                                style: GoogleFonts.montserrat(),
                                decoration: const InputDecoration(
                                  border: OutlineInputBorder(
                                    borderSide: BorderSide(color: Colors.black),
                                    borderRadius: BorderRadius.all(
                                      Radius.circular(5),
                                    ),
                                  ),
                                  focusedBorder: OutlineInputBorder(
                                    borderSide: BorderSide(color: Colors.black),
                                    borderRadius: BorderRadius.all(
                                      Radius.circular(5),
                                    ),
                                  ),
                                  contentPadding:
                                      EdgeInsets.fromLTRB(10, 0, 0, 0),
                                ),
                              ),
                            ),
                          ),
                        ],
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.end,
                        children: [
                          Padding(
                            padding: const EdgeInsets.fromLTRB(0, 5, 35, 0),
                            child: InkWell(
                              onTap: () {
                                Navigator.of(context).push(
                                  PageAnimationTransition(
                                    page: const ForgotPageScreen(),
                                    pageAnimationType: RightToLeftTransition(),
                                  ),
                                );
                              },
                              child: const TextSmall(text: 'Forgot Password'),
                            ),
                          ),
                        ],
                      ),
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          Padding(
                            padding: const EdgeInsets.fromLTRB(0, 20, 0, 0),
                            child: MyButton(
                              onPressed: () {
                                Get.to(() => NavigationMenu());
                              },
                              text: 'LOG IN',
                            ),
                          ),
                        ],
                      ),
                      const SizedBox(
                        height: 5,
                      ),
                      const Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          TextSmall(
                            text: 'Don\'t have an account?',
                          ),
                          MySpacing(
                            width: 5,
                          ),
                          TextSmall(
                            text: 'Create One.',
                            fontWeight: FontWeight.w600,
                          )
                        ],
                      ),
                    ],
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
