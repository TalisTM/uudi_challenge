import 'package:flutter/material.dart';
import 'package:uudi_challenge/app/dependencies_init.dart';
import 'package:uudi_challenge/app/firebase_init.dart';
import 'package:uudi_challenge/ui/app_widget.dart';

class AppInit {
  static void init() async {
    WidgetsFlutterBinding.ensureInitialized();

    await FirebaseInit.init();
    Dependencies.init();
    
    runApp(const AppWidget());
  }
}