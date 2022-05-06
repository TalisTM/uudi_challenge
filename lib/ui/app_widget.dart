import 'package:flutter/material.dart';
import 'package:uudi_challenge/ui/pages/home_page.dart';

class AppWidget extends StatelessWidget {
  const AppWidget({ Key? key }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      title: 'UUDI Challenge',
      debugShowCheckedModeBanner: false,
      home: HomePage(),
    );
  }
}