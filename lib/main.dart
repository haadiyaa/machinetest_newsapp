import 'package:flutter/material.dart';
import 'package:machinetest_newsapp/utils/constants.dart';
import 'package:machinetest_newsapp/view/authenticationview/view/loginpage.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData(
        scaffoldBackgroundColor: Constants.bgColor,
        fontFamily: 'Poppins',
      ),
      debugShowCheckedModeBanner: false,
      home: LoginPage(),
    );
  }
}
