import 'package:flutter/material.dart';
import 'package:foodies/widgets/custom_container_widgets.dart';
import 'package:foodies/widgets/custom_spacing_widgets.dart';
import 'package:foodies/widgets/custom_text_widgets.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:lucide_icons/lucide_icons.dart';

class ForgotPageScreen extends StatefulWidget {
  const ForgotPageScreen({super.key});

  @override
  State<ForgotPageScreen> createState() => _ForgotPageScreenState();
}

class _ForgotPageScreenState extends State<ForgotPageScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: true,
        leading: GestureDetector(
          onTap: () {
            Navigator.of(context).pop();
          },
          child: const Icon(LucideIcons.chevronLeft),
        ),
        backgroundColor: Colors.white,
      ),
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
            Center(
              child: Padding(
                padding: const EdgeInsets.fromLTRB(10, 0, 10, 0),
                child: MyContainer(
                  height: 200,
                  width: 200,
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      const Padding(
                        padding: EdgeInsets.fromLTRB(0, 20, 0, 0),
                        child: TextMedium(
                          text: 'Forgot Password',
                          fontWeight: FontWeight.normal,
                        ),
                      ),
                      const MySpacing(
                        height: 10,
                      ),
                      const Row(
                        mainAxisAlignment: MainAxisAlignment.start,
                        children: [
                          Padding(
                            padding: EdgeInsets.fromLTRB(25, 0, 0, 0),
                            child: TextSmall(text: 'Write your email : '),
                          )
                        ],
                      ),
                      const MySpacing(
                        height: 10,
                      ),
                      SizedBox(
                        width: 340,
                        height: 40,
                        child: TextField(
                          style: GoogleFonts.montserrat(),
                          decoration: const InputDecoration(
                            border: OutlineInputBorder(
                              borderSide: BorderSide(color: Colors.black),
                              borderRadius:
                                  BorderRadius.all(Radius.circular(5)),
                            ),
                            enabledBorder: OutlineInputBorder(
                              borderSide: BorderSide(color: Colors.black),
                              borderRadius:
                                  BorderRadius.all(Radius.circular(5)),
                            ),
                            focusedBorder: OutlineInputBorder(
                              borderSide: BorderSide(color: Colors.black),
                              borderRadius:
                                  BorderRadius.all(Radius.circular(5)),
                            ),
                            contentPadding: EdgeInsets.fromLTRB(10, 0, 0, 0),
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}
