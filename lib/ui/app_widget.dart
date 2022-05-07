import 'package:flutter/material.dart';
import 'package:uudi_challenge/ui/pages/home_page.dart';
import 'package:uudi_challenge/ui/themes/light_theme.dart';

class AppWidget extends StatelessWidget {
  const AppWidget({ Key? key }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'UUDI Challenge',
      debugShowCheckedModeBanner: false,
      theme: LightTheme.lightTheme,
      home: const HomePage(),
    );
  }
}