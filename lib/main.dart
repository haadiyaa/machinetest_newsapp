import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:machinetest_newsapp/utils/constants.dart';
import 'package:machinetest_newsapp/view/authenticationview/view/loginpage.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    final size=MediaQuery.of(context).size;
    return ScreenUtilInit(
      designSize: Size(size.width,size.height),
      builder: (context, child) => MaterialApp(
        theme: ThemeData(
          scaffoldBackgroundColor: Constants.bgColor,
          fontFamily: 'Poppins',
        ),
        debugShowCheckedModeBanner: false,
        home: child,
      ),
      child: LoginPage(),
    );
  }
}
