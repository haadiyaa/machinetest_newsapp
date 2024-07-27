import 'package:flutter/material.dart';
import 'package:machinetest_newsapp/controller/authprovider.dart';
import 'package:machinetest_newsapp/utils/constants.dart';
import 'package:machinetest_newsapp/utils/mytextstyle.dart';
import 'package:machinetest_newsapp/utils/validators.dart';
import 'package:machinetest_newsapp/view/authenticationview/view/loginpage.dart';
import 'package:machinetest_newsapp/view/authenticationview/widgets/custombutton.dart';
import 'package:machinetest_newsapp/view/authenticationview/widgets/customtestfield.dart';
import 'package:machinetest_newsapp/view/homeview/view/homepage.dart';
import 'package:provider/provider.dart';

class SignupPage extends StatelessWidget {
  SignupPage({super.key});
  final TextEditingController name = TextEditingController();
  final TextEditingController email = TextEditingController();
  final TextEditingController password = TextEditingController();
  final _formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    final authProvider = Provider.of<AuthProvider>(context);
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
                          return Validators.nameValidator(value);
                        },
                        text: 'Name',
                        textEditingController: name,
                      ),
                      CustomTextfield(
                        validator: (value) {
                          return Validators.emailValidator(value);
                        },
                        text: 'Email',
                        textEditingController: email,
                      ),
                      CustomTextfield(
                        validator: (value) {
                          return Validators.passValidator(value);
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
                      text: 'Signup',
                      onPressed: () async {
                        if (authProvider.isLoading) {
                          ScaffoldMessenger.of(context)
                            ..hideCurrentSnackBar()
                            ..showSnackBar(
                              const SnackBar(content: Text('Please Wait...')),
                            );
                        }
                        if (_formKey.currentState!.validate()) {
                          await authProvider
                              .signUp(
                                  name: name.text.trim(),
                                  email: email.text.trim(),
                                  password: password.text.trim())
                              .then(
                            (value) {
                              if (authProvider.status==Status.error) {
                                ScaffoldMessenger.of(context)
                                  ..hideCurrentSnackBar()
                                  ..showSnackBar(
                                    SnackBar(content: Text(authProvider.error)),
                                  );
                              } else {
                                Navigator.pushReplacement(
                                    context,
                                    MaterialPageRoute(
                                        builder: (_) => const HomePage()));
                              }
                            },
                          );
                        }
                      },
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        const Text('Already have an account? '),
                        TextButton(
                          onPressed: () {
                            Navigator.pushReplacement(context,
                                MaterialPageRoute(builder: (_) => LoginPage()));
                          },
                          child: const Text(
                            'Login',
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
