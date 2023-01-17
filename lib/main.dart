import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:planner_app/screens/add_task_screen.dart';
import 'package:planner_app/screens/home_screen.dart';
import 'package:planner_app/services/cache/cache.dart';
import 'package:planner_app/services/cache/cache_impl.dart';
import 'package:planner_app/usecase/task/add_task_case.dart';
import 'package:planner_app/usecase/user/login_user_case.dart';
import 'package:planner_app/utils/setup.dart';

import 'di/injection.dart';
import 'models/user/user_request.dart';

void main() async{
  WidgetsFlutterBinding.ensureInitialized();
  await Di.initialize(cacheImpl: CacheImpl());
 //  Setup.setUp();
  runApp(const MyApp());

  SystemChrome.setSystemUIOverlayStyle(const SystemUiOverlayStyle(
      statusBarColor: Colors.transparent,
      statusBarIconBrightness: Brightness.dark));
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Flutter Demo',
      theme: ThemeData(
        scaffoldBackgroundColor: Colors.white,
        primarySwatch: Colors.blue,
      ),
      home: const HomeScreen()
    );
  }
}