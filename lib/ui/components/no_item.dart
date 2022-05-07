import 'package:flutter/material.dart';

class NoItem extends StatelessWidget {
  final String title;
  final String subtitle;
  const NoItem({ Key? key,required this.title, required this.subtitle}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 20),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Image.asset(
          "assets/images/logo2.png",
          height: 100,
          fit: BoxFit.cover,
        ),
        const SizedBox(height: 20),
        Text(
          title,
          textAlign: TextAlign.center,
          style: const TextStyle(
            fontSize: 30,
            fontWeight: FontWeight.w600
          ),
        ),
        const SizedBox(height: 16),
        Text(
          subtitle,
          textAlign: TextAlign.center,
          style: const TextStyle(
            fontSize: 26,
            fontWeight: FontWeight.w400
          ),
        ),
        ],
      )
    );
  }
}