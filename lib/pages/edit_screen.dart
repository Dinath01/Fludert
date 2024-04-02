import 'dart:ui';

import 'package:fludert/assets/edit_item.dart';
import 'package:flutter/material.dart';
import 'package:ionicons/ionicons.dart';
import 'package:rive/rive.dart';

class EditAccountScreen extends StatefulWidget {
  const EditAccountScreen({super.key});

  @override
  State<EditAccountScreen> createState() => _EditAccountScreenState();
}

class _EditAccountScreenState extends State<EditAccountScreen> {
  String gender = "man";

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          leading: IconButton(
            onPressed: () {
              Navigator.pop(context);
            },
            icon: const Icon(Ionicons.chevron_back_outline),
          ),
          leadingWidth: 80,
          actions: [
            Padding(
              padding: const EdgeInsets.only(right: 10),
              child: IconButton(
                onPressed: () {},
                style: IconButton.styleFrom(
                  backgroundColor: Colors.lightBlueAccent,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(15),
                  ),
                  fixedSize: Size(60, 50),
                  elevation: 3,
                ),
                icon: Icon(Ionicons.checkmark, color: Colors.white),
              ),
            ),
          ],
        ),
        body: Stack(children: [
          Positioned(
            width: MediaQuery.of(context).size.width * 1.7,
            left: 100,
            bottom: 100,
            child: Image.asset(
              "assets/images/Spline.png",
            ),
          ),
          Positioned.fill(
            child: BackdropFilter(
              filter: ImageFilter.blur(sigmaX: 20, sigmaY: 20),
              child: const SizedBox(),
            ),
          ),
          const RiveAnimation.asset(
            "assets/images/shapes.riv",
          ),
          Positioned.fill(
            child: BackdropFilter(
              filter: ImageFilter.blur(sigmaX: 30, sigmaY: 30),
              child: const SizedBox(),
            ),
          ),
          SingleChildScrollView(
            child: Padding(
              padding: const EdgeInsets.all(30),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const Text(
                    "Account",
                    style: TextStyle(
                      fontSize: 36,
                      fontWeight: FontWeight.bold,
                      fontFamily: "Jura",
                    ),
                  ),
                  const SizedBox(height: 40),
                  EditItem(
                    title: "Photo",
                    widget: Column(
                      children: [
                        Image.asset(
                          "assets/images/avatar.png",
                          height: 100,
                          width: 100,
                        ),
                        TextButton(
                          onPressed: () {},
                          style: TextButton.styleFrom(
                            foregroundColor: Colors.lightBlueAccent,
                          ),
                          child: const Text(
                            "Upload Image",
                          ),
                        )
                      ],
                    ),
                  ),
                  const EditItem(
                    title: "Name",
                    widget: TextField(),
                  ),
                  const SizedBox(height: 40),
                  const EditItem(
                    widget: TextField(),
                    title: "Email",
                  ),
                  const SizedBox(height: 40),
                  const EditItem(
                    widget: TextField(),
                    title: "Password",
                  ),
                  const SizedBox(height: 40),
                  const EditItem(
                    widget: TextField(),
                    title: "Age",
                  ),
                  const SizedBox(height: 40),
                  const EditItem(
                    widget: TextField(),
                    title: "Location",
                  ),
                ],
              ),
            ),
          ),
        ]));
  }
}
