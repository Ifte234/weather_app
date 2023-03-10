import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:weather_app/screens/home_screen.dart';
void main() {
  runApp(const MyApp());
}
class MyApp extends StatefulWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      home: HomeScreen(),
      title: 'Weather App',
      debugShowCheckedModeBanner: false,
    );
  }
}

