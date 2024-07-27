import 'package:flutter/material.dart';
import 'package:machinetest_newsapp/utils/constants.dart';
import 'package:machinetest_newsapp/utils/mytextstyle.dart';
import 'package:machinetest_newsapp/view/authenticationview/view/signuppage.dart';
import 'package:machinetest_newsapp/view/authenticationview/widgets/custombutton.dart';
import 'package:machinetest_newsapp/view/authenticationview/widgets/customtestfield.dart';

class LoginPage extends StatelessWidget {
  LoginPage({super.key});
  final TextEditingController email = TextEditingController();
  final TextEditingController password = TextEditingController();
  final _formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Constants.transparent,
        title: const Text(
          Constants.appBarHead,
          style: MyTextStyle.bluetextBold,
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.all(20),
        child: SingleChildScrollView(
          child: SizedBox(
            height: size.height * 0.75,
            child: Column(
              children: [
                const Spacer(),
                Form(
                  key: _formKey,
                  child: Column(
                    children: [
                      CustomTextfield(
                        validator: (value) {
                          if (value == null || value.isEmpty) {
                                return "Email is required";
                              }
                              final emailReg = RegExp(
                                  r"^[a-zA-Z0-9_\-\.\S]{4,}[@][a-z]+[\.][a-z]{2,3}[\s]*$");
                              if (!emailReg.hasMatch(value)) {
                                return 'Invalid email address!';
                              }return null;
                        },
                        text: 'Email',
                        textEditingController: email,
                      ),
                      CustomTextfield(
                        validator: (value) {
                          final paswd = RegExp(
                                  r'^(?=.*\d)[a-zA-Z0-9].{6,}$');
                              if (value!.isEmpty) {
                                return 'please enter the password';
                              }else if(value.length<6){
                                return 'Please enter atleast 6 characters!';
                              }
                               else if (!paswd.hasMatch(value)) {
                                return 'Password should contain atleast one digit';
                              }return null;
                        },
                        text: 'Password',
                        textEditingController: password,
                      ),
                    ],
                  ),
                ),
                const Spacer(
                  flex: 2,
                ),
                Column(
                  children: [
                    CustomButton(
                      size: size,
                      text: 'Login',
                      onPressed: () {
                        _formKey.currentState!.validate();
                      },
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        const Text('New here? '),
                        TextButton(
                          onPressed: () {
                            Navigator.pushReplacement(context, MaterialPageRoute(builder: (_)=>SignupPage()));
                          },
                          child: const Text(
                            'Signup',
                            style: MyTextStyle.bluetextBold,
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
