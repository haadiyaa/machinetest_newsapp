import 'package:flutter/material.dart';
import 'package:machinetest_newsapp/utils/constants.dart';
import 'package:machinetest_newsapp/utils/mytextstyle.dart';
import 'package:machinetest_newsapp/view/loginview/widgets/customtestfield.dart';

class LoginPage extends StatelessWidget {
  LoginPage({super.key});
  final TextEditingController name = TextEditingController();
  final TextEditingController email = TextEditingController();
  final TextEditingController password = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Constants.transparent,
        title: const Text(
          'MyNews',
          style: MyTextStyle.bluetext,
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.all(20),
        child: Column(
          children: [
            CustomTextfield(
              text: 'Name',
              textEditingController: name,
            ),
            CustomTextfield(
              text: 'Email',
              textEditingController: email,
            ),
            CustomTextfield(
              text: 'Password',
              textEditingController: password,
            ),
          ],
        ),
      ),
    );
  }
}
