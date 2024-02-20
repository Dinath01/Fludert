import 'package:flutter/material.dart';

class SignButton extends StatelessWidget {

  final Function()? onTap;
  const SignButton ({super.key, required this.onTap});

  @override
  Widget build (BuildContext context){
    return GestureDetector(
      onTap: onTap,
      child: Container(
<<<<<<< HEAD
        padding: EdgeInsets.all(15),
        margin: EdgeInsets.symmetric(horizontal: 220),
=======
        padding: const EdgeInsets.all(15),
        margin: const EdgeInsets.symmetric(horizontal: 120),
>>>>>>> 1ec2fe7dbff4cf7df2d52443b5c4a402232f589c
        decoration: BoxDecoration(
          color: Colors.purple[900],
          borderRadius: BorderRadius.circular(10),
        ),
        child: const Center(
          child: Text(
            "Sign In",
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