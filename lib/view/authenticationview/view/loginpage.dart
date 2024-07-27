import 'package:flutter/material.dart';
import 'package:machinetest_newsapp/utils/constants.dart';
import 'package:machinetest_newsapp/utils/mytextstyle.dart';
import 'package:machinetest_newsapp/view/authenticationview/widgets/custombutton.dart';
import 'package:machinetest_newsapp/view/authenticationview/widgets/customtestfield.dart';

class LoginPage extends StatelessWidget {
  LoginPage({super.key});
  final TextEditingController name = TextEditingController();
  final TextEditingController email = TextEditingController();
  final TextEditingController password = TextEditingController();

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Constants.transparent,
        title: const Text(
          'MyNews',
          style: MyTextStyle.bluetextBold,
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.all(20),
        child: SingleChildScrollView(
          child: SizedBox(
            height: size.height * 0.75,
            child: Column(
              // mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                const Spacer(),
                Column(
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
                const Spacer(
                  flex: 2,
                ),
                Column(
                  children: [
                    CustomButton(
                      size: size,
                      text: 'Signup',
                      onPressed: () {},
                    ),
                    // Constants.height10,
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        const Text('Already have an account? '),
                        TextButton(
                          onPressed: () {},
                          child: const Text(
                            'Login',
                            style: MyTextStyle.bluetextnormal,
                          ),
                        )
                      ],
                    ),
                  ],
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
