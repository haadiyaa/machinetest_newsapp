import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:machinetest_newsapp/firebase_options.dart';
import 'package:machinetest_newsapp/utils/constants.dart';
import 'package:machinetest_newsapp/view/authenticationview/view/loginpage.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );
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
