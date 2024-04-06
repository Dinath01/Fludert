import 'package:flutter/material.dart';
import 'package:flutter_inset_box_shadow/flutter_inset_box_shadow.dart' as InsetBoxShadow;

class GuestLogButton extends StatelessWidget {
  final Function()? onTap;
  const GuestLogButton({required this.onTap});

  @override
  Widget build(BuildContext context) {
    Offset distance = Offset(28, 28);
    double blur = 30.0;

    BoxShadow innerShadow = BoxShadow(
      blurRadius: blur,
      offset: -distance,
      color: Colors.white,
      spreadRadius: 0,
    );

    BoxShadow outerShadow = BoxShadow(
      blurRadius: blur,
      offset: distance,
      color: Color(0xFFA7A9AF),
      spreadRadius: 0,
    );

    return GestureDetector(
      onTap: onTap,
      child: Container(
        padding: EdgeInsets.all(15),
        margin: EdgeInsets.symmetric(horizontal: 220),
        decoration: BoxDecoration(
          color: Colors.blue,
          boxShadow: [
            innerShadow,
            outerShadow,
          ],
          borderRadius: BorderRadius.circular(10),
        ),
        child: Center(
          child: Text(
            "Guest Entry",
            style: TextStyle(
              color: Colors.white,
              fontWeight: FontWeight.bold,
              fontSize: 16,
            ),
          ),
        ),
      ),
    );
  }
}