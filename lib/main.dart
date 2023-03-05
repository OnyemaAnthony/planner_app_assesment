import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:planner_app/screens/home_screen.dart';

void main() async{
  WidgetsFlutterBinding.ensureInitialized();
  runApp( MyApp());

  SystemChrome.setSystemUIOverlayStyle(const SystemUiOverlayStyle(
      statusBarColor: Colors.transparent,
      statusBarIconBrightness: Brightness.dark));
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false, theme: ThemeData(
        scaffoldBackgroundColor: Colors.white,
        primarySwatch: Colors.blue,
      ),
      home: const HomeScreen()
    );
  }
}