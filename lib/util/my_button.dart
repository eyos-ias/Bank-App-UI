import 'package:flutter/material.dart';

class MyButton extends StatelessWidget {
  final String? iconImagePath;
  final String? buttonText;
  const MyButton({super.key, this.buttonText, this.iconImagePath});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Container(
          height: 90,
          padding: EdgeInsets.all(8),
          decoration: BoxDecoration(boxShadow: [
            BoxShadow(
              color: Colors.grey.shade400,
              blurRadius: 15,
              spreadRadius: 10,
            ),
            BoxShadow(),
          ], color: Colors.white, borderRadius: BorderRadius.circular(20)),
          child: Image.asset(iconImagePath!),
        ),
        SizedBox(height: 8),
        Text(
          buttonText!,
          style: TextStyle(
              fontSize: 18,
              fontWeight: FontWeight.bold,
              color: Colors.grey[700]),
        ),
      ],
    );
  }
}
